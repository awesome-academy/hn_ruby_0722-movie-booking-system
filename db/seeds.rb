# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Genre.create([{name: 'Horror'}, {name: 'Comedy'}, {name: 'Action'}, {name: 'Adventure'}, {name: 'Fantasy'}])

10.times do |n|
  title = "Alienoid #{n+1}"
  description = "Alienoid is a 2022 South Korean science fantasy action film directed by Choi Dong-hoon, starring Ryu Jun-yeol, Kim Woo-bin, and Kim Tae-ri. The film depicts an extraordinary story that unfolds as the gates of time open between late Goryeo and the present in 2022, when aliens appear."
  release_date = "2022-09-13"
  duration = "01:58:00"
  language = "English"
  cast = "Ryu Jun-yeol, Kim Woo-bin, and Kim Tae-ri"
  director = "Choi Dong-hoon"
  if n > 4
    genre_id = 5
  else
    genre_id = n + 1
  end
  if n % 2 == 0
    status = :active
  else
    status = :inactive
  end
  Movie.create!(title: title,
  description: description,
  release_date: release_date,
  duration: duration,
  language: language,
  cast: cast,
  director: director,
  status: status,
  genre_id: genre_id)
end
