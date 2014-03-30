class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  acts_as_taggable
  acts_as_taggable_on :tags
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/style/missing_:style.png"
  validates_attachment :avatar,
                       :presence => true,
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ },
                       :size => { :in => 0..1.megabytes }

  validates :title, presence: true, 
  					length: { minimum: 5 }

  validates_presence_of :tag_list  
end