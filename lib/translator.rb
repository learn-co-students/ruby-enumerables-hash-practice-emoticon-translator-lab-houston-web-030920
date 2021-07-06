# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  lib = YAML.load_file(file_path)
  newHash = {"get_meaning"=> {}, "get_emoticon"=> {} } 
  lib.each do |meaning, emoticons| 
    newHash["get_meaning"][emoticons[1]] = meaning
    newHash["get_emoticon"][emoticons[0]] = emoticons[1]
  end 
  newHash
end

def get_japanese_emoticon(file_path, e_emoticon)
  
  lib = load_library(file_path)
    if lib["get_emoticon"].include?(e_emoticon) 
    lib["get_emoticon"][e_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, j_emoticon)
 lib = load_library(file_path)
 if lib["get_meaning"].include?(j_emoticon)
   lib["get_meaning"][j_emoticon]
 else"Sorry, that emoticon was not found"
 end 
end