# news_plan

Rails app for planning newspaper.

## How doest it work?

1. User registers
    - name email,
1. User creates his Publication
    - period, heading Graphics, size, grid_base, ad_types
    - selects theme
1. For each issue, user creates issue template by providing issue_plan.csv
1. When IssuePlan is created, issue template repository is created at layout server
1. Each reporters pulls the repos for editing.
1. When any of them pushes the edited content back,
    - it updates PDF
    - it updates html static site
1. Whole process can be monitored as they get updated

## Preparation
we prepare section_templates
- ad_types
- number of article_box
- Heading Page

## TODO by Designers
- section.grid_frame by key_name
- PDF sample that represents the layout
- we also need layout sample by ad_type
    - sample by article_box column_count

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
