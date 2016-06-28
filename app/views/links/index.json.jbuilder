json.array!(@links) do |link|
  json.extract! link, :tinyfied, :original, :clicks
  json.url link_url(link, format: :json)
end
