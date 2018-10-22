class Survey < ApplicationRecord
  belongs_to :user
  serialize :places , Array
  serialize :properties , Array
end
