require_relative '../models/address_book'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "main menu - #{@address_book.entries.count} entries"
    puts "0 - view entry number n"
    puts "1 - view all"
    puts "2 - add entry"
    puts "3 - find entry"
    puts "4 - csv import entries"
    puts "5 - exit"
    print "enter selection: "

    selection = gets.to_i
    
    case selection
    when 0
      system "clear"
      view_entry
      main_menu
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      puts "bye!"
      exit(0)
    else
      system "clear"
      puts "invalid input"
      main_menu
    end
  end

  def view_entry
    print "enter entry number: "
    entry = gets.chomp.to_i
    if entry < @address_book.entries.count
      puts @address_book.entries[entry].to_s
      puts "press enter to return to main menu"
      gets.chomp
      system "clear"
    else
      puts "#{entry} is not a valid option"
      view_entry
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s

      entry_submenu(entry)
    end

    system "clear"
    puts "end of entries"
  end

  def entry_submenu(entry)
    puts "n - next"
    puts "d - delete"
    puts "e - edit"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n"
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end

  def create_entry
    system "clear"
    puts "new entry"

    print "name: "
    name = gets.chomp
    print "phone number: "
    phone = gets.chomp
    print "email: "
    email = gets.chomp

    @address_book.add_entry(name, phone, email)

    system "clear"
    puts " new entry created!"
  end

  def search_entries
  end

  def read_csv
  end
end