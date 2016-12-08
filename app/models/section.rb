class Section < ActiveRecord::Base
  belongs_to :issue
  has_many :ads
  after_create :setup
  
  def setup
    system("mkdir -p #{section_path}")          unless File.directory?(section_path)
    system("mkdir -p #{dropbox_section_path}")  unless File.directory?(dropbox_section_path)
    copy_section_template
  end
    
  def section_path
    issue.issue_path + "/#{page_number}"
  end
  
  def dropbox_section_path
    issue.dropbox_issue_path + "/#{page_number}"
  end
  
  def profile
    grid_base = "7x15"  unless grid_base
    box_count = 4       unless box_count
    ad_type.gsub!(" ", "-")
    p = ""
    p += "#{ad_type}"
    p += "/#{grid_base}"             
    p += "_H"                       if has_heading
    p += "/#{box_count}"            
    p
  end
  
  def section_template_path
    "#{Rails.root}/public/section_template/#{profile}"
  end
  
  def copy_section_template
    source = section_template_path
    target = dropbox_section_path
    puts "cp -r #{source} #{target}"
    system("cp -r #{source} #{target}/")
  end
end
