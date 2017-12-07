require 'game'

describe Game do

  let(:player) { double(:player) }
  let(:player2) { double(:player2) }
  # let(:game) { described_class(player, player2)}

  describe "#attack" do

    it "should allow a player to attack another player" do
      allow(player2).to receive(:receive_damage)
      subject.attack(player2)
    end

    it "should reduce player2 hitpoints by 10" do
      subject.attack(player2)
      expect { player.receive_damage }.to change { player.hitpoints}.by(-10)
    end

end
