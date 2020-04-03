class TitleValidator < ActiveModel::Validator
  
  CLICKBAIT_WORDS = [
    "Won't Believe",
    "Secret",
    "Top [0-9]",
    "Guess"
  ]
  
  def validate(record)