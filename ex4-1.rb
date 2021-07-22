require 'time'

def date_is_valid(string_time)
  hour, minute = string_time.split(':')
  if /^\d+:\d+$/.match(string_time)
    if string_time.length == 5 and string_time[2] == ':'
      if hour.to_i < 24 and minute.to_i <= 59
        return true
      end
    end
  end
  puts 'Format sai, nhap lai theo dung format hh:mm'
  return false
end


loop do
  puts 'Nhap gio bat dau:'
  checkin_time = gets.chomp
  loop do
    break if date_is_valid(checkin_time)
    checkin_time = gets.chomp
  end
  checkin_time_minute = Time.parse(checkin_time)

  puts 'Nhap gio ket thuc:'
  checkout_time = gets.chomp
  loop do
    break if date_is_valid(checkout_time)
    checkout_time = gets.chomp
  end
  checkout_time_minute = Time.parse(checkout_time)

  if checkout_time_minute <= checkin_time_minute
    puts "Thoi gian bat dau sau thoi gian ket thuc, nhap lai!"
    next
  end

  OT = (checkout_time_minute - checkin_time_minute) / 3600
  lunch = 'N'
  dinner = 'N'
  if OT > 4
    lunch_start_time_minute = Time.parse("12:00")
    lunch_end_time_minute = Time.parse("13:00")
    dinner_time_minute = Time.parse("21:00")
    if checkin_time_minute <= lunch_start_time_minute and checkout_time_minute >= lunch_end_time_minute
      lunch = 'Y'
      OT = OT - 1
    end

    if checkin_time_minute <= dinner_time_minute and checkout_time_minute >= dinner_time_minute
      dinner = 'Y'
    end
  end

  puts "OT: %0.2f, Lunch: %s, Dinner: %s" % [OT, lunch, dinner]
  
  break
end

