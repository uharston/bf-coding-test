class RemoveTwentyFromMedicalInsurancePlans < ActiveRecord::Migration[6.0]
  def change
    remove_column :medical_insurance_plans, :twenty, :string
  end
end
