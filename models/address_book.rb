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

  def remove_entry(name, phone, email)
    @entries.each do |entry|
      @entries.delete(entry) && break if entry.name == name && entry.phone_number == phone && entry.email == email
    end
  end
end