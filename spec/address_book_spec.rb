require_relative "../models/address_book.rb"

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eq expected_email
  end

  context "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(book.entries.size).to eq 0
    end
  end

  context "#add_entry" do
    it "adds only one entry to address book" do
      book.add_entry('pras malla', '646.646.6466', 'pras@malla.com')
      expect(book.entries.size).to eq 1
    end

    it "adds correct information to entries" do
      book.add_entry('pras malla', '646.646.6466', 'pras@malla.com')
      new_entry = book.entries.first
      expect(new_entry.name).to eq 'pras malla'
      expect(new_entry.phone_number).to eq '646.646.6466'
      expect(new_entry.email).to eq 'pras@malla.com'
    end
  end

  context "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      expect(book.entries.size).to eq 5
    end

    it "imports the entry 1" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "prasmalla1", "646.646.6466", "pras1@malla.com")
    end

    it "imports the entry 2" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[1]
      check_entry(entry_one, "prasmalla2", "646.646.6465", "pras2@malla.com")
    end

    it "imports the entry 3" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[2]
      check_entry(entry_one, "prasmalla3", "646.646.6464", "pras3@malla.com")
    end

    it "imports the entry 4" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[3]
      check_entry(entry_one, "prasmalla4", "646.646.6463", "pras4@malla.com")
    end

    it "imports the entry 5" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[4]
      check_entry(entry_one, "prasmalla5", "646.646.6462", "pras5@malla.com")
    end
  end

  context "#import_from_csv from second file" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      expect(book.entries.size).to eq 3
    end

    it "imports the entry 6" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "prasmalla6", "646.646.6462", "pras6@malla.com")
    end

    it "imports the entry 7" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[1]
      check_entry(entry_one, "prasmalla7", "646.646.6462", "pras7@malla.com")
    end

    it "imports the entry 8" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[2]
      check_entry(entry_one, "prasmalla8", "646.646.6462", "pras8@malla.com")
    end
  end
end