class Task < ApplicationRecord
validates_presence_of :name,:introduction
belongs_to :todo
end
