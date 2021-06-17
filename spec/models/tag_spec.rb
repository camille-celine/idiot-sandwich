RSpec.describe Tag, type: :model do
  describe "creation" do
    it "can be created" do
      create(:tag)
    end

    it "belongs to a recipe_category" do
      tag = create(:tag)
      expect(tag.recipe_category).to be_truthy
      # expect(tag.recipe_category).to be_a(RecipeCategory)
    end
  end
end

