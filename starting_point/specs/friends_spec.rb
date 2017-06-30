require( 'minitest/autorun' )
require_relative( '../friends.rb' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Dave", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      } 
    }
    
    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Baywatch",
        things_to_eat: ["soup","bread"]
      } 
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      } 
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Dave"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      } 
    }

    @person5 = {
      name: "Dave",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      } 
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  def test_getting_name
    result = get_name(@person5)
    assert_equal("Dave", result)
  end

  # 1. For a given person, return their favourite tv show
  def test_get_tv_show()
    result = get_tv_show(@person4)
    assert_equal("Pokemon", result)
  end

  # 2. For a given person, check if they like a particular food
  def test_like_food?()
    result = like_food?(@person1,"charcuterie")
    assert_equal(true, result)
  end

  # 3. Allow a new friend to be added to a given person
  def test_add_friend()
    add_friend(@person5, "Colin")
    assert_equal(["Colin"], @person5[:friends])
  end

  # 4. Allow a friend to be removed from a given person
  def test_remove_friend()
    result = remove_friend(@person4, "Jay")
    assert_equal(["Rick", "Dave"], @person4[:friends])
  end  

  # 5. Find the total of everyone's money
  def test_total_money()
    result = total_money(@people)
    assert_equal(143, result)
  end

  # 6. For two given people, allow the first person to loan a given value of money to the other
  def test_extend_loan()
    extend_loan(@person5,@person1,50)
    assert_equal(-1, @person5[:monies]-@person1[:monies])
  end


  # 7. Find the set of everyone's favourite food joined together
  def test_favourite_food_all()
    result = favourite_food_all(@people)
    food_set = ["charcuterie"] + ["soup","bread"] + ["ratatouille", "stew"] + ["spaghetti"] + ["spinach"]
    assert_equal(food_set,result)
  end

  # 8. Find people with no friends
  def test_nae_mates()
    result = nae_mates(@people)
    assert_equal(["Dave"],result)
  end

  # VERY tough
  # Find the people who have the same favourite tv show

end
