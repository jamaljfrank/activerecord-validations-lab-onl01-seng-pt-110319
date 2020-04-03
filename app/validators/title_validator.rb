class TitleValidator < ActiveModel::Validator
  
  CLICKBAIT_WORDS = 
    /Won't Believe/
    /Secret/
    /Top [0-9]/
    /Guess/;
  
  
  def validate(record)
    unless record.title.match(CLICKBAIT_WORDS)
      record.errors[:title] << "Title must include clickbait words."
    end
  end
end