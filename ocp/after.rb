class MyLogger
  def initialize(_prefix = "")
    @prefix = "#{Time.now.strftime("%b %d %Y %H:%M:%S")}  - \"PC\" -"
  end

  def log(message = '-')
    $stdout.write "#{@prefix} Description: #{message}"
  end
end

class CustomLogger < MyLogger
  def initialize(prefix = "")
    super
    @prefix = prefix
  end
end

logger = MyLogger.new
logger.log('hi')

puts "\n"

custom_logger = CustomLogger.new("#{Time.now.strftime("%H:%M:%S")}  - \"PC\" -")
custom_logger.log('hello')
