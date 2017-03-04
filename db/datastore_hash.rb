module Airport

  class FormAttributes
    LIST = 
      {1 => [{:code => "ATL"}, {:name => "Hartsfield-Jackson Atlanta International Airport"},{:location => [:city=> "Atlanta", :state=> "GA"]}]},
      {2 => [{:code => "LAX"}, {:name => "Los Angeles International Airport"},{:location => [:city=> "Los Angeles", :state=> "CA"]}]},
      {3 => [{:code => "ORD"}, {:name => "O'Hare International Airport"},{:location => [:city => "Chicago", :state => "IL"]}]},
      {4 => [{:code => "DFW"}, {:name => "Dallas/Fort Worth International Airport"},{:location => [:city => "Dallas/Fort Worth",:state => "TX"]}]},
      {5 => [{:code => "JFK"}, {:name => "John F. Kennedy International Airport"},{:location => [:city => "New York", :state => "NY"]}]},
      {6 => [{:code => "DEN"}, {:name => "Denver International Airport"},{:location => [:city => "Denver", :state => "CO"]}]},
      {7 => [{:code => "SFO"},{:name => "San Francisco International Airport"},{:location => [:city => "San Francisco", :state => "CA"]}]},
      {8 => [{:code => "CLT"},{:name => "Charlotte Douglas International Airport"},{:location => [:city => "Charlotte", :state => "NC"]}]},
      {9 => [{:code => "LAS"},{:name => "McCarran International Airport"},{:location => [:city => "Las Vegas", :state => "NV"]}]},
      {10 => [{:code => "PHX"},{:name => "Phoenix Sky Harbor International"},{:location => [:city => "Phoenix", :state => "AZ"]}]}

      def airport_code
        LIST.map do |d|
          d.map do |k,v|
            v[0][:code]
          end
        end
      end


      def airport_name
        LIST.map do |d|
          d.map do |k,v|
            v[1][:name]
          end
        end
      end

      def airport_city
        LIST.map do |d|
          d.map do |k,v|
            v[2][:location][0][:city]
          end
        end
      end

      def city_to_code(city)
        puts LIST
        LIST.select {|x| x.include? city}
      end

  end

end

puts Airport::FormAttributes.new.city_to_code("Los Angeles")
