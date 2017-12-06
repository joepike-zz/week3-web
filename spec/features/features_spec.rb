require './app.rb'

feature "homepage content" do

  scenario "should have Testing infrastructure working text" do
    visit('/')
    expect(page).to have_content 'Testing infrastructure working!'
  end

end
