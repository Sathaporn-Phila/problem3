class Numeric
    @@currencies = [:dollar,:yen,:euro]
    def dollar; self;end
    def yen; self*0.012;end
    def euro; self*1.3;end
    def method_missing(method_id,*args,&block)
        currency_no_s = method_id.to_s.gsub(/s$/,'') #ตัด s ออกจาก method
        self.in(currency_no_s.to_sym) 
    end
    def in(currency)
        currency = currency.to_s.gsub(/s$/,'').to_sym if currency[-1].to_s == 's' #ตัด s ออกจากสกุลเงิน
        self.send(currency) if @@currencies.include?(currency) #เช็คว่ามีสกุลที่สามารถใช้ได้หรือไม่
    end
end
print 5.dollars.in(:euros)  # => 6.5
print "\n"
print (1.euro - 50.yen).in(:dollars)  # => 0.700