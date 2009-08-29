require 'parser'

parser = Parser.new
parser.parse_file("data/asv-xsem.xml")
parser.print_all
