class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :title_is_clickbait


    #custom validations 
    def title_is_clickbait
        clickbait_regex = /\b(Won\'t Believe|Secret|Top \d+|Guess)\b/i
        unless clickbait_regex.match? title
            errors.add(:title, "This title is not clickbait-y enough!") 
        end
    end

    # CLICKBAIT_PATTERNS = [
    #     /Won't Believe/i,
    #     /Secret/i,
    #     /Top \d/i,
    #     /Guess/i
    #   ]
    
    #   def title_is_clickbait
    #     if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
    #       errors.add(:title, "must be clickbait")
    #     end
    #   end


end
