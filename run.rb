require 'parser'

parser = Parser.new
parser.parse_file("data/asv-usfx.xml")
parser.print_all
