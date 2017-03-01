@Header = React.createClass
  render: ->
    React.DOM.div
      className: 'header'
      React.DOM.div
        className: 'jumbotron text-center'
        React.DOM.h1 null, 'MoviesBox'
        React.DOM.p null, 'Application to manage my movies.'
      React.createElement Menu
