class AuthenticateUserByEmail
  prepend SimpleCommand 

  def initialize(email, password, payload = {}, exp = 24.hours.from_now) 
    @email    = email 
    @password = password 
    @payload  = payload
    @exp      = exp
  end 

  def call 
    payload[:user_id] = user.id
    JsonWebToken.encode(payload || payload, exp) if user 
  end 

  private 
    attr_accessor :email, :password, :payload, :exp

    def user 
      user = User.find_by(email: email) 

      return user if user && user.valid_password?(password) 

      errors.add :user_authentication, 'invalid credentials' 
      nil 
    end 
end
