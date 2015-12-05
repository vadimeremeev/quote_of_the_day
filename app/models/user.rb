class User < ActiveRecord::Base
	validates_uniqueness_of :telegram_user_id
end
