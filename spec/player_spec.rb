require 'player.rb'

describe Player do

  subject(:player) { described_class.new("Bob") }
  subject(:player2) { described_class.new("Dave") }

  it "should return the name in the player class" do
    expect(player.name).to eq "Bob"
  end

  it "should receive damage and deduct 10 from the hitpoints" do
    expect{ player.receive_damage }.to change{ player.hitpoints }.by(-10)
  end

end
