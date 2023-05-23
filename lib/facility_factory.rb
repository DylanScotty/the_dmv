class FacilityFactory

    def create_or_facility(facility)
        facility = facility.slice(:title, :location_1, :phone_number)
        facility[:name] = facility.delete(:title)
        facility[:address] = parse_or_address(facility.delete(:location_1))
        facility[:phone] = facility.delete(:phone_number)
        Facility.new(facility)
    end

    def parse_or_address(raw_address)
        raw = raw_address[:human_address]
        parsed_address = JSON.parse(raw)
        "#{parsed_address["address"]}, #{parsed_address["city"]}, #{parsed_address["state"]} #{parsed_address["zip"]}"
    end
end