require_relative('../classes/source')

describe Source do
  it 'should add an item to the source' do
    source = Source.new(name: 'Netflix')
    item = double('item')
    allow(item).to receive(:add_source)
    source.add_item item

    expect(source.items.count).to eq 1
  end
end
