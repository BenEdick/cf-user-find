class License < ActiveRecord::Base
  belongs_to :user

  validates :state, length: { is: 2 }, format: { with: /\A[A-Z]{2}\z/ }

def state=(value)
  value = value.upcase.strip
  write_attribute :state, value
end

end
