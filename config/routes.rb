Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'medical_insurance_plan#home'
  post '/', to: 'medical_insurance_plan#create', as: "medical_insurance_plans"

end
