RSpec.describe RecipeCategory, type: :model do
  describe "creation" do
    it "can be created" do
      create(:recipe_category)
    end
  end

  describe "associations" do
    it "has many tags" do
      recipe_category = create(:recipe_category, :with_tags, tag_count: 2)
      # recipe_category = create(:recipe_category_with_tags, tag_count: 2) with transient and no trait
      recipe_category2 = create(:recipe_category, :with_tags, tag_count: 3)

      expect(Tag.count).to eq 5
      expect(recipe_category.tags.count).to eq 2

    end
  end
end
