# frozen_string_literal: true

# Node Class
class Node
  attr_accessor :node_value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end
