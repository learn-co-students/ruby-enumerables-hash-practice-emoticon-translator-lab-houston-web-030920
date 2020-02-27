require "yaml"


def load_library(path)
  emoticons = YAML.load_file(path)

  hash = {}

  hash[:get_meaning] = {}
  hash[:get_emoticon] = {}
  emoticons.each do |key,value|
    hash[:get_meaning][value[1]] = key.to_s
    hash[:get_emoticon][value[0]]= value[1]
  end
  pp hash
end

def get_japanese_emoticon(path,emoji)
  hash = load_library(path)

  if hash[:get_emoticon][emoji] != nil
    return hash[:get_emoticon][emoji]
  end

  "Sorry, that emoticon was not found"

end

def get_english_meaning(path,emoji)
  hash = load_library(path)

  if hash[:get_meaning][emoji] != nil
    return hash[:get_meaning][emoji]
  end

  "Sorry, that emoticon was not found"
end
