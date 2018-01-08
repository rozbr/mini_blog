class Post < ApplicationRecord
  has_and_belongs_to_many :categories

  validates_presence_of :title
  validates_presence_of :content

  def to_csv posts
    CSV.generate do |csv|
      csv << %w{ title content categories }

      posts.each do |post|
        categories = []

        post.categories.each do |category|
          categories << category.name
        end

        csv << [ post.title, post.content, categories.join(", ") ]
      end
    end
  end
end
