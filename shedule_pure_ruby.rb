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
  # when code == 3

  # when code == 4
    
  # when code == 5

  when code == 0 
    puts "**************************** GAME OVER **********************************"
    break
  end
end