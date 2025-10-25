# populate the database with movies
Given "the following movies exist:" do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# step to check multiple ratings
When /I (check|uncheck) the following ratings: (.*)/ do |action, ratings_list|
  ratings = ratings_list.split(', ')
  ratings.each do |rating|
    field_name = "ratings[#{rating}]"
    if action == "check"
      check(field_name)
    else
      uncheck(field_name)
    end
  end
end

# step to check if all movies are visible
Then "I should see all of the movies" do
  rows = page.all('tbody tr').size
  expect(rows).to eq(Movie.count)
end

# step to verify order of movies
Then /I should see "(.*)" before "(.*)"/ do |movie1, movie2|
  expect(page.body.index(movie1)).to be < page.body.index(movie2)
end