require_relative '../models/address_book'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "main menu - #{@address_book.entries.count} entries"
    puts "0 - delete all"
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
      @address_book.nuke
      print "wiped clean! press any key to start over"
      gets.chomp
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

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s

      entry_submenu entry
    end

    system "clear"
    puts "end of entries"
  end

  def entry_submenu(entry)
    puts "\nn - next"
    puts "d - delete"
    puts "e - edit"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n"
    when "d"
      delete_entry entry
    when "e"
      edit_entry entry
      entry_submenu entry
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu entry
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
    print "search by name: "
    name = gets.chomp

    match = @address_book.binary_search(name)
    system "clear"

    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "no match found for #{name}"
    end
  end

  def search_submenu(entry)
    puts "\nd - delete"
    puts "e - edit"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "d"
      delete_entry entry
      main_menu
    when "e"
      edit_entry entry
      system "clear"
      main_menu
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      search_submenu entry
    end
  end

  def edit_entry(entry)
    print "update name: "
    name = gets.chomp
    print "update phone number: "
    phone = gets.chomp
    print "update email: "
    email = gets.chomp

    entry.name = name if !name.empty?
    entry.phone_number = phone if !phone.empty?
    entry.email = email if !email.empty?
    system "clear"
    puts "updated entry: "
    puts entry.to_s
  end

  def delete_entry(entry)
    @address_book.entries.delete entry
    puts "#{entry.name} has been deleted"
  end

  def read_csv
    print "enter CSV file to import: "
    file_name = gets.chomp

    if file_name.empty?
      system "clear"
      puts "no CSV file read"
      main_menu
    end

    begin
      entry_count = @address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please try again"
      read_csv
    end
  end
end