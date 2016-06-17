module PostsHelper
	def tag_links(tags)
	  tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
	end
	
	def tag_cloud(tags, classes)
	    max = 0
	    tags.each do |t|
	      if t.count.to_i > max
	        max = t.count.to_i
	      end 
	    end
	    tags.each do |tag|
	      index = tag.count.to_f / max * (classes.size - 1)
	      yield(tag, classes[index.round])
	    end
	end 
end
