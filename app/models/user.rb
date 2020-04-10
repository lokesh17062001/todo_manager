class User < ActiveRecord::Base
  def to_displayed
    "#{id}. #{name} #{email} #{password}"
  end
end
