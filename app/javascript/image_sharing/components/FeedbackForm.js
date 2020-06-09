import React, { Component } from 'react';
import PropTypes from 'prop-types';

class FeedbackForm extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  render() {
    return (
      <div style={{ width: '800px', margin: '0 auto' }}>
        <form>
          <div className="form-group">
            <input
              type="email"
              className="form-control"
              id="user-name"
              placeholder="Name"
              onChange={e => this.props.store.setUserName(e.target.value)}
            />
          </div>
          <div className="form-group">
            <textarea
              className="form-control"
              id="feedback"
              rows="3"
              placeholder="Comments"
              onChange={e => this.props.store.setComments(e.target.value)}
            />
          </div>
          <div className="form-group" >
            <button
              className="form-control btn btn-primary col-2"
              id="submitButton"
            >Submit
            </button>
          </div>
        </form>
      </div>
    );
  }
}

export default FeedbackForm;
