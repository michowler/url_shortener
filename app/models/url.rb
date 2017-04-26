class Url < ApplicationRecord
  validates :long_url, presence: true
  validates :long_url, uniqueness: true
  validate :is_valid_url

	before_create do 
		self.short_url = shorten
	end

    def shorten
    # Write a method here
        return ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(7).join
    end

    def is_valid_url
    #TODO upgrade validations
   		unless !self.long_url.nil? && self.long_url.start_with?("http://", "https://") 
      		errors.add(:long_url, "must start with http:// or https://")
    	end
	end

end
