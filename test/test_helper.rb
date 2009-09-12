$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require "rubygems"
require "test/unit"

require File.dirname(__FILE__) + "/../lib/bible"
require File.dirname(__FILE__) + "/../lib/book"
require File.dirname(__FILE__) + "/../lib/chapter"
require File.dirname(__FILE__) + "/../lib/verse"
require File.dirname(__FILE__) + "/../lib/db_importer"
require File.dirname(__FILE__) + "/../lib/xsem_parser"
require File.dirname(__FILE__) + "/../lib/xsem_stream_listener"
require File.dirname(__FILE__) + "/../lib/sql_builder"

require File.dirname(__FILE__) + "/../test/test_connection_info"
