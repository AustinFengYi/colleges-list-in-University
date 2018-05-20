class Todo < ApplicationRecord
  validates_presence_of :name,:introduction

  has_many :tasks
  accepts_nested_attributes_for :tasks, 
  :allow_destroy => true,
  :reject_if => :all_blank, 
  :update_only => true

end
