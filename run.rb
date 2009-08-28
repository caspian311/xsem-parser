require 'parse'

parser = Parser.new
parser.parse_file("asv-usfx.xml")
parser.print_all
