class Pet < ApplicationRecord

  validates_presence_of :name, :age, :sex, :image, :current_shelter

  belongs_to :shelter

end
