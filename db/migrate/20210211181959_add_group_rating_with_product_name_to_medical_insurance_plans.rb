class AddGroupRatingWithProductNameToMedicalInsurancePlans < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_insurance_plans, :group_rating_and_product_name, :string
  end
end
