def get_name(person)
  return person[:name]
end

def get_tv_show(person)
  return person[:favourites][:tv_show]
end

def like_food?(person,food)
  return person[:favourites][:things_to_eat].include?(food)
end

def add_friend(person, name)
  if person[:friends].include?(name) == false
    person[:friends].push(name)
  end
end

def remove_friend(person, name)
  if person[:friends].include?(name) == true
    person[:friends].delete(name)
  end
end

def total_money(people)
  total = 0
  people.each { |person| total += person[:monies] }
  return total
end

def extend_loan(from_person,to_person,amount)
  from_person[:monies] -= amount
  to_person[:monies] += amount
end

def favourite_food_all(people)
  set_of_foods = []
  people.each { |person| set_of_foods += 
    person[:favourites][:things_to_eat] }
  return set_of_foods
end

def nae_mates(people)
  persons_with_nae_mates = []
  for person in people do
    if ( person[:friends].length() == 0 )
      persons_with_nae_mates += [ person[:name] ]
    end
  end
  return persons_with_nae_mates
end

