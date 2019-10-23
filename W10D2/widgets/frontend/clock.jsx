import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }
  
  tick() {
    this.setState({time: new Date()});
  }

  componentDidMount() {
    this.ticktick = setInterval(this.tick, 1000);

  }

  componentWillUnmount() {
    clearInterval(this.ticktick);
  }

  render() {
    return (
      <div id="clockDiv">
        <div id="time">
          <h2 id="time1">
            Time
          </h2>
      
          <h2 id="time2">
            {`${this.state.time.getHours()}:${this.state.time.getMinutes()}:${this.state.time.getSeconds()}`}
          </h2>
        </div>
        <br/>
        <div id="date">
          <h2 id="date1">
            Date
          </h2>
        
          <h2 id="date2">
            {`${this.state.time.getMonth()}-${this.state.time.getDay()}-${this.state.time.getFullYear()}`}
          </h2>
        </div>
      </div>
      
    )}
}

export default Clock;