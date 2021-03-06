class AddAttributesToMedicalInsurancePlan < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_insurance_plans, :start_date, :datetime
    add_column :medical_insurance_plans, :end_date, :datetime
    add_column :medical_insurance_plans, :product_name, :string
    add_column :medical_insurance_plans, :group_rating, :string
    add_column :medical_insurance_plans, :zero_eighteen, :string
    add_column :medical_insurance_plans, :nineteen_twenty, :string
    add_column :medical_insurance_plans, :twenty, :string
    add_column :medical_insurance_plans, :twenty_one, :string
    add_column :medical_insurance_plans, :twenty_two, :string
    add_column :medical_insurance_plans, :twenty_three, :string
    add_column :medical_insurance_plans, :twenty_four, :string
    add_column :medical_insurance_plans, :twenty_five, :string
    add_column :medical_insurance_plans, :twenty_six, :string
    add_column :medical_insurance_plans, :twenty_seven, :string
    add_column :medical_insurance_plans, :twenty_eight, :string
    add_column :medical_insurance_plans, :twenty_nine, :string
    add_column :medical_insurance_plans, :thirty_one, :string
    add_column :medical_insurance_plans, :thirty_two, :string
    add_column :medical_insurance_plans, :thirty_three, :string
    add_column :medical_insurance_plans, :thirty_four, :string
    add_column :medical_insurance_plans, :thirty_five, :string
    add_column :medical_insurance_plans, :thirty_six, :string
    add_column :medical_insurance_plans, :thirty_seven, :string
    add_column :medical_insurance_plans, :thirty_eight, :string
    add_column :medical_insurance_plans, :thirty_nine, :string
    add_column :medical_insurance_plans, :forty, :string
    add_column :medical_insurance_plans, :forty_one, :string
    add_column :medical_insurance_plans, :forty_two, :string
    add_column :medical_insurance_plans, :forty_three, :string
    add_column :medical_insurance_plans, :forty_four, :string
    add_column :medical_insurance_plans, :forty_five, :string
    add_column :medical_insurance_plans, :forty_six, :string
    add_column :medical_insurance_plans, :forty_seven, :string
    add_column :medical_insurance_plans, :forty_eight, :string
    add_column :medical_insurance_plans, :forty_nine, :string
    add_column :medical_insurance_plans, :fifty, :string
    add_column :medical_insurance_plans, :fifty_one, :string
    add_column :medical_insurance_plans, :fifty_two, :string
    add_column :medical_insurance_plans, :fifty_three, :string
    add_column :medical_insurance_plans, :fifty_four, :string
    add_column :medical_insurance_plans, :fifty_five, :string
    add_column :medical_insurance_plans, :fifty_six, :string
    add_column :medical_insurance_plans, :fifty_seven, :string
    add_column :medical_insurance_plans, :fifty_eight, :string
    add_column :medical_insurance_plans, :fifty_nine, :string
    add_column :medical_insurance_plans, :sixty, :string
    add_column :medical_insurance_plans, :sixty_one, :string
    add_column :medical_insurance_plans, :sixty_two, :string
    add_column :medical_insurance_plans, :sixty_three, :string
    add_column :medical_insurance_plans, :sixty_four, :string
    add_column :medical_insurance_plans, :sixty_five_plus, :string
  end
end
