class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	attr_accessible :user_id, :name, :content, :status, :category_id, :picture, :tag_list
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :comments

	validates :name, presence: true, allow_blank: false
	validates :category_id, presence: true, allow_blank: false
	validates :picture, presence: true, allow_blank: false
	#validates :tag_list, presence: true, allow_blank: false
	validates :content, presence: true, allow_blank: false

	# has_attached_file :image
 #    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	mount_uploader :picture, ImageUploader


  	def self.tagged_with(name)
	  Tag.find_by_name!(name).posts
	end

	def self.tag_counts
	    Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")

	    #DataMapper.repository.adapter.select('select tags.*, t.count from tags inner join (select taggings.tag_id, count(taggings.tag_id) as count from taggings group by taggings.tag_id) t where tags.id = t.tag_id')
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
	end

	def self.search(search)
		  where("name LIKE ?", "%#{search}%") 
		  where("content LIKE ?", "%#{search}%")
	end
end
