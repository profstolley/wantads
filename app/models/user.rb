class User < ActiveRecord::Base
  has_many :ads

  def self.find_or_create_from_auth_hash(hash)
    if find_by_provider_and_uid(hash['provider'], hash['uid'])
    else
      create(username: hash['info']['nickname'], name: hash['info']['nickname'],location: hash['info']['location'], image: hash['info']['image'], provider: hash['provider'], uid: hash['uid'])
    end
  end

end
