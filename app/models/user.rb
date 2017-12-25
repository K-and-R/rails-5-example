class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  can_skip_validation_for :password
  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
  validates :password, presence: true, on: [:create, :update], unless: proc { |u| u.skip_password_validation? }
  validate :passwords_match?, on: [:create, :update], unless: proc { |u| u.skip_password_validation? }

  def has_password?
    !!encrypted_password.present?
  end

  def password_required?
    if skip_password_validation?
      return false
    else
      super
    end
  end

  def passwords_match?
    errors.add(:password, 'Passwords must match') unless password == password_confirmation
  end

  ##
  # Used by the ActionAdmin view to display an admin link to a record of this class.
  #
  def admin_path
    admin_user_path(self)
  end

  def admin?
    has_role?(:admin)
  end
end
