require 'thread'

class Workers
  # Create a new set of worker threads. A thread is started for each
  # worker and the block is called for each job scheduled using
  # Workers#run. The return value of the block is the result of the
  # job and is passed to the result handler set using
  # Workers#on_result.
  #
  # Parameters:
  #
  # +worker_count+: Number of workers (default 4)
  # +queue_length+: Length of job queue (default twice the number of workers)
  # +block+: Block to invoke to process each job
  def initialize(worker_count = 4, queue_length = worker_count * 2, &block)
    @inqueue = Queue.new
    @outqueue = Queue.new
    @jobcount = 0
    @queue_length = queue_length
    @threads = Array.new(worker_count) do
      Thread.new(@inqueue, block, &method(:main_loop))
    end
  end

  # Set result handler (block). This block is called for each result
  # returned from a worker. The block shall take two parameters, job
  # and result value. The result handler is always invoked in the same
  # thread that calls Workers#run or Workers#job (usually the main
  # thread).
  #
  # Parameters:
  #
  # +block+: Block that handles the result.
  def on_result(&block)
    @result_handler = block
  end

  # Add a job to the job queue. Will also process results and invoke
  # the result handler if the job queue is full.
  #
  # Parameters:
  #
  # +job+: Job (of any class) to pass to the worker.
  def run(job)
    if @inqueue.size >= @queue_length
      @result_handler.call(*result)
    end
    @inqueue.push(job)
    @jobcount += 1
    nil
  end

  # Waits for remainings jobs to be processed (and invokes result
  # handler for each result). You can call this to ensure all results
  # have been processed, or you can call Workers#join which will do
  # the same.
  def complete
    @result_handler.call(*result) while @jobcount > 0
  end
  
  # Waits for remainings jobs to be processed (and invokes result
  # handler for each result), then stops all workers and returns. Call
  # this after all jobs have been added.
  def join
    complete
    @threads.size.times { @inqueue.push(nil) }
    @threads.each { |thr| thr.join }
  end
  
  private
  def result
    job, result = @outqueue.pop
    @jobcount -= 1

    if result.kind_of?(Exception)
      result.backtrace.push("----- via Workers ----")
      result.backtrace.push(*caller)
      raise result
    else
      return job, result
    end
  end

  private
  def main_loop(inqueue, block)
    while job = inqueue.pop
      begin
        begin
          result = block.call(job)
          @outqueue.push([job,result])
        rescue Exception => e
          @outqueue.push([job,e])
        end
      end
    end
  end
end

if $0 == __FILE__
  workers = Workers.new do |job|
    Thread.exclusive { puts "Working on #{job}" }
    sleep(0.1 + 0.1 * rand)
    Thread.exclusive { puts "Done with #{job}" }
    job * 2
  end

  workers.on_result do |job, result|
    p [job, result]
  end

  16.times do |i|
    workers.run(i)
  end

  workers.join
end
