module Posts
  # This class is read text and count how much words in it.
  # Knowing the number of words, we have to calculate how much time it takes
  # to read.
  class CalculateReadingTime < ApplicationService
    WORDS_READ_PER_MINUTE = 230

    def initialize(content)
      @content = content
    end

    def call
      words_count = content.scan(/\W+/).count

      # we cannot read 0 minutes :)
      return 1 if words_count < WORDS_READ_PER_MINUTE

      (words_count / WORDS_READ_PER_MINUTE).ceil
    end

    private

    attr_reader :content
  end
end
