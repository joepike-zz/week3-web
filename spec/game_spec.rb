require 'game'

describe Game do

  let(:player) { double(:player) }
  let(:player2) { double(:player2, hitpoints: 100) }
  subject(:game) { described_class.new(player, player2)}

  describe "#attack" do

    it "should allow a player to attack another player" do
      allow(player2).to receive(:receive_damage)
      game.attack(player2)
    end

  end
end
