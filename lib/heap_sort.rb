require_relative "heap"

class Array
  def heap_sort!
    # # prc = Proc.new { |a, b| b <=> a }
    # partitionEnd = 1
    # while partitionEnd < self.length 
    #   BinaryMinHeap.heapify_up(self, partitionEnd, partitionEnd + 1)
    #   partitionEnd += 1
    # end

    # partitionEnd = self.length
    # while partitionEnd > 0
    #   # debugger
    #   # self.push(self.shift)
    #   self[partitionEnd - 1], self[0] = self[0], self[partitionEnd - 1]
    #   partitionEnd -= 1
    #   BinaryMinHeap.heapify_down(self, partitionEnd, self.length - 1)
    # end  
    # self.unshift(self.pop)
    # self.reverse!

    2.upto(length).each do |size|
      BinaryMinHeap.heapify_up(self, size - 1, size)
    end
    length.downto(2).each do |size|
      self[size - 1], self[0] = self[0], self[size - 1]
      BinaryMinHeap.heapify_down(self, 0, size - 1)
    end
    self.reverse!
  end

  
end
