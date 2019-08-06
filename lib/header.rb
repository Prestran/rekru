class Header
    def initialize(input_hash)
        @input_hash = input_hash
    end

    def call
        simulate_headers
    end


    def simulate_headers
        levels = (@input_hash.map{ |x| x[:heading_level] }).uniq
        max_level = levels.max
        @labels = {}
        (max_level+1).times{ |level| @labels[level] = 0 }

        combined_string = ""
        @input_hash.each_with_index do |element|
            @labels[element[:heading_level]] += 1

            tabulators = "\t" * element[:heading_level]
            heading_number = get_number(element)

            combined_string += tabulators + " #{heading_number}" + element[:title]
            puts tabulators + " #{heading_number}" + element[:title]
        end
        combined_string
    end

    private

    def get_number(element)
        ret = ""
        (element[:heading_level]+1).times do |i|
            abc = @labels[i] == 0 ? "1" : @labels[i].to_s
            ret += "#{abc}."
        end
        ret
    end
end