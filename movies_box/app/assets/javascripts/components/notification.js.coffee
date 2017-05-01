@Notification = React.createClass
  render: ->
    React.DOM.div
      className: 'alert alert-success navbar-fixed-top' # TODO fixer la notif en haut
      role: 'alert'
      React.DOM.strong null, 'New movie! '
      'The movie has been successfully added.'
