#encoding: utf-8
class User < ActiveRecord::Base

  attr_accessible :name, :phone, :group_id, :password, :password_confirmation, :remember_token, :current_trip
  has_secure_password

  before_save :create_remember_token

  validates :name, :presence => {:message => '用户名不能为空'}, Length: { maximum: 50 },
            :uniqueness => {:case_sensitive => false, :message => '用户重名'}
  validates :password, :presence => {:message => '密码不能为空'}, Length: { minimum: 6, message: "密码长度最少6位"}
  validates :password_confirmation,  :presence => true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

