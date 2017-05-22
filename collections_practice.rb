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


def merge_data (array)

end
