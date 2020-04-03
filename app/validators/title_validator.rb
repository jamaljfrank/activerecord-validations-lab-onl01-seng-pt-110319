class TitleValidator < ActiveModel::Validator
  
  CLICKBAIT_WORDS = [
    /Won't Believe/,
    /Secret/,
    /Top [0-9]/,
    /Guess/
    ]
  
  
  def validate(record)
    if CLICKBAIT_WORDS.none? { |word| word.match record.title }
      record.errors[:title] << "Title must include clickbait words."
    end
  end
  
  
end