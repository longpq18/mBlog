class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	attr_accessible :user_id, :name, :content, :status, :category_id, :picture, :tag_list
	has_many :taggings
	has_many :tags, through: :taggings

	# has_attached_file :image,
	# 	:storage => :cloudinary,
 #  		:cloudinary_credentials => Rails.root.join("config/cloudinary.yml")
 #  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	mount_uploader :picture, ImageUploader


  	def self.tagged_with(name)
	  Tag.find_by_name!(name).posts
	end

	def self.tag_counts
	  Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
	end
end
