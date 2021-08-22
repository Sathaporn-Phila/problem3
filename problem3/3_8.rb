# Fibonacci iterator should be callable like this:
class FibSequence 
    include Enumerable
        def initialize(n)
            @fibo = []
            for i in 1..n
                i > 2 ? num = @fibo[-2] + @fibo[-1]: num = 1 # สูตรฟีโบนักชี = ผลรวม 2 อันก่อนหน้า
                @fibo << num #push array
            end
        end
        def each
            @fibo.each {|s| yield s}
        end
        def reject(&block)
            print @fibo.reject &block
        end
        def map(&block)
            print @fibo.map &block
        end
end
f = FibSequence.new(6) # just the first 6 Fibonacci numbers
f.each { |s| print(s,':') }  # => 1:1:2:3:5:8:
print "\n"
f.reject { |s| s.odd? }    # => [2, 8]
print "\n"
f.reject(&:odd?)            # => [2, 8] (a shortcut!)
print "\n"
f.map { |x| 2*x }            # => [2, 2, 4, 6, 10, 16]
print "\n"
