class Array
    include Enumerable
        def each_permuted #เรียงสับเปลี่ยน
            @buffer_arr = []
            number_can_used = (0...self.length).to_a
            self.each do |item|
                random_number = rand(number_can_used.length) #สุ่มเลข
                random_index = number_can_used[random_number] #สุ่มดัชนีเพื่อใช้ map ข้อมูล
                item_pair = {}
                item_pair[random_index] = item
                @buffer_arr << item_pair #ยัด hash เข้าท้าย array
                number_can_used.delete_at(random_number) #ลบดัชนีที่สุ่มใช้ไปแล้ว
            end
            @buffer_arr.each {|item| item.each {|index,value| self[index]=value}} #map
            self.each {|y|} #ทำเป็น array หลักเพื่อใช้ module enum ได้
        end
end
print [5,4,6,7].each_permuted      
