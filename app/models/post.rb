class Post < ApplicationRecord
    has_many :comments

    paginates_per 5
end
