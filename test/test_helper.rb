$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require File.dirname(__FILE__) + "/../lib/asv_parser"
require File.dirname(__FILE__) + "/../lib/asv_stream_listener"

require "test/unit"