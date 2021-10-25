class TerminalPrinter
  def write(msg)
    $stdout.write "#{@prefix} #{msg}"
  end
end

class FilePrinter
  def write(msg)
    File.open('log.txt', 'a+:UTF-8') do |f|
      f.write msg
      f.write "\n"
    end

    puts "\nLog file successful"
  end
end

class MyLogger
  def initialize
    @prefix = "#{Time.now.strftime("%b %d %Y %H:%M:%S")}  - \"PC\" -"
  end

  def log_stdout(message)
    TerminalPrinter.new.write "#{@prefix} #{message}"
  end

  def log_file(message)
    FilePrinter.new.write "#{@prefix} #{message}"
  end
end

logger = MyLogger.new
logger.log_stdout 'hi'
logger.log_file 'hi'