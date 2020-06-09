/* eslint-env mocha */

import { expect } from 'chai';
import { shallow } from 'enzyme';
import React from 'react';
import { describe, it } from 'mocha';
import App from '../components/App';
import Footer from '../components/Footer';

describe('Footer Presence', () => {
  it('should check if there is a Footer in the page', () => {
    const stores = {
      feedbackStore: {}
    };
    const component = shallow(<App stores={stores} />);
    expect(component.find(Footer)).to.have.length(1);
  });
  it('should check if there title of the Footer is correct', () => {
    const wrapper = shallow(<Footer title='Sample title' />);
    expect(wrapper.find('h3').text()).to.equal('Sample title');
  });
});
