require_relative './node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
    # your code here
    nodes_to_search = @root ? [@root] : []
  
      while nodes_to_search.length > 0
        current_node = nodes_to_search.shift

        if current_node.nil?
          return nil
        elsif current_node.value == value
          return current_node
        else
          if value < current_node.value
            nodes_to_search.push(current_node.left)
          elsif value > current_node.value
            nodes_to_search.push(current_node.right)
          end
        end
      end
  end

  def insert(value)
    # your code here
    if @root.nil?
      @root = Node.new(value)
    end
    nodes_to_search = [@root]

    while nodes_to_search.length > 0
      current_node = nodes_to_search.shift

      if value == current_node.value
        return current_node
      else
        if value > current_node.value
          if current_node.right
            nodes_to_search.push(current_node.right)       
          else
            new_node = Node.new(value)
            current_node.right = new_node
            return new_node
          end
        else
          if value < current_node.value
            if current_node.left
              nodes_to_search.push(current_node.left)
            else
              new_node = Node.new(value)
              current_node.left = new_node
              return new_node
            end
          end
        end
      end
    end 
  end

end 
