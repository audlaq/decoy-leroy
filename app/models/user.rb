class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
      user = User.create(
          name: auth.info.nickname,
          provider: auth.provider,
          uid: auth.uid,
          image: auth.info.image,
          token: auth.credentials.token,
          secret: auth.credentials.secret,
          email: User.create_unique_email,
          password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  as_enum :decoy, [:none, :leroy, :troy]

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end

  def self.random_decoy(decoy)
    self.send(decoy.pluralize).sample(1).first
  end

  def tweet(args)

    content = "@#{args[:current_user].name}: " + args[:content]

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_key']
      config.consumer_secret     = ENV['twitter_secret']
      config.access_token        = self.token
      config.access_token_secret = self.secret
    end

    client.update(content)
  end
end
