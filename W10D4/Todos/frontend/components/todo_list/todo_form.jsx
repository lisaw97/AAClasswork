import React from 'react';

class TodoForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      id: Math.floor(Math.random() * 100),
      title: "",
      body: "",
      done: false,
    };

    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    // this.updateDone = this.updateDone.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateTitle(e) {
    this.setState({
      title: e.target.value
    });
  }

  updateBody(e) {
    this.setState({
      body: e.target.value
    });
  }

  // updateDone(e) {
  //   this.setState({
  //     done: e.target.value
  //   });
  // }

  handleSubmit(e) {
    e.preventDefault();
    this.props.receiveTodo(this.state);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <h3>Add To Do</h3>

        <label>Title:
          <input 
            onChange={this.updateTitle}
            type="text"
            value={this.state.title}
          />
        </label>

        <label>Body:
          <input
            onChange={this.updateBody}
            type="text"
            value={this.state.body}
          />
        </label>

        <input type="submit" value="Add Todo!"/>
      </form>
    )
  }
}

export default TodoForm;