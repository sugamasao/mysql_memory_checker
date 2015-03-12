module MySQLMemoryChecker
  class ShowVariablesParser
    def initialize(filename)
      @filename = filename
    end

    def total_memory_size
      thread_memory_size + global_memory_size
    end

    def thread_memory_size
      vars = %w(sort_buffer_size join_buffer_size read_buffer_size read_rnd_buffer_size net_buffer_length)
      data['max_connections'].to_i * data.values_at(*vars).map(&:to_i).inject(:+)
    end

    def global_memory_size
      vars = %w(net_buffer_length query_cache_size innodb_buffer_pool_size innodb_additional_mem_pool_size innodb_log_buffer_size)
      data.values_at(*vars).map(&:to_i).inject(:+)
    end

    def thread_memory_list
      vars = %w(sort_buffer_size join_buffer_size read_buffer_size read_rnd_buffer_size net_buffer_length)
      data.select do |key, _|
        vars.include? key
      end
    end

    def max_connection
      data['max_connections']
    end

    def global_memory_list
      vars = %w(net_buffer_length query_cache_size innodb_buffer_pool_size innodb_additional_mem_pool_size innodb_log_buffer_size)
      data.select do |key, _|
        vars.include? key
      end
    end

    private

    def data
      return @data if @data

      @data = {}
      File.readlines(@filename).each do |line|
        key, value = line.chomp.split
        @data[key] = value unless key == 'Variable_name'
      end

      @data
    end
  end
end

