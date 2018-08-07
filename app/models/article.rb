class Article < ApplicationRecord
 validates :title, presence: true , length: { minimum: 3 , Maximum: 50}
 validates :description , presence: true , length:{ minimum: 10 , maximum: 300} 
  
end
