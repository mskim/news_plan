# news_plan

Rails app for planning newspaper.

1. Spreadsheet like data is entered
1. it is converted to sections and issue template is generated.
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

### Issue
  - date: date
  - publication_id: integer

### Section
  - name
  - issue_id: integer
  - grid_key

  * has_many :articles
  * has_many :ads

### Article
  - title
  - kind
  - grid_frame: text
  - section_id: integer

### Ad
  - advertiser
  - grid_frame: text
  - kind
  - section_id: integer

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
