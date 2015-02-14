class Article < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category
  after_create :generate_key

  private
  def generate_key
    key = rand(1000..9999)
    self.secret_link = "/articles/#{self.id}/edit?key=#{key}"
    self.save
  end

end
