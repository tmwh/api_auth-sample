class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :access_keys

  after_create :create_access_keys

  def create_access_keys
    self.access_keys.create!(user: self)
  end
end
