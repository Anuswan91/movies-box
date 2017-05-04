@Notification = React.createClass
  getInitialState: ->
    time: 5
    type: @props.type
  getDefaultProps: ->
    type: ''
  componentDidMount: ->
    @timerID = setInterval(
      () => @tick(),
      1000
    );
  componentWillUnmount: ->
    clearInterval(@timerID)
    @setState @getInitialState()
  componentWillReceiveProps: (nextProps) ->
    @setState  @getInitialState()
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
    # console.log("works")
    if @state.type == 'add'
      @renderAdd()
    else if @state.type == 'edit'
      @renderEdit()
    else if @state.type == 'delete'
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
    console.log('time', @state.time)
    if @state.time
      @renderNotification()
    else
      null
