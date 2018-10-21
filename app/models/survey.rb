class Survey < ApplicationRecord
  belongs_to :user
  serialize :places, Array
end
