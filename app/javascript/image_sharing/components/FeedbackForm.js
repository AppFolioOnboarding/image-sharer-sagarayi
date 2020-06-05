import React, { Component } from 'react';
import { inject } from 'mobx-react';

class FeedbackForm extends Component {
  /* Add Prop Types check*/
  render() {
    return (
      <div style={{ width: '800px', margin: '0 auto' }}>
        <form>
          <div className="form-group">
            <input type="email" className="form-control" id="user-name" placeholder="Name" />
          </div>
          <div className="form-group">
            <textarea className="form-control" id="feedback" rows="3" placeholder="Comments" />
          </div>
          <div className="form-group" >
            <button className="form-control btn btn-primary col-2" id="submitButton" >Submit</button>
          </div>
        </form>
      </div>
    );
  }
}

export default inject('stores')(FeedbackForm);
