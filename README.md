# news_plan

Rails app for planning newspaper.

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
  - advertise
  - grid_frame: text
  - section_id: integer

### SectionTemplate
  - grid_base
  - grid_key
  - has_heading: boolean
  - has_ad: boolean

### ArticleBox
  - grid_frame: text
  - section_template_id: integer

### AdBox
  - grid_frame: text
  - section_template_id: integer
