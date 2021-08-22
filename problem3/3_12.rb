require_relative '3_11'
class B_Tree < BinaryTree
    include Enumerable
    attr_accessor :buffer_arr
    def each
        self.buffer_arr = []
        super {|val| self.buffer_arr << val}
        self.buffer_arr.each {|y| yield y}
    end
end

tree = B_Tree.new(5)
tree.insert(7)
tree.insert(6)
tree.each {|y| print y.to_str+","}
print "\n"
print tree.any?
print "\n"
print tree.all?
tree.sort