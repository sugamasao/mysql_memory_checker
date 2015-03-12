require "mysql_memory_checker/version"

require_relative 'mysql_memory_checker/show_variables_parser'

module MySQLMemoryChecker
  def self.run(filename)
    parser = ShowVariablesParser.new(filename)

    puts '-' * 20
    puts '*** thread memory ***'
    puts '-' * 20
    parser.thread_memory_list.each do |key, value|
      puts output_format(key, value)
    end
    puts format('%-32s : %4s', 'max_connection', parser.max_connection)

    puts '-' * 20
    puts '*** global memory ***'
    puts '-' * 20
    parser.global_memory_list.each do |key, value|
      puts output_format(key, value)
    end
    puts '-' * 20
    puts '*** total memory ***'
    puts '-' * 20
    puts output_format('thread_memory_size', parser.thread_memory_size)
    puts output_format('global_memory_size', parser.global_memory_size)
    puts output_format('total_memory_size', parser.total_memory_size)
  end

  def self.output_format(key, value)
    format('%-32s : %7.2f MB (%d byte)', key, value.to_i / 1024.0 / 1024.0, value.to_i)
  end
end

