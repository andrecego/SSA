class Character < ApplicationRecord
  has_one :stat, dependent: :destroy
  accepts_nested_attributes_for :stat, 
                                 reject_if: lambda {|attributes| attributes['kind'].blank?}
end
