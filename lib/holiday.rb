require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday, supplies|
        supplies << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holidays|
    if season == :spring
      holidays.each do |holiday, supplies|
        if holiday == :memorial_day
          supplies << supply
        end
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    puts "#{season.to_s.capitalize!}:"

    holidays.each do |holiday, supplies|
      cap_string = holiday.to_s.capitalize!
    ## So many goddamn steps just to capitalize a two-word holiday
        if cap_string.include? "_"
          arr = cap_string.split("_")
            arr.each do |word|
              word.capitalize!
            end
          cap_string = arr.join(" ")
        end
    ## All holidays should have one-word names
      puts "  #{cap_string}: #{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_holidays = []

  holiday_hash.each do |season, holidays|
    if season == :spring || season == :summer
      holidays.each do |holiday, supplies|
        bbq_holidays << holiday
      end
    end
  end

  return bbq_holidays
end
