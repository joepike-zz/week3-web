require './app.rb'

feature "names webpage content" do

  scenario "should display player names on screen" do
    sign_in_and_play
    expect(page).to have_text "Player1 vs. Player2"
  end

  scenario "should display Player 1's hit points" do
    visit('/play')
    # fill_in :hitpoint, :with => "100"
    # click_button "Submit"
    expect(page).to have_content "Player1 hitpoints: #{Player::STARTING_HP}"
  end
end

feature "play webpage content" do

  scenario "player 1 can attack player 2 and get a confirmation" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content('Player1 attacked Player2!')
  end
end
