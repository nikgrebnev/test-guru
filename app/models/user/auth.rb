module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present? #есть и не пустая строка
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(str)
    salt = 'pwd123sdSDF$#%3555 '
    Digest::SHA1.hexdigest(str + salt)
  end

end