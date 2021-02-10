class CreateMedicalInsurancePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_insurance_plans do |t|

      t.timestamps
    end
  end
end
