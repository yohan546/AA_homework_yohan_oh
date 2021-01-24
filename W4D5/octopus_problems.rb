fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octupus(array) 
    longest_fish = nil 
    (0...array.length).each do |i|
        (0...array.length).each do |j|
            next if i == j
            fish1 = array[i]
            fish2 = array[j]

            if longest_fish.nil? || fish2.length > fish1.length 
                longest_fish = fish2 
            end
        end
        return longest_fish
    end     
end

# p sluggish_octupus(fishes) #O(n^2)

class Array 

    def merge_sort(&prc)
        prc ||= Proc.new {|a,b| a.length <=> b.length}
        return self if count <= 1 

        mid = count / 2
        sorted_left = self.take(mid).merge_sort(&prc)
        sorted_right = self.drop(mid).merge_sort(&prc)

        Array.merge(sorted_left, sorted_right, &prc)
    end

    private 
    def self.merge(left, right, &prc) 
        merged = []

        until left.empty? || right.empty?
            if prc.call(left.first, right.first) < 0
                merged << left.shift 
            else
                merged << right.shift 
            end
        end
        left + merged + right 
    end
end

def nlogn_dominant_octopus(fishes)
    sorted = fishes.merge_sort
    return sorted[-1]
end


# p nlogn_dominant_octopus(fishes) #O(nlogn)


def clever_octopus(fishes)
    longest_fish = fishes[0]

    fishes.each do |fish|
        if fish.length > longest_fish.length
            longest_fish = fish 
        end
    end
    return longest_fish
end

# p clever_octopus(fishes) #O(n)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(string, tiles)
    tiles.each_with_index do |tile, idx|
        if tile == string 
            return idx
        end
    end
end

# p slow_dance("right-up", tiles_array) # O(n)

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance(direction, tiles_hash)
    tiles_hash[direction]
end

p constant_dance('left', tiles_hash) #O(n)

