class Stack
    attr_reader :array

    def initialize(array)
      array = Array.new
    end

    def push(el)
      array.push(el)
    end

    def pop
      array.pop
    end

    def peek
      array[-1]
    end
end



  class Queue

    attr_reader : array 

    def initialize
        @array = Array.new
    end

  
    def enqueue(el)
        array.push(el)
    end
    
    def dequeue
        array.shift
    end
    
    def peek
        array.first
    end

  end


  class Map

    attr_reader :array

    def initialize
      array = Array.new
    end
  
    def set(key, value)
        array.each_with_index do |pair, idx|
            if pair[0] == key
                array[idx][1] = value
            else
                array.push([key, value])
            end
        end
    end
  
    def get(key)
        array.each do |pair|
            if pair[0] == key
                return pair[1]
            end
        end
        nil
    end
  
    def delete(key)
        array.reject! do |pair|
            pair[0] == key
        end
    end
  
    def show
      array.each do |pair|
        puts pair
      end
    end
  
    

  end
