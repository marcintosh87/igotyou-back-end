class User < ActiveRecord::Base
  has_many :hposts
  has_many :gposts

  private
end
