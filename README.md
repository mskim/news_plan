# news_plan

Rails app for planning newspaper.

## Preparation
  - we prepare section_templates for ad_types and number of article_box, and Heading Page

### To generate Issue Template
1. Spreadsheet like data is entered
    - 1, color, page_1, ad_type, advertiser, article_box
    -  , color, page_8, ad_type, advertiser, article_box      
    - 2, bw, page_2, ad_type, advertiser, article_box
    -  , bw, page_7, ad_type, advertiser, article_box      
    - 3, color, page_3, ad_type, advertiser, article_box
    -  , color, page_6, ad_type, advertiser, article_box      
    - 4, bw, page_4, ad_type, advertiser, article_box
    -  , bw, page_5, ad_type, advertiser, article_box      


1. it is then converted to sections and issue template is generated.
1. Ads can be booked in advance

## page_plan

## ad_plan

## tables

### Publication
  - name
  - sections: text
  - period
  - paper_size
  - width: float
  - height: float
  - margin: float
  - page_count: integer
  - sections: text   #[]

### Issue
  - date: date
  - publication_id: integer
  - issue_plan: text


### Section
  - issue_id: integer
  - name
  - page_number: integer
  - color_page: boolean
  - has_heading: boolean
  - grid_base
  - box_count:integer
  - ad_type

  * has_many :articles
  * has_many :ads

### Article
  - title
  - kind		#story, picture
  - grid_frame: text
  - section_id: integer

### Ad
  - advertiser
  - ad_type
  - section_id: integer
  - grid_frame: text

### SectionTemplate
  - grid_base
  - grid_key
  - has_heading: boolean
  - has_ad: boolean
  - data: text

### ArticleBox
  - grid_frame: text
  - section_template_id: integer

### AdTemplate
  - name
  - column_count
  - grid_width
  - grid_height
