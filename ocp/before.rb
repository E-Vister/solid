class MyLogger
  def log(message = '-')
    $stdout.write "#{Time.now.strftime("%b %d %Y %H:%M:%S")} - \"PC\" - Description: #{message}"
  end
end

logger = MyLogger.new
logger.log('hi')