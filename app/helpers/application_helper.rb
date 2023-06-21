module ApplicationHelper
  def reading_time(input)
    words_per_minute = 180

    words = input.split.size
    minutes = (words / words_per_minute).floor
    minutes.positive? ? "#{minutes} min" : 'less than 1 min'
  end
end
