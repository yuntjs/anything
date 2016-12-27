class Restaurant < ApplicationRecord
  has_and_belongs_to_many :users

  def self.limit
    40
  end

  def self.open_now
    true
  end

  def self.category
    Category.all.sample.category
  end

  def self.been_to?(user,name)
    user.restaurants.find_by(yelp_id: name).count > 0
  end

  def self.choose_random_offset(restaurants,total,limit=self.limit)
    offset = self.max_offset(restaurants,limit)
    return (1..offset)
  end

  def self.more_than_40?(restaurants,limit=self.limit)
    restaurants.count > limit
  end

  def self.max_offset(restaurants,limit=self.limit)
    restaurant_count = restaurants.count
    restaurant_count - limit
  end

end
