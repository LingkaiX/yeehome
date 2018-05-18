json.extract! guide, :id, :title, :desc, :created_at, :updated_at, :content
json.url guide_url(guide, format: :json)
json.cover_image rails_blob_path(guide.cover_image)