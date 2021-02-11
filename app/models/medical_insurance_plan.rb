class MedicalInsurancePlan < ApplicationRecord
    validates :product_name, uniqueness: true 
    
    
    def self.parse(pdf) 
        pdf.pages.each do |page| 
            
            insurance_plan = MedicalInsurancePlan.new 
            
            split = page.text.split("\n")
            #dates
            dates = split[0]
            start_date =  Date.strptime(dates.split[4], '%m/%d/%Y')
            end_date = Date.strptime(dates.split[6], '%m/%d/%Y')
            insurance_plan.start_date = start_date
            insurance_plan.end_date = end_date
            
            #state
            state = split[1] 
            insurance_plan.state = state

            #group rating 
            group_rating = split[2].split(':')[1].remove('*')
            insurance_plan.group_rating = group_rating
            
            #product name 
            product_name = split[3].split(':')[2]
            insurance_plan.product_name = product_name
            
            
            #rates algo
            rates = split[5..19]

            rates.each_with_index do |rate_string, index| 
                if index == 0 
                    age1 = stringToNumMatch?(rate_string[0..3])
                    price1 = rate_string[4..9]
                    age2 = stringToNumMatch?(rate_string[10..11])
                    price2 = rate_string[12..17]
                    age3  = stringToNumMatch?(rate_string[18..19])
                    price3 = rate_string[20..rate_string.length - 1]
                     
                    
                    insurance_plan[age1[0]] = price1 if age1
                    insurance_plan[age1[1]] = price1 if age1
                    insurance_plan[age2] = price2 if age2 
                    insurance_plan[age3] = price3 if age3

                elsif index == (rates.length - 1)
                    age1 = stringToNumMatch?(rate_string[0..1])
                    price1 = rate_string[2..7]
                    age2 = stringToNumMatch?(rate_string[8..9])
                    price2 = rate_string[10..15]
                    age3 = stringToNumMatch?(rate_string[16..18])
                    price3 = rate_string[19..rate_string.length - 1]
                    
                    
                    insurance_plan[age1] = price1 if age1
                    insurance_plan[age2] = price2 if age2 
                    insurance_plan[age3[0]] = price3 if age3
                    insurance_plan[age3[1]] = price3 if age3

                else 
                    #find age and price
                    age1 = stringToNumMatch?(rate_string[0..1])
                    price1 = rate_string[2..7]
                    age2 = stringToNumMatch?(rate_string[8..9])
                    price2 = rate_string[10..15]
                    age3 = stringToNumMatch?(rate_string[16..17])
                    price3 = rate_string[18..rate_string.length - 1]
                    
                    insurance_plan[age1] = price1 if age1
                    insurance_plan[age2] = price2 if age2 
                    insurance_plan[age3] = price3 if age3
                end
            end
            insurance_plan.save
        end
    end

    def stringToNumMatch?(num) 
        case num
        
        when "0-20"
            return ["zero_eighteen", "nineteen_twenty"]
        when "21"
            return "twenty_one"
        when "22"
            return "twenty_two"
        when "23"
            return "twenty_three"
        when "24"
            return "twenty_four"
        when "25"
            return "twenty_five"
        when "26"
            return "twenty_six"
        when "27"
            return "twenty_seven"
        when "28"
            return "twenty_eight"
        when "29"
            return "twenty_nine"
        when "30"
            return "thirty"
        when "31"
            return "thirty_one"
        when "32"
            return "thirty_two"
        when "33"
            return "thirty_three"
        when "34"
            return "thirty_four"
        when "35"
            return "thirty_five"
        when "36"
            return "thirty_six"
        when "37"
            return "thirty_seven"
        when "38"
            return "thirty_eight"
        when "39"
            return "thirty_nine"
        when "40"
            return "forty"
        when "41"
            return "forty_one"
        when "42"
            return "forty_two"
        when "43"
            return "forty_three"
        when "44"
            return "forty_four"
        when "45"
            return "forty_five"
        when "46"
            return "forty_six"
        when "47"
            return "forty_seven"
        when "48"
            return "forty_eight"
        when "49"
            return "forty_nine"
        when "50"
            return "fifty"
        when "51"
            return "fifty_one"
        when "52"
            return "fifty_two"
        when "53"
            return "fifty_three"
        when "54"
            return "fifty_four"
        when "55"
            return "fifty_five"
        when "56"
            return "fifty_six"
        when "57"
            return "fifty_seven"
        when "58"
            return "fifty_eight"
        when "59"
            return "fifty_nine"
        when "60"
            return "sixty"
        when "61"
            return "sixty_one"
        when "62"
            return "sixty_two"
        when "63"
            return "sixty_three"
        when "64+"
            return ["sixty_four", "sixty_five_plus"]
        else
            return false
        end
    end
end
