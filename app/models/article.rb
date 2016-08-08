class Article < ActiveRecord::Base
    
    # presence - Force to put a title when we create a article.
    # length - Validate the length of the field.
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end