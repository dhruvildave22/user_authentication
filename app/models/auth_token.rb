class AuthToken < ApplicationRecord
  belongs_to :user
  after_initialize :set_defaults

  def set_defaults
    byebug
    self.token ||= SecureRandom.urlsafe_base64(8)
    self.expire_at ||= 1.days.from_now
  end

end