class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non_Fiction)}
  validate :clickbait?
  
  


private

  CLICKBAIT_WORDS = [
    "Won't Believe",
    "Secret",
    "Top [0-9]",
    "Guess"
  ]
  
  def bait_words
    CLICKBAIT_WORDS.any? {|bait| params[:title].include?(bait)}
  end
  
  def clickbait?
    unless bait_words
      errors.add(:title, "must be clickbait")
    end  
  end
end
