

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



end