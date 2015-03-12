# MySQLMemoryChecker

MySQLのメモリ使用量計算マン

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mysql_memory_checker', github: 'sugamasao/mysql_memory_checker'
```

And then execute:

    $ bundle

## Usage

dump mysql variables.

```
$ mysql -u root -e "show variables" > /tmp/show_variables.log
```

`/tmp/show_variables.log` use this code.

```
$ bundle exec ruby exe/mysql_memory_checker /tmp/show_variables.log
```

output.

```
--------------------
*** thread memory ***
--------------------
join_buffer_size                 :    0.25 MB (262144 byte)
net_buffer_length                :    0.02 MB (16384 byte)
read_buffer_size                 :    0.12 MB (131072 byte)
read_rnd_buffer_size             :    0.25 MB (262144 byte)
sort_buffer_size                 :    0.25 MB (262144 byte)
max_connection                   :  151
--------------------
*** global memory ***
--------------------
innodb_additional_mem_pool_size  :    8.00 MB (8388608 byte)
innodb_buffer_pool_size          :  128.00 MB (134217728 byte)
innodb_log_buffer_size           :    8.00 MB (8388608 byte)
net_buffer_length                :    0.02 MB (16384 byte)
query_cache_size                 :    1.00 MB (1048576 byte)
[total memory]
--------------------
*** total memory ***
--------------------
thread_memory_size               :  134.48 MB (141017088 byte)
global_memory_size               :  145.02 MB (152059904 byte)
total_memory_size                :  279.50 MB (293076992 byte)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec mysql_memory_checker` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mysql_memory_checker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
