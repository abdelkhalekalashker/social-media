# frozen_string_literal: true

# queue implementation
class Queue
  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(element)
    @queue.push(element)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end

  def empty?
    @queue.empty?
  end
end

queue = Queue.new([1, 2, 3, 4, 5, 6, 7, 8])
queue.enqueue(9) # O(1)
p queue.instance_variable_get(:@queue)
queue.dequeue # O(n)
p queue.instance_variable_get(:@queue)
puts queue.peek # O(1)
