import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0
    };
  }

  render() {
    return (
      <div id="tabDiv">
        <ul id="tabUl">
          <li id="tab">
            <h1 onClick={() => {this.setState({index: 0})}}>{this.props.tabs[0].title}</h1>
            {/* <article>{this.props.tabs[0].content}</article> */}
          </li>
          <li id="tab"> 
            <h1 onClick={() => {this.setState({index: 1})}}>{this.props.tabs[1].title}</h1>
            {/* <article>{this.props.tabs[1].content}</article> */}
          </li>
          <li id="tab">
            <h1 onClick={() => {this.setState({index: 2})}}>{this.props.tabs[2].title}</h1>
          </li >  
        </ul>

        <article id="tabContent">{this.props.tabs[this.state.index].content}</article>
      </div>
    )}
}

export default Tabs;