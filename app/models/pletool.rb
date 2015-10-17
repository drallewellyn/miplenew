class Pletool < ActiveRecord::Base
  attr_accessor :image_file_name
  acts_as_taggable
  acts_as_taggable_on :tags
  has_attached_file :image, :styles => { :large=> "900x900>", :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  extend FriendlyId
  friendly_id :title, use: :slugged
end