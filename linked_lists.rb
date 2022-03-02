# frozen_string_literal: true

# Node Class
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Linked List Class
class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @nodes = 0
  end

  def append(value)
    puts "Appending value ( #{value} )"
    @nodes += 1
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    puts "Prepending value ( #{value} )"
    @nodes += 1
    new_node = Node.new(value, @head)
    @tail = new_node if @head.nil?
    @head = new_node
  end

  def head
    "The current head value is ( #{@head.value} )"
  end

  def tail
    "The current tail value is ( #{@tail.value} )"
  end

  def size
    "There are #{@nodes} nodes in this list"
  end

  def to_s
    if @nodes.zero?
      'No nodes'
    elsif @nodes == 1
      "( #{current_location.value} ) -> nil"
    end
    string_value = ''
    current_location = @head
    until current_location.nil?
      string_value += "( #{current_location.value} ) -> "
      current_location = current_location.next_node
    end
    "The current linked list contains these nodes: #{string_value}nil"
  end

  def at(index)
    return @head.value if index.zero?

    node = @head
    next_node = @head.next_node
    index.times do
      node = next_node
      next_node = node.next_node
    end
    "The value at index #{index} is ( #{node.value} )"
  end

  def pop
    puts "Popping tail value, which is ( #{@tail.value} )"
    node = @head
    node = node.next_node until node.next_node.next_node.nil?
    @tail = node
    @tail.next_node = nil
    @nodes -= 1
  end

  def contains?(value)
    node = @head
    @nodes.times do
      return "The list does contain ( #{value} )" if node.value == value

      node = node.next_node unless node.next_node.nil?
    end
    "The list does not contain ( #{value} )"
  end

  def find(value)
    index = 0
    node = @head
    @nodes.times do
      return "The value ( #{value} ) exists at index #{index}" if node.value == value

      node = node.next_node unless node.next_node.nil?
      index += 1
    end
    "The list does not contain ( #{value} )"
  end
end

List = LinkedList.new
List.append('3')
List.prepend('1')
List.prepend('four')
List.prepend('five')
List.prepend('8')
List.append('hundo')
puts List.size
puts List.to_s
puts List.contains?('hundo')
puts List.head
puts List.tail
List.pop
puts List.size
puts List.to_s
puts List.at(2)
puts List.contains?('albert')
puts List.find('four')
puts List.find('hundo')
