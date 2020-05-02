

class HogwartsHouseTour::CLI

    def start
        student_welcome
        get_house_data
        # tour_loop
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

    # def tour_loop
    #    menu
    # end


end