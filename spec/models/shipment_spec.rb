require 'rails_helper'

RSpec.describe Shipment, type: :model do
  describe "relationships" do
    it { should have_many(:shipment_items) }
    it { should have_many(:items).through :shipment_items }
  end
  
  describe "validations" do
    it { should validate_presence_of(:origin) }
    it { should validate_presence_of(:destination) }
  end
end
