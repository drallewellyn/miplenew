json.array!(@pletools) do |pletool|
  json.extract! pletool, :id, :title, :link, :description
  json.url pletool_url(pletool, format: :json)
end
