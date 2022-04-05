class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    validate :clickbait?

    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
    ]

    def clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
            errors.add(:title, "must be clickbait")
        end
    end

end


# Finally, add a custom validator to the Post model that ensures the title is sufficiently clickbait-y. The validator should add a validation error if the title does not contain:

# "Won't Believe"
# "Secret"
# "Top [number]"
# "Guess"