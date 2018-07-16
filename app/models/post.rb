class Post < ApplicationRecord
    has_many :comments
<<<<<<< HEAD
    belongs_to :user
=======

    paginates_per 5
>>>>>>> 89c04a759893d80699696eef003d2e6f0c506f66
end
