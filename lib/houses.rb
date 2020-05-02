

class HogwartsHouseTour::Houses

    @@all =[]

    attr_accessor :name, :mascot, :head_of_house, :founder, :values, :colors

    def self.all
        @@all
    end

    def self.create_house_from_api(arrhshs)
        arrhshs.each do |hh|
            new(hh[:name], hh[:mascot], hh[:headOfHouse], hh[:founder], hh[:values], hh[:colors])
        end

    end


    def initialize(name, mascot, head_of_house, founder, values, colors)
        @name, @mascot, @head_of_house, @founder, @values, @colors = name, mascot, head_of_house, founder, values, colors
        save
    end

    def save
        @@all << self
    end

end

