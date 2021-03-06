class Glosentry < ActiveRecord::Base

  self.table_name = 'recipes'

  mount_uploader :picture, PictureUploader

  validates_presence_of :keyword
  validates_length_of :keyword, :maximum => 64

  class GlosentryHelper
    include ActionView::Helpers::TextHelper
  end
 
  def helper
    @h ||= GlosentryHelper.new
  end
 
  def short_explanation(len=20) 
    helper.truncate(self.explanation, :length => len)
  end

  def index
    @glosentries = Glosentry.all(:order => :keyword)
   end

end
