json.extract! publication, :id, :name, :paper_size, :width, :height, :margin, :page_count, :sections, :created_at, :updated_at
json.url publication_url(publication, format: :json)