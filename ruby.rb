class LinkedList
    #include Node
    attr_accessor :name

    def initialize()
        @head = nil
        @tail = nil
    end

    def append(value) #adds a new node contain value at end of list
        if @head == nil
            @head = value
            @tail = value
        else
            @tail.next_node = value
            @tail = value
        end
    end

    def prepend(value) #adds a new node containing value at begining of list
        if @head == nil
            @head = value
            @tail = value
        else
            value.next_node = @head
            @head = value
        end
    end

    def size() #returns total number of nodes
        count = 0
        temp = @head
        while(temp != nil)
            count += 1
            temp = temp.next_node 
        end
        puts "the list is #{count} nodes long"
    end

    def head() #returns the first node in the list
        return @head
    end

    def tail() #returns the last node in the list
        return @tail
    end

    def at(index) #returns the node at the given index
        temp = @head
        (index-1).times { temp = temp.next_node }
        return temp.value
    end

    def pop() #removes the last element from the list
        temp = @head
        while(temp != nil)
            if temp.next_node == @tail
                @tail = temp
                temp.next_node = nil
            end
            temp = temp.next_node
        end
    end

    def contains?(value) #returns true if the passed in value is in the list
        temp = @head
        while(temp != nil)
            return true if temp.value == value   
            temp = temp.next_node 
        end
        return false
    end

    def find(value) #returns the index of the node containing value or nil if not found
        temp = @head
        index = 1
        while(temp != nil)
            return index if temp.value == value   
            temp = temp.next_node 
            index +=1
        end
        return false
    end

    def to_s() #represent your LinkedList objects as strings, so you can pring them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
        temp = @head
        while(temp != nil)
            if temp == @tail
                print "( #{temp.value} )" 
                break
            end 
            print "( #{temp.value} ) -> "
            temp = temp.next_node 
        end
        print "\n"
    end

    def insert_at(value, index) #extra credit insert value at index
        if @head == nil
            @head = value
            @tail = value
        else
            temp = @head
            (index-2).times { temp = temp.next_node }
            place_holder = temp.next_node
            new_value = Node.new(value)
            temp.next_node = new_value
            new_value.next_node = place_holder
        end
    end

    def remove_at(index) #extra credit to remove node at index, make sure up date links of nodes
        if @head == nil
            return
        elsif
            index == 1
            @head = @head.next_node
        else
            temp = @head
            (index-2).times { temp = temp.next_node }
            temp.next_node = temp.next_node.next_node
        end
    end

end

class Node
    attr_accessor :next_node, :value
    def initialize(value)
        @value = value
        @next_node = nil
    end
 
end


linked = LinkedList.new


linked.append(Node.new(1))
linked.append(Node.new(2))
linked.append(Node.new(3))
linked.prepend(Node.new("four"))


linked.to_s()

linked.size()

index = 2
puts "the value of the list at index #{index} is #{linked.at(index)}"

puts linked.contains?("four")

puts linked.find(5)

#linked.pop()



linked.insert_at(5, 3)
linked.to_s()

linked.remove_at(1)
linked.remove_at(3)

linked.to_s()