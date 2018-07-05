require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new { |a, b| a <=> b }
    partitionEnd = 1
    while partitionEnd < self.length 
      BinaryMinHeap.heapify_up(self, partitionEnd, partitionEnd + 1)
      partitionEnd += 1
    end

    partitionEnd = self.length
    while partitionEnd > 0
      if prc.call(self[0], self[partitionEnd - 1]) == -1 
        self[partitionEnd - 1], self[0] = self[0], self[partitionEnd - 1]
      end
      partitionEnd -= 1
      BinaryMinHeap.heapify_down(self, 0, partitionEnd - 1)
    end
    self.reverse!
    # self.unshift(self.pop)

    # 2.upto(length).each do |size|
    #   BinaryMinHeap.heapify_up(self, size - 1, size)
    # end
    # length.downto(2).each do |size|
    #   p self
    #   self[size - 1], self[0] = self[0], self[size - 1]
    #   BinaryMinHeap.heapify_down(self, 0, size - 1)
    #   p self
    # end
    # self.reverse!
  end

  
end
