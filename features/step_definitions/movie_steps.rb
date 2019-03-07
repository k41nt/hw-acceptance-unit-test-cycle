Given(/^the following movies exist:$/) do |movies_table|
  movies_table.hashes.each do |movie_hash|
    Movie.create movie_hash
  end
end

Then(/^the director of "(.+)" should be "(.+)"/) do |title, director|
  movie = Movie.find_by(title: title)
  expect(director).to eq(movie.director)
end

Then(/^the rating of "(.+)" should be "(.+)"/) do |title, rating|
  movie = Movie.find_by(title: title)
  expect(rating).to eq(movie.rating)
end

When(/^I choose "([^"]*)" in "([^"]*)" as release date$/) do |value, select_label|
  select_date value, from: select_label
end
