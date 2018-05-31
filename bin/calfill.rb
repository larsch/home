#!/usr/bin/env ruby
require 'win32ole'
require 'date'

module OleConst
end

@outlook = WIN32OLE.new("Outlook.Application")
WIN32OLE.const_load(@outlook, OleConst)

def join_time(date, time)
  Time.new(date.year, date.month, date.day, time.hour, time.min, time.sec)
end

def all
  namespace = @outlook.GetNameSpace("MAPI")
  folder = namespace.GetDefaultFolder(OleConst::OlFolderCalendar)
  folder.items.each do |item|
    yield item
  end
end

def all_on(date)
  namespace = @outlook.GetNameSpace("MAPI")
  folder = namespace.GetDefaultFolder(OleConst::OlFolderCalendar)
  folder.Items.each do |item|
    next if item.AllDayEvent
    if item.IsRecurring
      pattern = item.GetRecurrencePattern

      # Find occurrence on this date
      begin
        if occurrence = pattern.GetOccurrence(date.to_time)
          p [:occurrence, occurrence.subject]
          yield occurrence.Subject, occurrence.Start, occurrence.End
          occurrence.ole_free
        end
      rescue Exception => e
        puts "#{item.subject}: #{e.message}"
      end

      # Find exceptions
      pattern.Exceptions.each do |exception|
        begin
          exceptionItem = exception.AppointmentItem
          if exceptionItem.Start.to_date == date
            yield exceptionItem.Subject, exceptionItem.Start, exceptionItem.End
          end
        rescue Exception => e
        end
      end

      # if pattern.RecurrenceType == OleConst::OlRecursWeekly
      #   next if pattern.PatternStartDate.to_date > date
      #   next unless pattern.NoEndDate or pattern.PatternEndDate.to_date >= date
      #   next if pattern.DayOfWeekMask & (1 << date.wday) == 0
      #   delta = date - pattern.PatternStartDate.to_date
      #   next unless delta % pattern.Interval == 0
      #   st = pattern.StartTime
      #   start_time = Time.new()
      #   yield item.Subject, join_time(date, pattern.StartTime), join_time(date, pattern.EndTime)
      # else
      #   # p OleConst::OlRecursDaily
      #   # p OleConst::OlRecursMonthly
      #   # p OleConst::OlRecursMonthNth
      #   # p OleConst::OlRecursYearly
      #   # p OleConst::OlRecursYearNth
      #   puts "Unsupported recurrence type #{pattern.RecurrenceType}"
      # end
      item.ole_free
    else
      if item.Start.to_date == date
        yield item.Subject, item.Start, item.End
      end
    end
  end
end

def emit(st, en)
  item = @outlook.CreateItem(OleConst::OlAppointmentItem)
  item.Subject = "Work"
  item.Start = st
  item.Duration = ((en - st) / 60.0).to_i
  item.BusyStatus = OleConst::OlBusy
  item.ReminderSet = false
  item.Save
end

def fill(date)
  all = []
  all_on(date) do |*x|
    all << x
  end
  app = all.sort_by { |s, start, endt| start }
  nx = Time.new(date.year, date.month, date.day, 8, 0, 0)
  ed = Time.new(date.year, date.month, date.day, 17, 0, 0)
  until app.empty?
    emit nx, app.first[1] if nx < app.first[1]
    nx = app.first[2]
    app.shift
  end
  emit nx, ed if nx < ed
  Time.new()
  require 'pp'
end

class Date
  def next_workday
    nx = next_day
    nx = nx.next_day while nx.wday == 0 || nx.wday == 6
    return nx
  end
end

def delete_old
  delete = []
  all do |item|
    next if item.AllDayEvent
    next if item.IsRecurring
    next unless item.Subject == "Work"
    delete << item
  end
  delete.each { |item| item.Delete }
end

# all_on(Date.today) do |entry|
#   p entry
# end

delete_old
date = Date.today
fill(date) if Time.now.hour < 15
fill(date.next_workday)
fill(date.next_workday.next_workday) if Time.now.hour >= 15
