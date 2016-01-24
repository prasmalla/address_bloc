require_relative '../models/address_book.rb'

RSpec.describe AddressBook do

  context "attributes" do
    before do
      @book = AddressBook.new
    end

    it "should respond to entries" do
      expect(@book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(@book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(@book.entries.size).to eq 0
    end
  end

  context "#add_entry" do
    before do
      @book = AddressBook.new
      @book.add_entry('pras malla', '646.646.6466', 'pras@malla.com')
    end
    
    it "adds only one entry to address book" do
      expect(@book.entries.size).to eq 1
    end

    it "adds correct information to entries" do
      new_entry = @book.entries.first
      expect(new_entry.name).to eq 'pras malla'
      expect(new_entry.phone_number).to eq '646.646.6466'
      expect(new_entry.email).to eq 'pras@malla.com'
    end
  end
end