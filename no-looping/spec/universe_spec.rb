require './universe'

describe Universe do
  subject { described_class }
  let(:cell) { Cell }

  it "contains a single cell" do
    universe = subject.new(1, 1, cell)
    expect(universe.cells.flatten.count).to eq(1)
  end

  it "contains two cells" do
    universe = subject.new(1, 2, cell)
    expect(universe.cells.flatten.count).to eq(2)
  end

  it "finds a cell for a given coordinate" do
    universe = subject.new(10, 10, cell)
    cell = universe.cells[5][5]
    expect(cell.x).to eq(5)
    expect(cell.y).to eq(5)
  end

  it "returns the count of alive neighbors for a given cell" do
    universe = subject.new(10, 10, cell)
    cell = universe.cells[5][5]
    expect(universe.alive_neighbors_count(cell)).to eq(8)
  end
end
