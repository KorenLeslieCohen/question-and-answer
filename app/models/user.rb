class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  # to add github
  # def self.create_with_omniauth(auth_hash)
  #   self.create(
  #     :provider => auth_hash["provider"], 
  #     :name => auth_hash["info"]["name"], 
  #     :uid => auth_hash["uid"]
  #     )
  # end 

  # facebook
  def self.from_omniauth(auth_hash)
    where(auth_hash.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth_hash.provider
      user.uid = auth_hash.uid
      user.name = auth_hash.info.name
      user.email = auth_hash.info.email
      user.image = auth_hash.info.image
      user.oauth_token = auth_hash.credentials.token
      user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
      user.save!
    end
  end

   def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end 

end
