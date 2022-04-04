class User < ApplicationRecord
    has_secure_password

    has_many :post

    # validates :password, confirmation: true
    # validates :password_confirmation, presence: true

    # validates :email, presence: true, uniqueness: true
    # validates_presence_of :name,:message => "Please Provide User Name"

    self.inheritance_column = :_type_disabled

    before_create {generate_token(:auth_token)}

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end
end
