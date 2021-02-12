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

    # def download
    #     path = "#{Rails.root}/app/assets/pdf/BeneFix-Small-Group-Plans-upload-template.xlsx"
    #     binding.pry
    #     workbook = RubyXL::Parser.parse(path)

    # end
end


 