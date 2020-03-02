require 'yaml'
require 'pry'

def load_library(emoticon_file)
  emoticon_hash = {}
  yml_file = YAML.load_file(emoticon_file)
  emoticon_hash[:get_meaning] = {}
  emoticon_hash[:get_emoticon] = {}
  
  yml_file.each do |key,value|
    emoticon_hash[:get_meaning][value[1]] = key
    emoticon_hash[:get_emoticon][value[0]] = value[1]
    
  end
  emoticon_hash
end

#-------------------------------

def get_japanese_emoticon(yml_file, emoticon)
  emoticon_file  = load_library(yml_file)
  japanese_equivalent = "Sorry, that emoticon was not found"
  
  emoticon_file[:get_emoticon].each do |k, v|
    if emoticon == k
      japanese_equivalent = v 
    end
  end
  japanese_equivalent
end

#-------------------------------
def get_english_meaning(yml_file, emoticon)
  emoticon_file  = load_library(yml_file)
  english_meaning = "Sorry, that emoticon was not found"
  
  emoticon_file[:get_meaning].each do |k, v|
    if emoticon == k
      english_meaning = v 
    end
  end
  english_meaning

end