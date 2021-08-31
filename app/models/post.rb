class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait?

    # clickbait_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]


    def clickbait?
        unless title.to_s.include?("Won't Believe") || title.to_s.include?("Secret") || title.to_s.include?("Top [number]") || title.to_s.include?("Guess")
            errors.add(:title, "must be clickbait")
        end

        # unless clickbait_titles.none? { |i| i.match title }
        #   errors.add(:title, "must be clickbait")
        # end
    end
end
