require_relative 'entry.rb'

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
    index = 0
    @entries.each do |entry|
      break if name < entry.name
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone, email))
  end

end