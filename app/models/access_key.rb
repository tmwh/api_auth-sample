class AccessKey < ActiveRecord::Base
  belongs_to :user

  validates :secret, :user, presence: true

  before_validation :generate_secret

  def generate_secret
    self.secret ||= ApiAuth.generate_secret_key
  end
end
