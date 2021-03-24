require_relative("Contact")
require("json")

$contacts = JSON.parse(File.read("contacts.json"))

def addContact
    print "Name: "
    name = gets.chomp
    print "Age: "
    age = gets.chomp.to_i
    print "Location: "
    location = gets.chomp

    File.open("contacts.json", "w") do |book|
        dude = Contact.new(name.capitalize, age, location.capitalize)
        $contacts.append(dude.asHash)
        book.write(JSON.pretty_generate($contacts))
    end
end

def listContacts
    print("\n")
    for i in 0..$contacts.length - 1
        puts "Name: #{$contacts[i]["name"]}\nAge: #{$contacts[i]["age"]}\nLocation: #{$contacts[i]["location"]}\n\n"
    end 
    print("\n")
end

def getContact(name)
    name = name.capitalize
    found = false
    for i in 0..$contacts.length - 1
        if $contacts[i]["name"] == name
            puts "\nName: #{$contacts[i]["name"]}\nAge: #{$contacts[i]["age"]}\nLocation: #{$contacts[i]["location"]}\n\n"
            found = true
            break
        end
    end
    if found == false
        puts "No contact found with the name #{name}"
    end
end

while true
    print "1: Create Contact\n2: List Contacts\n3: Get certain Contact\n4: Quit\nNum: "
    choice = gets.chomp
    case choice
        when "1"
            addContact
        when "2"
            listContacts
        when "3"
            print "Name: "
            getContact(gets.chomp)
        when "4"
            exit
    end
end