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
        workbook.write(path + "new_book.xlsx")


        send_data workbook.stream.read, :filename => 'new_book.xlsx', :type => "application/excel"
    end
end


 