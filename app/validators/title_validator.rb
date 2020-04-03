class TitleValidator < ActiveModel::Validator
  
  CLICKBAIT_WORDS = 
    /Won't Believe/
    /Secret/
    /Top [0-9]/
    /Guess/;
  
  
  def validate(record)
    if CLICKBAIT_words.none? { |word| word.match record.title }
      record.errors[:title] << "Title must include clickbait words."
    end
  end
  
  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end