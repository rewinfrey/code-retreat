require './next_state'

describe NextState do
  subject { described_class.new }

  context "current state is alive" do
    it "returns alive when there are two alive neighbors" do
      expect(subject.execute(:alive, 2)).to eq(:alive)
    end

    it "returns alive when there are three alive neighbors" do
      expect(subject.execute(:alive, 3)).to eq(:alive)
    end

    it "returns dead when there are not two or three neighbors" do
      expect(subject.execute(:alive, 1)).to eq(:dead)
      expect(subject.execute(:alive, 4)).to eq(:dead)
      expect(subject.execute(:alive, 5)).to eq(:dead)
      expect(subject.execute(:alive, 6)).to eq(:dead)
      expect(subject.execute(:alive, 7)).to eq(:dead)
      expect(subject.execute(:alive, 8)).to eq(:dead)
    end
  end

  context "current state is dead" do
    it "returns alive when there are three alive neighbors" do
      expect(subject.execute(:dead, 3)).to eq(:alive)
    end

    it "returns dead when there are not three alive neighbors" do
      expect(subject.execute(:dead, 1)).to eq(:dead)
      expect(subject.execute(:dead, 2)).to eq(:dead)
      expect(subject.execute(:dead, 4)).to eq(:dead)
      expect(subject.execute(:dead, 5)).to eq(:dead)
      expect(subject.execute(:dead, 6)).to eq(:dead)
      expect(subject.execute(:dead, 7)).to eq(:dead)
      expect(subject.execute(:dead, 8)).to eq(:dead)
    end
  end
end
