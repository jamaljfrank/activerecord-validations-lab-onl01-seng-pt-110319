class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non_Fiiction)}
  validate :clickbait?
  
  


private

  CLICKBAIT_WORDS = [
    "Won't Believe",
    "Secret",
    "Top [number]",
    "Guess"
  ]
  
  def bait_words
    CLICKBAIT_WORDS.any? {|bait| title.include?(bait)}
  end
  
  def clickbait?
    unless bait words
      errors.add(:title, "must be clickbait")
    end  
  end
end
