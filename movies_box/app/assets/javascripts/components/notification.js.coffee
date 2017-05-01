@Notification = React.createClass
  getInitialState: ->
    time: 5
  componentDidMount: ->
    @timerID = setInterval(
      () => @tick(),
      1000
    );
  componentWillUnmount: ->
    clearInterval(@timerID)
  tick: ->
    time = @state.time
    if time != 0
      time = time - 1
      @setState time: time
  renderAdd: ->
    React.DOM.div
      className: 'alert alert-success navbar-fixed-top'
      role: 'alert'
      React.DOM.strong null, 'New movie! '
      'The movie has been successfully added.'
  renderEdit: ->
    React.DOM.div
      className: 'alert alert-info navbar-fixed-top'
      role: 'alert'
      React.DOM.strong null, 'Movie edited! '
      'The movie has been successfully edited.'
  renderDelete: ->
    React.DOM.div
      className: 'alert alert-warning navbar-fixed-top'
      role: 'alert'
      React.DOM.strong null, 'Movie deleted! '
      'The movie has been successfully deleted.'
  renderNotification: ->
    # TODO switch case
    if @props.type == 'add'
      @renderAdd()
    else if @props.type == 'edit'
      @renderEdit()
    else if @props.type == 'delete'
      @renderDelete()
    else
      null
    # switch @props.type
    #   case: 'add'
    #     @renderAdd()
    #   case: 'edit'
    #     @renderEdit()
    #   case: 'delete'
    #     @renderDelete()
    #   default
    #     null
  render: ->
    # console.log('type', @props.type)
    if @state.time
      @renderNotification()
    else
      null
