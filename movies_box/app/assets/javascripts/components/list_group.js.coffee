@ListGroup = React.createClass
  getInitialState: ->
    list: @props.list
  render: ->
    React.DOM.ul
      className: 'list-group'
      for element in @state.list
        React.DOM.li
          className: 'list-group-item'
          key: "#{ element.id }"
          "#{ element.name }"
