module Posts
  class CalculateReadingTime < ApplicationService
    WORDS_READ_PER_MINUTE = 230

    def initialize(content)
      @content = content
    end

    def call
      words_count = content.scan(/\W+/).count
      reading_time = (words_count / WORDS_READ_PER_MINUTE).ceil
      return 1 if reading_time.zero?
    end

    private

    attr_reader :content
  end
end
