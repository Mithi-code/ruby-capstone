require_relative('../classes/label')

describe Label do
  it 'should add an item to the label' do
    label = Label.new(title: 'title', color: 'color')
    item = double('item')
    allow(item).to receive(:add_label)
    label.add_item item
    count = label.items.count
    expect(count).to eq 1
  end
end
