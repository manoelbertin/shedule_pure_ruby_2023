# by Manoel Bertin - June 4th,9th, 2023.
@schedule = [
  {name: "diegol", phone: "9996-85256"},
  {name: "isabel", phone: "8876-80056"},
  {name: "carlos", phone: "9600-00056"}
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
  if name.empty?
    puts "Error: The 'Name' can Not be empty!"
  end
  @schedule.each do |contact|  
    if contact[:name].downcase <=> name.downcase
      puts "Error: There is already this name '#{name}'" 
    else
      @schedule << {name: name, phone: phone}
    end
    break
  end
end

def show_contact
  print "Type to find a name: "
  name = gets.chomp.downcase

  @schedule.each do |contact|
    if contact[:name].downcase == name.downcase
      puts "\nNome  -  Cellphone\n"
      puts "#{contact[:name]} - #{contact[:phone]}"
    else
      puts "Error: The name '#{name}' Not found or 'string empty'!"
       break
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
    end
  end
end

def delete_contact
  print "What's the name do you wanna to delete?"
  name = gets.chomp

  @schedule.each do |contact|
    if contact[:name].downcase == (name.downcase)
      position_array = @schedule.index(contact)
      puts ""
      puts "Name: '#{contact[:name]}' in the #{position_array + 1}º position deleted sucessful!"
      @schedule.delete_at(position_array)
      break
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
  when code == 5
    delete_contact
    puts "*************************************************************************"
    all_contacts
    puts "*************************************************************************"
  when code == 0 
    puts "**************************** GAME OVER **********************************"
    break
  else 
    puts "Error:  This option(number) NOT found!"
  end
end