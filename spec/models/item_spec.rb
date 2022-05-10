RSpec.describe Item, type: :model do

  describe "relationships" do
    it { should belong_to(:store) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end

end
