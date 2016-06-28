json.array!(@links) do |link|
  json.extract! link, :original, :clicks
  json.tinyUrl link.getTinyUrl
end
