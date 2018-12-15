class SshDetail < ActiveRecord::Base
  validates :ssh_username, presence: true, uniqueness: true
  validates :ssh_password, presence: true
  validates :ip_address, presence: true, uniqueness: true
  validates :port, presence: true, uniqueness: true
end
