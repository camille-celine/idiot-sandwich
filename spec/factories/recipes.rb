FactoryBot.define do
  factory :recipe do
    sequence(:name) { |n| "#{n}recipe" }
    description { "this is a burger" }
    cooking_time { 2 }
    difficulty { 2 }
    serving { 2 }
    prep_time { 3 }
    user

    # factory :measurement_lookup do 
    #   measurement_type { grams }
    # end

    # traits :with_ingredient_lists do 
    #   measurement_loo
    # end


    trait :with_tags do
      transient do
        tag_count { 2 }
      end

      after(:create) do |recipe, evaluator|
        recipe.tags << create_list(:tag, evaluator.tag_count)
      end
    end

    trait :with_instructions do
      transient do
        instruction_count { 2 }
      end

      after(:create) do |recipe, evaluator|
        recipe.instructions << create_list(:instruction, evaluator.instruction_count)
      end
    end
  end
end
  