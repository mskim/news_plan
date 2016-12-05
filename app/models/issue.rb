class Issue < ActiveRecord::Base
  
  belongs_to :publication
  after_create :setup
  
  def setup
    system("mkdir -p #{issue_path}")          unless File.directory?(issue_path)
    system("mkdir -p #{drop_box_issue_path}") unless File.directory?(drop_box_issue_path)
  end
  
  def issue_path
    publication.publication_path + "/#{id}"
  end
  
  def drop_box_issue_path
    publication.dropbox_path + "/#{date}"  
  end
  
  def generate_issue
    require 'csv'
    # create folders
    rows  = CSV.parse(spread_plan)
    keys  = rows.shift
    rows.each do |row|
      puts "++++++++"
      puts spread               = row[0]
      puts color                = row[1]
      puts "++++++++"
      puts first_ad_type        = row[2]
      puts first_advertiser     = row[3]
      puts first_article_count  = row[4]
      # create first Page
      puts second_ad_type       = row[5]
      puts second_advertiser    = row[6]
      puts second_article_count = row[7]
      # create second Page
    end
    
    
  end
end
