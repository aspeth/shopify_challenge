require 'rails_helper'

RSpec.describe ShipmentItem, type: :model do
    describe "relationships" do
    it { should belong_to(:shipment) }
    it { should belong_to(:item) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:quantity) }
  end
end
