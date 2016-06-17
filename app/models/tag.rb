class Tag < ActiveRecord::Base
	attr_accessible :name
	has_many :taggings
	has_many :posts, through: :taggings

	def self.tag_counts
	  Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")
	end
end
