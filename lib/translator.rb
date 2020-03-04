require "yaml"
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons.each do |key, value|
    new_hash["get_meaning"][value[1]] = key 
    new_hash["get_emoticon"][value[0]] = value[1] 
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons["get_emoticon"][emoticon]
  if !emoticons["get_emoticon"][emoticon] 
    return "Sorry, that emoticon was not found"
  end 
  emoticons["get_emoticon"][emoticon]
 
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons["get_meaning"][emoticon]
  if !emoticons["get_meaning"][emoticon]
  return "Sorry, that emoticon was not found"
end
emoticons["get_meaning"][emoticon]
end