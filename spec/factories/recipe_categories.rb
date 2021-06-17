FactoryBot.define do
  factory :recipe_category do
    sequence :name do |f|
      "#{f}Dish Type"
    end

    trait :with_tags do
      transient do
        tag_count { 3 }
      end
      after(:create) do |recipe_category, evaluator|
        create_list(:tag, evaluator.tag_count, recipe_category: recipe_category)
      end
    end
 ## same as trait
    # # recipe_category_with_tags will create tag data after the recipe_category has been created
    # factory :recipe_category_with_tags do
    #   # tag_count is declared as a transient attribute available
    #   # in the callback via the evaluator 
    #   # (callback = evaluator (used to be called by another function))
    #   transient do
    #     tag_count { 3 }
    #   end
    #   # the after(:create) yields two values; the recipe_category instance itself and the
    #   # evaluator, which stores all values from the factory, including transient
    #   # attributes; `create_list`'s second argument is the number of records
    #   # to create and we make sure the recipe_category is associated properly to the tag
    #   after(:create) do |recipe_category, evaluator|
    #     create_list(:tag, evaluator.tag_count, recipe_category: recipe_category)
    #   end

    #   # You may need to reload the record here, depending on your application
    #   # recipe_category.reload
    # end
  end
end

# create(:recipe_category).tags.length # 0
# create(:recipe_category_with_tags).tags.length # 3
# create(:recipe_category_with_tags, tag_count: 15).posts.length # 15
  