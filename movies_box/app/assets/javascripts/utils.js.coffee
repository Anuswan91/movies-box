@setArray = (array, newValue) ->
  if array.includes( newValue )
    array.splice( array.indexOf( newValue ), 1 )
  else
    array.push( newValue )
  return array

@getIdInArray = (array) ->
  arryId = []
  for element in array
      arryId.push(element.id)

@getArrayIdFromString = (array, arrayId) ->
  array = array.split(',')
  i = 0
  ret = []
  for val in array
    if i != 0
      val = val.substring(1, val.length);
    for element in arrayId
      if val == element.name
        ret.push(element.id)
    i = i+1
  return ret

@convertDataFromAPI = (data, allGenres) ->

  console.log(getArrayIdFromString(data.Genre, allGenres))

  title = data.Title
  released = data.Released
  runtime = data.Runtime
  plot = data.Plot
  rating = data.Ratings[0].Value # TODO garder que l'unité
  added = ''
  watched = 'false'
  format_id = ''
  image = data.Poster
  genres = getArrayIdFromString(data.Genre, allGenres)
  languages = []
  subtitles = []
  countries = []
  movie = {title: title, released: released, runtime: runtime, plot: plot, rating: rating, added: added, watched: watched, format_id: format_id, image: image, genres: genres, languages: languages, subtitles: subtitles, countries: countries}
  return movie

@convertStringToUrl = (string) ->
  string.replace(' ', '+')
