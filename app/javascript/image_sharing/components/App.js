import React, { Component } from 'react';
import PropTypes from 'prop-types';
import Header from './Header';
import Footer from './Footer';
import FeedbackForm from './FeedbackForm';


class App extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };
  render() {
    return (
      <div>
        <Header title="Tell us what you think" />
        <FeedbackForm store={this.props.store} />
        <Footer title="Copyright: AppFolio Inc. Onboarding" />
      </div>
    );
  }
}

export default (App);
