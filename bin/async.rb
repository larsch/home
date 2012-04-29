
def async(obj, method, *args, &block)
  inqueue = Queue.new
  t = Thread.new do
    obj.send(method, *args) do |*result|
      inqueue.push(result)
    end
    inqueue.push(nil)
  end
  while result = inqueue.pop
    p inqueue.size
    yield(*result)
  end
  t.join
end
