

class HogwartsHouseTour::Houses

    @@all =[]

    attr_accessor :name, :mascot, :head_of_house, :house_ghost, :founder, :values, :colors

    def self.all
        @@all
    end

    def self.create_house_from_api(arrhshs)
        arrhshs.each do |hh|
            new(hh[:name], hh[:mascot], hh[:head_of_house], hh[:house_ghost], hh[:founder], hh[:values), hh[:colors]
    end


    def initialize(name, mascot, head_of_house, house_ghost, founder, values, colors)
        @name, @mascot, @head_of_house, @house_ghost, @founder, @values, @colors = name, mascot, head_of_house, house_ghost, founder, values, colors
    end

    def save
        @@all << self
    end

    









end

