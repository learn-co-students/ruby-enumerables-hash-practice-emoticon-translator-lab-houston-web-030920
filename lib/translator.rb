require 'yaml'
require 'pry'

def load_library(file_path)
  emote_list = YAML.load_file(file_path)
  get_meaning = {}
  get_emoticon = {}

  emote_list.each do |meaning, emotes_array|
    get_meaning[emotes_array[1]] = meaning
  end 

  emote_list.each do |meaning, emotes_array|
    get_emoticon[emotes_array[0]] = emotes_array[1]
  end 
  result = {:get_meaning => get_meaning, :get_emoticon => get_emoticon}
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  found = false
  library[:get_emoticon].each do |english, japanese|
    if emoticon == english
      emoticon = japanese
      found = true
    end
  end
  if found == true
    return emoticon 
  elsif found == false
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  found = false
  library[:get_meaning].each do |japanese, english_meaning|
    if emoticon == japanese
      emoticon = english_meaning
      found = true
    end
  end
  if found == true
    return emoticon
  elsif found == false
    return "Sorry, that emoticon was not found"
  end 
end