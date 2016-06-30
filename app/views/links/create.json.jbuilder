json.extract! @link, :original, :clicks, :created_at, :updated_at
json.tinyUrl @link.getTinyUrl
