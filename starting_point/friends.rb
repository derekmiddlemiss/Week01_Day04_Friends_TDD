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
  person[:friends].push(name)
  return person[:friends]
end