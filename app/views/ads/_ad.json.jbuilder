json.extract! ad, :id, :section_id, :integer, :ad_type, :advertiser, :created_at, :updated_at
json.url ad_url(ad, format: :json)