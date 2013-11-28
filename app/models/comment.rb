# Award
class Comment < ActiveRecord::Base
  belongs_to :post, counter_cache: true

  has_one :author, through: :post, counter_cache: true
end
