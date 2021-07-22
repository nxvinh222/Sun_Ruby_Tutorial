require 'date'
require 'time'
def date_is_valid(string_time)
  if /^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/\d{4}$/.match(string_time)
    return true
  end
  puts 'Format sai, nhap lai!'
  return false
end

loop do
  puts 'Nhap ngay vao lam(mm/dd/yyyy):'
  join_time = gets.chomp
  loop do
    break if date_is_valid(join_time)
    join_time = gets.chomp
  end

  month, day, year = join_time.split('/')
  month = month.to_i
  day = day.to_i
  year = year.to_i
  now = Time.now
  join_time = Time.strptime(join_time, "%m/%d/%Y")
  this_year = now.year.to_i
  puts this_year

  if year < this_year
    year_diff = (now - join_time) / (3600 * 24 * 365)
    if year_diff >= 5
      puts "So ngay nghi phep: 14"
      break
    end
    if year_diff >= 4
      puts "So ngay nghi phep: 13"
      break
    end
    puts "So ngay nghi phep: 12"
    break
  end

  if day >= 10
    puts "So ngay nghi phep: #{12 - month + 0.5}"
    break
  end

  puts "So ngay nghi phep: #{12 - month + 1}"
  break
end



