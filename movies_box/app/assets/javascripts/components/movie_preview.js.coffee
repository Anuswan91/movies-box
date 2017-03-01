@MoviePreview = React.createClass
  render: ->
    React.DOM.div
      className: 'col-sm-6 col-md-4'
      React.DOM.div
        className: 'thumbnail'
        React.DOM.img
          src: '...'
          alt: '...'
        React.DOM.div
          className: 'caption'
          React.DOM.h3
            className: 'title movie-preview'
            'Title Movie'
          React.DOM.p, null,  '...'
          React.DOM.p, null
            React.DOM.a
              className: 'btn btn-primary'
              role: 'button'
              href: '#'
              'See'
            React.DOM.a
              className: 'btn btn-default'
              role: 'button'
              href: '#'
              'Edit'
