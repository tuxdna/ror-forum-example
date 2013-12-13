require 'digest/sha1'

class User < ActiveRecord::Base
  # attr_accessor :password

  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :userid, :presence => true, :uniqueness => true, :length => { :in => 6..8 }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  # Authentication logic
  def self.authenticate(userid, password)
    user = User.find_by_userid(userid)
    if user && user.match_password_basic(password)
      return user
    else
      return false
    end
  end

  # Password matching: Very insecure!!!
  def match_password_basic(p)
    puts "p: #{p}"
    puts "password: #{password}"
    p == password
  end

  # Use SHA1 hash
  def match_password_sha1(p)
    p == Digest::SHA1.hexdigest(password)
  end

end
