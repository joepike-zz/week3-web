require './app.rb'

feature "homepage content" do

  scenario "should display player names on screen" do
    visit('/')
    fill_in :player1, :with => "Player1"
    fill_in :player2, :with => "Player2"
    click_button "Submit"
    expect(page).to have_text "Player1 vs. Player2"
  end

end
