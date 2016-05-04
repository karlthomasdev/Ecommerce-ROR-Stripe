class Order
  include Mongoid::Document
  belongs_to :customer
  embeds_many :lessons
  belongs_to :instructor

  field :price, type: Integer
  field :quantity, type: Integer
end