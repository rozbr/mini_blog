class Post < ApplicationRecord
  has_and_belongs_to_many :categories

  validates_presence_of :title
  validates_presence_of :content

  def to_csv
    CSV.generate do |csv|
      csv << %w{ title content }
      csv << [ self.title, self.content ]
    end
  end
end
