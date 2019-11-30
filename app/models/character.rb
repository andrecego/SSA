class Character < ApplicationRecord
  has_one :base_attribute, dependent: :destroy
  accepts_nested_attributes_for :base_attribute, 
                                 reject_if: lambda {|attributes| attributes['kind'].blank?}
end
