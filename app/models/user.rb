class User < ApplicationRecord
  has_secure_password
  has_many :auth_tokens

  def generate_reset_password_token
    update!(reset_password_token: SecureRandom.urlsafe_base64(8), reset_password_token_expire_at: 1.days.from_now)
  end

  def reset_password_token_expired?
    reset_password_token_expire_at < Time.now
  end


  def clear_reset_password_token
    self.reset_password_token = nil
    self.reset_password_token_expire_at = nil
  end



end