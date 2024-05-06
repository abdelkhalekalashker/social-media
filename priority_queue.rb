class PriorityQueue
  def initialize(queue=[])
    @queue = queue
  end

  def enqueue(element, priority)
    @queue.push([element, priority])
    @queue.sort_by! { |ele, priority| priority}
  end

  def dequeue
    @queue.shift&.first
  end

  def peek
    @queue.first&.first
  end

  def is_empty?
    @queue.empty?
  end
end

p_queue = PriorityQueue.new([])
p_queue.enqueue(9, 1) # O(n log n)
p_queue.enqueue(3, 2)
p_queue.enqueue(8, 6)
puts p_queue.dequeue # O(1)
puts p_queue.peek # O(1)