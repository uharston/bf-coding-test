class AddStateToMedicalInsurancePlan < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_insurance_plans, :state, :string
  end
end
