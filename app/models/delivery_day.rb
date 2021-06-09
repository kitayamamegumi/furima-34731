class DeliveryDay < ActiveHash::Base
  self.data = [
    { id: 1, data: '---' },
    { id: 2, data: '１〜２日で発送' },
    { id: 3, data: '２〜３日で発送' },
    { id: 4, data: '４〜７日で発送' }
  ]
  include ActiveHash::Associations
  has_many :items
end
