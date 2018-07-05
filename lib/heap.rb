require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.size
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    res = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, count)
    res
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length - 1) unless @store.length - 1 == 0
  end

  public
  def self.child_indices(len, parent_index)
    if (2 * parent_index + 1) > len - 1
      []
    elsif (2 * parent_index + 2) > len - 1
      [(2 * parent_index) + 1]
    else  
      [(2 * parent_index) + 1, (2 * parent_index) + 2]
    end  
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index === 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)

    prc ||= Proc.new { |x, y| x <=> y }

    while BinaryMinHeap.child_indices(len, parent_idx).length > 0
      child_indices = BinaryMinHeap.child_indices(len, parent_idx)
      if (child_indices.length == 1)
        smallest_idx = child_indices.first
      else
        if prc.call(array[child_indices.first], array[child_indices.last]) == -1
          smallest_idx = child_indices.first
        elsif prc.call(array[child_indices.first], array[child_indices.last]) == 1
          smallest_idx = child_indices.last
        else  
          smallest_idx = child_indices.first
        end  
      end
      if prc.call(array[parent_idx], array[smallest_idx]) == 1
        array[parent_idx], array[smallest_idx] = array[smallest_idx], array[parent_idx]
        parent_idx = smallest_idx
      else
        break;
      end    
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)

    prc ||= Proc.new { |x, y| x <=> y }

    while BinaryMinHeap.parent_index(child_idx)
      parent_idx = BinaryMinHeap.parent_index(child_idx)
      if prc.call(array[parent_idx], array[child_idx]) == 1
        array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
        child_idx = parent_idx
      else
        break;
      end
      if child_idx == 0
        break;
      end  
    end
    array
  end
end
