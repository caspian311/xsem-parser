class VerseModel
	attr_reader :reference
	attr_accessor :text

	def initialize(reference)
		@reference = reference
	end
end

