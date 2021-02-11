class MedicalInsurancePlanController < ApplicationController
    require 'pdf/reader/html'

    def home 
        @insurance_plan = MedicalInsurancePlan.new
    end

    def create 
        plan = params[:medical_insurance_plan][:insurance_plan]
        pdf = open(plan)
        reader = PDF::Reader.new(pdf)
        MedicalInsurancePlan.parse(reader)
    end
  
end


