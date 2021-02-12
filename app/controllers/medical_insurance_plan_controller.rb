class MedicalInsurancePlanController < ApplicationController
    require 'pdf/reader/html'

    def home 
        @insurance_plan = MedicalInsurancePlan.new
    end

    def create 
        plans = params[:medical_insurance_plan]
        plans.each do |k, v| 
            pdf = PDF::Reader.new(v.tempfile)
            MedicalInsurancePlan.parse(pdf)
        end
    end

    def download  
        @insurance_plans = MedicalInsurancePlan.all      
        path = "#{Rails.root}/app/assets/pdf/"
        workbook = RubyXL::Parser.parse(path + "BeneFix Small Group Plans upload template.xlsx")
        worksheet = workbook["Blank Upload Template"]
        @insurance_plans.each_with_index do |plan, i|  
            plan_attributes = [ plan.start_date.to_s, plan.end_date.to_s,  plan.product_name, plan.state, plan.group_rating, plan.zero_eighteen, plan.nineteen_twenty, plan.twenty_one, plan.twenty_two, plan.twenty_three, plan.twenty_four, plan.twenty_five, plan.twenty_six, plan.twenty_seven, plan.twenty_eight, plan.twenty_nine, plan.thirty, plan.thirty_one, plan.thirty_two, plan.thirty_three, plan.thirty_four, plan.thirty_five, plan.thirty_six, plan.thirty_seven, plan.thirty_eight, plan.thirty_nine, plan.forty, plan.forty_one, plan.forty_two, plan.forty_three, plan.forty_four, plan.forty_five, plan.forty_six, plan.forty, plan.forty_seven, plan.forty_eight, plan.forty_nine, plan.fifty, plan.fifty_one, plan.fifty_two, plan.fifty_three, plan.fifty_four, plan.fifty_five, plan.fifty_six, plan.fifty_seven, plan.fifty_eight, plan.fifty_nine, plan.sixty, plan.sixty_one, plan.sixty_two, plan.sixty_three, plan.sixty_four, plan.sixty_five_plus] 
            plan_attributes.each_with_index do |attribute, j| 
                worksheet.add_cell(i + 1, j, attribute)
            end
        end
        workbook.write(path + "converted-from-database-insurance-plans-#{Time.now.strftime("%B-%d-%Y-%k:%M%P")}.xlsx")
        send_data workbook.stream.read, :filename => "converted-from-database-insurance-plans-#{Time.now.strftime("%B-%d-%Y-%k:%M%P")}.xlsx", :type => "application/excel"
    end

    def convert
        path = "#{Rails.root}/app/assets/pdf/"
        workbook = RubyXL::Parser.parse(path + "BeneFix Small Group Plans upload template.xlsx")
        worksheet = workbook["Blank Upload Template"]
        plans = params[:medical_insurance_plan]
        all_plans = [] 
        plans.each do |k, v| 
            pdf = PDF::Reader.new(v.tempfile)
            group_of_plans = parse(pdf)
            
            all_plans.push(group_of_plans)
        end

        all_plans.flatten.each_with_index do |plan, i| 
            plan.each do |k, v|
                worksheet.add_cell(i + 1, k, v )
            end
        end
        workbook.write(path + "converted-insurance-plans-#{Time.now.strftime("%B-%d-%Y-%k:%M%P")}.xlsx")

        send_data workbook.stream.read, :filename => "converted-insurance-plans-#{Time.now.strftime("%B-%d-%Y-%k:%M%P")}.xlsx", :type => "application/excel"
    end 

    private

    def parse(pdf) 
        plans = [] 
        pdf.pages.each do |page| 
            hash = {} 
            split = page.text.split("\n")
            #dates
            dates = split[0]
            start_date =  Date.strptime(dates.split[4], '%m/%d/%Y')
            end_date = Date.strptime(dates.split[6], '%m/%d/%Y')
            hash[0] = start_date.to_s
            hash[1] = end_date.to_s
            
            #product name 
            product_name = split[3].split(':')[2]
            hash[2] = product_name

            #state
            state = split[1] 
            hash[3] = state
            
            #group rating 
            group_rating = split[2].split(':')[1].remove('*')
            hash[4] = group_rating
                   
            #rates algo
            rates = split[5..19]
            
            rates.each_with_index do |rate_string, index| 
                            
                if index == 0 
                    age1 = to_excel_column_num(rate_string[0..3])
                    price1 = rate_string[4..9]
                    age2 = to_excel_column_num(rate_string[10..11])
                    price2 = rate_string[12..17]
                    age3  = to_excel_column_num(rate_string[18..19])
                    price3 = rate_string[20..rate_string.length - 1]
                     
                    
                    hash[age1[0]] = price1 if age1
                    hash[age1[1]] = price1 if age1
                    hash[age2] = price2 if age2 
                    hash[age3] = price3 if age3

                elsif index == (rates.length - 1)
                    age1 = to_excel_column_num(rate_string[0..1])
                    price1 = rate_string[2..7]
                    age2 = to_excel_column_num(rate_string[8..9])
                    price2 = rate_string[10..15]
                    age3 = to_excel_column_num(rate_string[16..17])
                    price3 = rate_string[19..rate_string.length - 1]
                    hash[age1] = price1 if age1
                    hash[age2] = price2 if age2 
                    hash[age3[0]] = price3 if age3
                    hash[age3[1]] = price3 if age3

                else 
                    #find age and price
                    age1 = to_excel_column_num(rate_string[0..1])
                    price1 = rate_string[2..7]
                    age2 = to_excel_column_num(rate_string[8..9])
                    price2 = rate_string[10..15]
                    age3 = to_excel_column_num(rate_string[16..17])
                    price3 = rate_string[18..rate_string.length - 1]
                    
                    hash[age1] = price1 if age1
                    hash[age2] = price2 if age2 
                    hash[age3] = price3 if age3
                end
            end
            plans.push(hash)
        end
        plans 
    end

    def to_excel_column_num(num) 
        case num
        when "0-20"
            return [5 , 6]
        when "21"
            return 7
        when "22"
            return 8
        when "23"
            return 9
        when "24"
            return 10
        when "25"
            return 11
        when "26"
            return 12
        when "27"
            return 13
        when "28"
            return 14
        when "29"
            return 15
        when "30"
            return 16
        when "31"
            return 17
        when "32"
            return 18
        when "33"
            return 19
        when "34"
            return 20
        when "35"
            return 21
        when "36"
            return 22
        when "37"
            return 23
        when "38"
            return 24
        when "39"
            return 25
        when "40"
            return 26
        when "41"
            return 27
        when "42"
            return 28
        when "43"
            return 29
        when "44"
            return 30
        when "45"
            return 31
        when "46"
            return 32
        when "47"
            return 33
        when "48"
            return 34
        when "49"
            return 35
        when "50"
            return 36
        when "51"
            return 37
        when "52"
            return 38
        when "53"
            return 39
        when "54"
            return 40
        when "55"
            return 41
        when "56"
            return 42
        when "57"
            return 43
        when "58"
            return 44
        when "59"
            return 45
        when "60"
            return 46
        when "61"
            return 47
        when "62"
            return 48
        when "63"
            return 49
        when "64+"
            return [50, 51]
        else
            return false
        end
    end
end


 