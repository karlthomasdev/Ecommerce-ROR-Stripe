class Lesson
  include Mongoid::Document
  embedded_in :order
  
  field :status, type: String
  field :dateused, type: Date
end