class Array
    include Enumerable
        def each_with_flattening
            self.each do |s|
                s.each_with_flattening {|s| yield s} if s.is_a? Array or yield s
            end
        end
end
[1, [2, 3], 4, [[5, 6], 7]].each_with_flattening { |s| print "#{s}," }