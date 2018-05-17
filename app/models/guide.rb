class Guide < ApplicationRecord
    enum status: [:pending, :published, :removed]

end
