class User < ActiveRecord::Base
  module AuthToken
    extend ActiveSupport::Concern

    included do
      before_save :ensure_authentication_token
    end

    def ensure_authentication_token
      if authentication_token.blank?
        self.authentication_token = generate_authentication_token
      end
    end

    private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include AuthToken

  has_many :expenses
end
