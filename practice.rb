# transform this:
name_list = ['bob', 'james', 'james', 'susan', 'susan', 'susan']
# into this
expected_result = { 'bob' => 1,  'james' => 2, 'susan' => 3 }


#group_by or sort_by

name_list.group_by{|name| }



def array_grouping(name_list)
  name_list.each do |name|
    name_list.delete(name)
    {name: group_count(name_list, name)}
  end
end

def group_count(name_list, name)
  if name_list.includes?(name) == false
    count = 1
  else
    name_list.includes?(name)
    count ++
    group_count
  end
  return count
end
































num_list = [1,2,3,4,5,6,7,8,9,10]

highest = num_list.max
lowest = num_list.min

sum = 0

counter = 0
max= num_list[0]
min = num_list[0]
sum = 0

num_list.each do |num|
  if num[counter] < min
    min = num
  elsif num[counter] > max
    max = num
  counter ++
  sum+= num
  end
end


average = sum/counter.to_f

#if the first number is bigger than second number,
#first number is max
#second number is min
#continue checking through each one
#at end find the average
#another variable that essentially adds everything
#/ by the length of the num_list


num_list.each { |a| sum+=a }
average = sum / num_list.count.to_f

puts(highest, lowest, sum, num_list.count, average)

# now calculate max/min/avg

#how do we iterate through one time the list to find the biggest smallest and avg
