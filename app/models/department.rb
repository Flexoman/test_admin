class Department < ApplicationRecord

  DEFAULT_TITLES = %w[
    Marketing
    Accounting
    Sales
    IT
    HR
  ]

  has_many :jobs

end
