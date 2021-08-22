require 'time'
require 'humanize'
class Time
    @@quarter = 15
    @@max_min_in_hour = 60
    def humanize
        def global_time #ทำเวลาเป็น 12 ชั่วโมง
            if (self.hour%12)!=0 #ถ้าเวลาไม่ใช่เที่ยงหรือเที่ยงคืน
                (self.hour%12).humanize 
            else #ถ้าเป็นช่วงเที่ยงหรือเที่ยงคืน ปัดเวลาเป็น 
                ((self.hour%12)+12).humanize
            end
        end
        if @@max_min_in_hour-(@@quarter/2) <= self.min || self.min <= (@@quarter/2) #ช่วงเวลาที่ [-7.5,7.5] นาที
            if self.min > 3*@@quarter #ถ้าก่อนเข้าชั่วโมง
                if (self.hour+1)%24 != 12 && (self.hour+1)%24 != 0 #เช็คว่าไม่เป็นเที่ยงหรือเที่ยงคืนใช่ไหม
                    print "About #{((self.hour+1)%12).humanize}"
                else #เป็นเที่ยงหรือเที่ยงคืน
                    print "About noon" if self.hour+1 == 12 or print "About midnight"
                end
            else #ถ้าหลังเข้าชั่วโมง
                print "About #{self.global_time}"
            end
        elsif self.min < @@quarter + @@quarter/2 #ช่วง [7.5,22.5]
            print "About quarter past #{self.global_time}"
        elsif self.min < @@max_min_in_hour/2 + @@quarter/2 #ช่วง [22.5,37.5] ถ่าเป็นช่วงเที่ยงหรือเที่ยงคืนจะใช้อีกรูปแบบเวลาให้เข้ากับโจทย์
            print "About half past #{self.global_time}" if (self.hour%12)!=0 or print "About #{(self.hour%12)+12}:#{self.min}"
        elsif self.min < @@quarter*3 + @@quarter/2 #ช่วง [37.5,52.5]
            print "About quarter til #{self.global_time}"
        end
    end
end


data = ["10:47 pm","10:31 pm","10:07 pm","23:58","00:29"]
data.each {|time| print Time.parse(time).humanize.to_s+"\n"}