

class HogwartsHouseTour::CLI

    def start
        student_welcome
        get_house_data
        tour_loop
    end


    def student_welcome
        puts "\n\n\n"
        puts "Welcome to Hogwarts School of Witchcraft and Wizardry!"
        sleep (1)
        puts "\n\n\n"
    end

    def get_house_data
        HogwartsHouseTour::APIManager.get_house
    end

    def tour_loop
        loop do 
            menu 
            input = get_house_choice
            break if input == "exit"
            if input == "invalid"
                puts "\n"
                puts " ☠ Merlin's beard! I don't believe that was an option... try once more! "
                puts "\n\n"
                next
            end
            display_chosen_house(input)
        end
    end

    def menu
        display_tour_instructions
        puts "\n"
        display_all_houses

    end

    def display_all_houses
        HogwartsHouseTour::Houses.all.each_with_index do |h, i|
            puts "#{i+1} #{h.name}" 
        end
    end

    def display_tour_instructions
        puts "Later this evening the start-of-term banquet will be held in The Great Hall. Before you are seated, your sorting ceremony will take place. 
        Until then you may explore the Houses of Hogwarts.."
        puts "\n"
        puts " ϟ Please select a House by number or input 'exit' to exit the program. ϟ"
        puts "\n"
    end

    def get_house_choice
        input = gets.strip

        if input == "exit"
            return "exit"
        end

        if !valid?(input)
            return "invalid"
        end
        input.to_i-1 
    end

    def valid?(input)
        input.to_i.between?(1,HogwartsHouseTour::Houses.all.length)
    end

    def display_chosen_house(i)
        h = HogwartsHouseTour::Houses.all[i]
        puts "You have selected the House of #{h.name}:"
        puts "\n"
        puts " ϟ #{h.name}'s mascot is the #{h.mascot.capitalize}."
        print " ϟ Their house colors are: "
        puts "#{self.ox_comma(h.colors)}."
        print " ϟ #{h.name}'s values include: "
        puts "#{self.ox_comma(h.values)}."
        puts " ϟ The founder of the House of #{h.name} is #{h.founder}."
        puts " ϟ #{h.name}'s current head of house is #{h.head_of_house}."
        puts "\n\n"
        puts "ϟ You may press any key to continue wandering.. ϟ"
        gets
    end

    def ox_comma(array)
        if array.length == 1
            return array[0]
          elsif array.length == 2
            return array.join(" and ")
          else 
            
            first_part = array[0..-2]
            last_part = array[-1]
            first_string = first_part.join(", ")
            ending_string = ", and #{last_part}"
            return first_string + ending_string 
        end
    end

end