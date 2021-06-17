describe 'Navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit recipes_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of All recipes' do
      user = FactoryBot.create(:user)
      signin(user.email, user.password)
      visit recipes_path
      expect(page).to have_content(/All recipes/)
    end
  end
end
  