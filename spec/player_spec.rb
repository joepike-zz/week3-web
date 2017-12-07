require 'player.rb'

describe Player do

  subject(:player) { described_class.new("Bob") }
  subject(:player2) { described_class.new("Dave") }

  it "should return the name in the player class" do
    expect(player.name).to eq "Bob"
  end

  

end
