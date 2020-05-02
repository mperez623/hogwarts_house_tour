

class HogwartsHouseTour::APIManager
    
    BASE_URL = "https://www.potterapi.com/v1/"


    def self.get_house
        url = BASE_URL + "houses?key=$2a$10$XrLOe6GDU1jqPs5WmZVTaOXajAT08n.NDFgKMOFy.65H4jmRCfghu"
        res = HTTParty.get(url)
        data = JSON.parse(res.body, symbolize_names: true)
        HogwartsHouseTour::Houses.create_house_from_api(data)
    end

end
