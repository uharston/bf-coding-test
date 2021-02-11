class AddThirtyToMedicalInsurancePlan < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_insurance_plans, :thirty, :string
  end
end
