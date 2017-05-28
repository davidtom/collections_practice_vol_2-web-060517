require "pry"

def begins_with_r (array)
  array.each do |e|
    if e.start_with?("r")
      next
    else
      return false
    end
  end
  true
end

def contain_a (array)
  new_array = array.collect do |e|
    e if e.include?("a")
  end
  new_array.compact
end

def first_wa (array)
  array.find do |e|
    e.to_s.start_with?("wa")
  end
end

def remove_non_strings(array)
  string_array = Array.new
  array.each do |e|
    string_array << e if e.class == String
  end
  string_array
end

def count_elements (array)

  #Create deep copy method, since it doesnt exist in ruby by default
  def deep_copy(o)
  Marshal.load(Marshal.dump(o))
  end

  #Use .collect to iterate through array, deep copying each element
  #.uniq is used in .collect statement to ensure returned array contains no
  # duplictes
  array.uniq.collect do |e|
    e2 = deep_copy(e)
    # puts "array is currently #{array}"
    # puts "e is currently #{e}"
    e2[:count] = array.count(e)
    e2
    # puts "e has been changed to #{e}"
    # puts "---"
  end
end


def merge_data (key_array, data_array)
  new_array = Array.new
  data_array[0].each {|key, value|
    key_array.each {|e|
      new_array << e.merge(value) if e[:first_name] == key
      ## NEED AN IF STATMENT HERE TO MAKE SURE THE RIGHT HASHES ARE MERGED
    }
  }
  new_array
end

def find_cool(array)
  cool_people = []
  array.each { |person|
    cool_people << person if person[:temperature] == "cool"
  }
  cool_people
end

def organize_schools(schools)
  organized_hash = Hash.new
  schools.each { |key, value|
    if organized_hash.keys.include?(value[:location])
      organized_hash[value[:location]] << key
    else
      organized_hash[value[:location]] = [key]
    end
  }
  organized_hash
end

keys = [
       {
        :first_name => "blake"
    },
       {
        :first_name => "ashley"
    }
]

data = [
       {
         "blake" => {
            :awesomeness => 10,
                 :height => "74",
              :last_name => "johnson"
        },
        "ashley" => {
            :awesomeness => 9,
                 :height => 60,
              :last_name => "dubs"
        }
    }
]

def cool
  [
        {
               :name => "ashley",
        :temperature => "sort of cool"
    },
        {
               :name => "blake",
        :temperature => "cool"
    }
  ]
end

def schools
  {
    "flatiron school bk" => {
      :location => "NYC"
    },
    "flatiron school" => {
      :location => "NYC"
    },
    "dev boot camp" => {
      :location => "SF"
    },
    "dev boot camp chicago" => {
      :location => "Chicago"
    },
    "general assembly" => {
      :location => "NYC"
    },
    "Hack Reactor" => {
      :location => "SF"
    }
  }
end
