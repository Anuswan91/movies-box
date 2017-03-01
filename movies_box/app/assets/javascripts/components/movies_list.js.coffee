@MoviesList = React.createClass
  render: ->
    React.DOM.div
      className: 'movies-list'
      React.DOM.h1
        className: 'title movies-list'
        'List Movies'
      React.DOM.div
        className: 'row'
        React.createElement MoviePreview
