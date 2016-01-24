require_relative '../models/entry.rb'

RSpec.describe Entry do
  
  context "attributes" do
    before do
      @entry = Entry.new('pras malla', '646.646.6466', 'pras@malla.com')
    end
    
    it "should respond to name" do
      expect(@entry).to respond_to(:name)
    end

    it "should respond to phone number" do
      expect(@entry).to respond_to(:phone_number)
    end

    it "should respond to email" do
      expect(@entry).to respond_to(:email)
    end
  end

  context "#to_s" do
    it "prints entry as string" do
      @entry = Entry.new('pras malla', '646.646.6466', 'pras@malla.com')
      expected_string = "Name: pras malla\nPhone Number: 646.646.6466\nEmail: pras@malla.com"
      expect(@entry.to_s).to eq(expected_string)
    end
  end
end