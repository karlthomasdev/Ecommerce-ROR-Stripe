class Package
	include Mongoid::Document

  field :quantity, type: Integer
  field :price, type: Integer
end
