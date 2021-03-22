class Contact
    def initialize(name, age, location)
        @name = name
        @age = age
        @location = location
    end
    def info
        puts("Name: #{@name}\nAge: #{@age}\nLocation: #{@location}")
    end
    def asHash
        return {:name => @name, :age => @age, :location => @location}
    end
end