# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
require File.expand_path(File.dirname(__FILE__) + "/environment")
#
rails_env = Rails.env.to_sym
rails_root = Rails.root.to_s


# environment は設定しないと production になってしまう
# set :output, "/path/to/my/cron_log.log"
set :environment, rails_env
set :output, "#{rails_root}/log/cron.log"


# 毎日 AM 4:30 に runner タスクを実行する
every 1.days, at: ['4:30 am'] do
  runner 'User.user_destroy'
end

# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever