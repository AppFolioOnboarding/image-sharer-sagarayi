import React, { Component } from 'react';
import PropTypes from 'prop-types';
import PostFeedbackService from '../services/PostFeedbackService';

class FeedbackForm extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  submitForm() {
    const params = {
      userName: this.props.store.userName,
      comments: this.props.store.comments
    };

    const service = new PostFeedbackService(this.props.store, params);
    service.postFeedback().then((response) => {
      if (response.message) {
        this.props.store.clearForm();
      } else {
        alert('An error occurred while processing your request');
      }
    });
  }

  render() {
    return (
      <div style={{ width: '800px', margin: '0 auto' }}>
        <form>
          <div className="form-group">
            <input
              type="text"
              className="form-control"
              id="user-name"
              placeholder="Name"
              onChange={e => this.props.store.setUserName(e.target.value)}
              value={this.props.store.userName}
            />
          </div>
          <div className="form-group">
            <textarea
              className="form-control"
              id="feedback"
              rows="3"
              placeholder="Comments"
              onChange={e => this.props.store.setComments(e.target.value)}
              value={this.props.store.comments}
            />
          </div>
          <div className="form-group" >
            <button
              className="form-control btn btn-primary col-2"
              id="submitButton"
              onClick={this.submitForm()}
            >Submit
            </button>
          </div>
        </form>
      </div>
    );
  }
}

export default FeedbackForm;
