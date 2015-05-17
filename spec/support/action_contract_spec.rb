shared_examples "action" do

  it "respond to action attributes" do
    expect(action).to respond_to(:action_attributes)
  end

  it "respond to success" do
    expect(action).to respond_to(:success)
  end

  it "respond to failure" do
    expect(action).to respond_to(:failure)
  end

  it "respond to owner" do
    expect(action).to respond_to(:owner)
  end

  it "respond to dicepool" do
    expect(action).to respond_to(:dicepool)
  end

  it "respond to difficulty" do
    expect(action).to respond_to(:difficulty)
  end

  it "respond to attribute" do
    expect(action).to respond_to(:attribute)
  end

  it "respond to activate" do
    expect(action).to respond_to(:activate)
  end

end

shared_examples 'subaction' do
  it 'has an owner' do 
    expect(action.owner).to eq(hero)
  end
end