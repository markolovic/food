FactoryGirl.define do
  factory :item, aliases: [:milk] do
    name 'milk'
    calories 62
    protein 3
    fat 3.5
    unit_quantity 1000
  end

  factory :egg, class: Item do
    name 'boiled egg'
    calories 155
    protein 13
    fat 11
    unit_quantity 50
  end

  factory :daily_plan do
    factory :plan_with_items do
      after(:create) do |daily_plan|
        daily_plan.items << create(:milk, quantity: 1000) << create(:egg, quantity: 100)
        # Can't wrap?
      end
    end
  end
end
