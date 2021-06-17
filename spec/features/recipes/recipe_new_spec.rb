describe 'creation' do
  it 'has a new new form that can be reached' do
    user = FactoryBot.create(:user)
    signin(user.email, user.password)
    visit new_recipe_path
    expect(page.status_code).to eq(200)
  end

  it 'can be created from new form page' do
    user = FactoryBot.create(:user)
    signin(user.email, user.password)
    visit new_recipe_path

    fill_in 'Name', with: username
      fill_in 'Email', with: email, match: :prefer_exact
      fill_in 'Password', with: password, match: :prefer_exact
      fill_in 'Password confirmation', with: confirmation
      click_button 'Sign up'
  end
end
