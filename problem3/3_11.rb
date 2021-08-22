class BinaryTree
    attr_accessor :key, :left, :right
    def initialize(key)
        self.key = key
        self.left = nil
        self.right = nil
    end
    def insert(val,root=self)
        if val < root.key #ถ้าค่าที่แทรกเข้าไปมีค่าน้อยกว่า node
            if root.left == nil #ถ้าทางซ้ายไม่มีรากต่อไป
                root.left = BinaryTree.new(val)
            elsif
                root.insert(val,root.left) #ถ้ามีรากทางซ้าย ให้ท่องซ้ายก่อน
            end
        elsif #ถ้าค่าที่แทรกเข้าไปมีค่ามากกว่า node
            if root.right == nil #ถ้าทางขวาไม่มีรากต่อไป
                root.right = BinaryTree.new(val)
            elsif
                root.insert(val,root.right) #ถ้ามีทางขวา ให้ท่องซ้ายก่อน
            end
        end
    end
    def empty?
        return true if self.left == nil && self.right == nil or return false
    end
    def each #inorder travesal
        unless self.empty?  #ไม่ใช่รากสุดท้ายใช่ไหม
            self.left.each {|val| yield val} unless self.left == nil #ทางซ้ายมีรากใช่ไหม ถ้ามีให้ท่องซ้าย
            yield self.key
            self.right.each {|val| yield val} unless self.right == nil #ทางขวามีรากใช่ไหม ถ้ามีให้ท่องขวา
        else
            yield self.key #ถ้าไม่มีรากต่อทั้ง 2 ฝั่งให้คือค่า
        end            
    end
end

def test
    tree = BinaryTree.new(5)
    tree.insert(7)
    tree.insert(6)
    tree.insert(4)
    tree.insert(2)
    print tree.empty?
    print "\n"
    puts tree.each {|val| print val.to_s+","}
end
