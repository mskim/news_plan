class Publication < ActiveRecord::Base
  has_many :issues
  after_create :setup
  
  def setup
    system("mkdir -p #{publication_path}")          unless File.directory?(publication_path)
    system("mkdir -p #{dropbox_path}") unless File.directory?(dropbox_path)
  end
  
  def underscore_publication_name
    name.gsub(" ", "_")
  end
  
  def dropbox_path
    File.expand_path("~/Dropbox/#{underscore_publication_name}")
  end
  
  def publication_path
    "#{Rails.root}/public/news/#{underscore_publication_name}"
  end
  
end
