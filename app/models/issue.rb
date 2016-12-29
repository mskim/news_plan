class Issue < ActiveRecord::Base

  belongs_to :publication
  has_many :sections
  after_create :setup

  def setup
    system("mkdir -p #{issue_path}")          unless File.directory?(issue_path)
    system("mkdir -p #{dropbox_issue_path}")  unless File.directory?(dropbox_issue_path)
  end

  def issue_path
    publication.publication_path + "/#{id}"
  end

  def dropbox_issue_path
    publication.dropbox_path + "/#{date}"
  end

  def copy_issue_files
    # copy Ralefile and issue confile file
    puts "need to copy issue config, Rakefile"
  end

  def generate_sections
    require 'csv'
    # create folders
    copy_issue_files
    rows  = CSV.parse(issue_plan)
    rows.shift
    rows.each do |row|
      spread              = row[0]
      page_array          = spread.split("_")
      first_page_number   = page_array[0].to_i
      second_page_number  = page_array[1].to_i
      color = false
      color = true        if row[1] =~/[Cc]olor/
      first_ad_type       = row[2].gsub(" ", "-")
      first_advertiser    = row[3]
      first_article_count = row[4]
      # create first Page
      first = Section.where(issue_id: id, page_number: first_page_number, color_page: color, ad_type: first_ad_type, box_count: first_article_count).first_or_create
      Ad.where(section_id: first.id, ad_type: first_ad_type, advertiser: first_advertiser)
      second_ad_type       = row[5].gsub(" ", "-")
      second_advertiser    = row[6]
      second_article_count = row[7]
      # create second Page
      second = Section.where(issue_id: id, page_number: second_page_number, color_page: color, ad_type: second_ad_type, box_count: second_article_count).first_or_create
      Ad.where(section_id: second.id, ad_type: second_ad_type, advertiser: second_advertiser)
    end
  end
end
