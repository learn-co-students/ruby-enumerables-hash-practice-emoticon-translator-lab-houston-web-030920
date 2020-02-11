# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  files = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  files.each do |meaning, emoticon|
    result["get_meaning"][emoticon[1]] = meaning
    result["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  result
end

def get_japanese_emoticon(file_path, emoticon)
  emo = load_library(file_path)
  jap_emo = emo["get_emoticon"][emoticon]
  if jap_emo
    jap_emo
  else 
    "Sorry, that emoticon was not found"
  end
end 

def get_english_meaning(file_path, emoticon)
  emo = load_library(file_path)
  eng_meaning = emo["get_meaning"][emoticon]
  if eng_meaning
    eng_meaning
  else
    "Sorry, that emoticon was not found"
  end
end




