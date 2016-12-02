class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
 :recoverable, :rememberable, :trackable, :validatable,
 :omniauthable, omniauth_providers: [:facebook]


def self.find_for_facebook_oauth(auth)
	 user = find_by(provider: auth.provider, uid: auth.uid)
	 # The User was found in our database
	 return user if user
	 # Check if the User is already registered without Facebook
	 user = find_by(email: auth.info.email)
	 return user if user
	p "birthday = #{'auth.extra.raw_info.birthday'}"
	 create(
		 name: auth.extra.raw_info.name,
		 provider: auth.provider,
		  uid: auth.uid,
		 email: auth.info.email,
		  image: auth.info.image,
		 password: Devise.friendly_token[0,20],
		 birthday: Date.try(:strptime, auth.extra.raw_info.birthday, '%m/%d/%Y'),
		 gender: auth.extra.raw_info.gender

		 )
 end

end
