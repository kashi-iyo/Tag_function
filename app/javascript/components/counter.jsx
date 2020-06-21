// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class Counter extends Component {
  constructor(props) {
    super(props)

    this.state = {
      count: props.count
    }
  }

  handleUp = () => {
    this.setState({
      count: ++this.state.count
    })
  }

  handleDown = () => {
    this.setState({
      count: --this.state.count
    })
  }

  render() {
    return (
      <div>
        <div>{ this.state.count }</div>
        <button onClick={ this.handleUp }>+</button>
        <button onClick={ this.handleDown }>-</button>
      </div>
    )
  }
}

Counter.defaultProps = {
  count: 0
}

Counter.propTypes = {
  count: PropTypes.number
}
// const Hello = props => (
//   <div>Hello {props.name}!</div>
// )
//
// Hello.defaultProps = {
//   name: 'David'
// }
//
// Hello.propTypes = {
//   name: PropTypes.string
// }

// const MoneyBook = () => {
//   return(
//     <div>
//       <h1>小遣い帳</h1>
//     </div>
//   )
// }
// export default MoneyBook
// document.addEventListener('DOMContentLoaded', () => {
//   ReactDOM.render(
//     <MoneyBook />,
//     // <Hello name= "AAAA" />,
//     document.getElementById('root')
//     // document.body.appendChild(document.createElement('div')),
//   )
// });
