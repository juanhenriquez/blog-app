class Article < ActiveRecord::Base
    
    # Force to put a title when we create a article.
    validate :title, presence: true
    
end