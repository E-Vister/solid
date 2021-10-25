class TerminalPrinter
  def write(msg, _opts)
    $stdout.write "#{@prefix} #{msg}"
  end
end

class FilePrinter
  def write(msg, opts)
    filename = opts.fetch(:filename) {'log.txt'}
    File.open(filename, 'a+:UTF-8') do |f|
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

  def log(msg:, printer: TerminalPrinter, opts: {})
    printer.new.write "#{@prefix} #{msg}", opts
  end
end

logger = MyLogger.new
logger.log msg: 'hi'
logger.log msg: 'hi', printer: FilePrinter, opts: {filename: 'log.txt'}