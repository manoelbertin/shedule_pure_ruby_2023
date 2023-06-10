# by Manoel Bertin - June 4th,9th, 2023.
@schedule = [
  {name: "DiegoC", phone: "9996-85256"},
  {name: "Isabel", phone: "8876-80056"},
  {name: "Carlos", phone: "9600-00056"}
]

def all_contacts
  i = 0
  @schedule.each do |contact|
    i += 1
    puts "#{i}º #{contact[:name]} - #{contact[:phone]}"
  end
end

def add_contact
  print "Name: "
  name = gets.chomp
  print "Cellphone: "
  phone = gets.chomp

  @schedule << {name: name, phone: phone}
end

def show_contact
  print "Type the Name: "
  name = gets.chomp.downcase

  @schedule.each do |contact|
    if contact[:name].downcase == (name.downcase)
      puts "Nome  -  Cellphone"
      puts "#{contact[:name]} - #{contact[:phone]}"
      break
    # else
    #   puts "Name Not found!"
    #   break
    end
  end
end

def edit_contact
  print "What name would you like to edit? "
  name = gets.chomp

  @schedule.each do |contact|
    #if contact[:name].downcase.include?(name.downcase)
    if contact[:name].downcase == (name.downcase)
      print "Name to edit (or press ENTER, if you want to keep this one): "
      name_salved = contact[:name]

      contact[:name] = gets.chomp
      contact[:name] = contact[:name].empty? ? name_salved : contact[:name] # ternário precisa de '?'

      print "Cellphone to edit (or press ENTER, if you want to keep this one): "
      phone_salved = contact[:phone]

      contact[:phone] = gets.chomp
      contact[:phone] = contact[:phone].empty? ? phone_salved : contact[:phone]
      break
    # else
    #   puts "Name Not found!"
    #   break
    end
  end
end

####  MAIN CODE ####

puts "************************* Schedule's Manoel Bertin **************************"

puts "--- MENU --------------------------------------------------------------------"

loop do
  puts "1. Contacts\n2. New contact\n3. Show contact\n4. Edit contact\n5. Delete contact\n0. Exit (flag)"
  code = gets.chomp.to_i

  case
  when code == 1
    puts "    Names  -  Cellphones"
    puts "*************************************************************************"
    all_contacts
    puts "*************************************************************************"
  when code == 2
    add_contact
  when code == 3
    show_contact
    puts "*************************************************************************"
  when code == 4
    edit_contact
    puts "*************************************************************************"
  # when code == 5

  when code == 0 
    puts "**************************** GAME OVER **********************************"
    break
  end
end