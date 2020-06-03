/* eslint-env mocha */

import { expect } from 'chai';
import { shallow } from 'enzyme';
import React from 'react';
import { describe, it } from 'mocha';
import App from '../components/App';
import Header from '../components/Header';

describe('Header Presence', () => {
  it('should check if there is a Header in the page', () => {
    const stores = {
      feedbackStore: {}
    };
    const component = shallow(<App.wrappedComponent stores={stores} />);
    expect(component.find(Header)).to.have.length(1);
  });
  it('should check if there title of the Header is correct', () => {
    const wrapper = shallow(<Header title='Sample title' />);
    expect(wrapper.find('h3').text()).to.equal('Sample title');
  });
});
