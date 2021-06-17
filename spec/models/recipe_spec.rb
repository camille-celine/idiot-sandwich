RSpec.describe Tag, type: :model do
  describe "creation" do
    it "can be created" do
      recipe = create(:recipe, :with_tags, :with_instructions)
      binding.pry
    end
  end
end
