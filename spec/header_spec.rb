require_relative "../lib/header.rb"

describe Header do
    describe  ".simulate_headers" do
        it "should return proper tabulated and separated headers for 4 headings" do  
            sample_data = [ {id: 1, title: 'Heading1', heading_level: 0},   {id: 2, title: 'Heading2', heading_level: 2},{id: 3, title: 'Heading3', heading_level: 1},{id: 4, title: 'Heading4', heading_level: 1} ]
            header = Header.new(sample_data)

            expected_string =" 1.Heading1\t\t 1.1.1.Heading2\t 1.1.Heading3\t 1.2.Heading4"
            expect(header.simulate_headers).to eq expected_string
        end

        it "should return proper tabulated and separated headers for 5 headings" do  
            sample_data =[ {id: 1, title: 'Heading1', heading_level: 0},   {id: 2, title: 'Heading2', heading_level: 3},{id: 3, title: 'Heading3', heading_level: 4},{id: 4, title: 'Heading4', heading_level: 1}, {id: 5, title: 'Heading5', heading_level: 0} ]
            header = Header.new(sample_data)

            expected_string =" 1.Heading1\t\t\t 1.1.1.1.Heading2\t\t\t\t 1.1.1.1.1.Heading3\t 1.1.Heading4 2.Heading5"
            expect(header.simulate_headers).to eq expected_string
        end
    end
end