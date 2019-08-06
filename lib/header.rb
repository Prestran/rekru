class Header
    def initialize(input_hash)
        @input_hash = input_hash
    end

    def call
        simulate_headers
    end

    def simulate_headers
        # searching for maximum header level and creating hash that will be counting how many itmes have we added header on given level
        levels = (@input_hash.map{ |x| x[:heading_level] }).uniq
        max_level = levels.max
        @labels = {}
        (max_level+1).times{ |level| @labels[level] = 0 }

        combined_string = ""

        #iterating through all given records
        @input_hash.each_with_index do |element|
            #increasing given level counter
            @labels[element[:heading_level]] += 1

            #getting header ready
            tabulators = "\t" * element[:heading_level]
            heading_number = get_number(element)
        
            # putting header and preparing it to be returned
            combined_string += tabulators + " #{heading_number}" + element[:title]
            puts tabulators + " #{heading_number}" + element[:title]
        end
        combined_string
    end

    private

    def get_number(element)
        ret = ""

        #iterating through every level that is required to print current one and adding it to returned string
        (element[:heading_level]+1).times do |i|
            abc = @labels[i] == 0 ? "1" : @labels[i].to_s
            ret += "#{abc}."
        end
        ret
    end
end