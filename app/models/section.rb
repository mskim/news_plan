class Section < ActiveRecord::Base
  belongs_to :issue
  after_create :setup
  
  def setup
    system("mkdir -p #{section_path}")          unless File.directory?(section_path)
    system("mkdir -p #{dropbox_section_path}")  unless File.directory?(dropbox_section_path)
  end
    
  def section_path
    issue.issue_path + "/#{page_number}"
  end
  
  def dropbox_section_path
    issue.dropbox_issue_path + "/#{page_number}"
  end
  
  def profile
    puts "+++++++in profile method"
    underscrore_ad_type = ad_type.gsub(" ", "_")
    p = ""
    p += "#{underscrore_ad_type}"
    p += "_H"                       if has_heading
    puts "grid_base:#{grid_base}"   
    p += "_#{grid_base}"            if grid_base
    p += "_#{box_count}"            if grid_base
    p
  end
  
  def section_template_path
    "#{Rails.root}/public/section_template/#{profile}"
  end
  
  def copy_section_template
    puts source = section_template_path
    puts target = dropbox_section_path
  end
end
