class Movie < ApplicationRecord
    validates_presence_of :title, message: "The title can't be blank."
    validates_presence_of :quote, message: "The quote can't be blank."
end
