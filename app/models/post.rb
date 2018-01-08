class Post < ApplicationRecord
  has_and_belongs_to_many :categories

  validates_presence_of :title
  validates_presence_of :content

  def to_csv posts
    CSV.generate do |csv|
      csv << %w{ title content }

      posts.each do |post|
        csv << [ post.title, post.content ]
      end
    end
  end
end
