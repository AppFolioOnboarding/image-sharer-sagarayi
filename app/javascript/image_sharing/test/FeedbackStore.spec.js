/* eslint-env mocha */
import 'jsdom-global/register';
import { expect } from 'chai';
import FeedbackStore from '../stores/FeedbackStore';

describe('FeedbackStore', () => {
  it('should set user name', () => {
    const store = new FeedbackStore();
    store.setUserName('John');
    expect(store.userName).to.equal('John');
  });

  it('should set comments', () => {
    const store = new FeedbackStore();
    store.setComments('The best image sharing application that I have ever used !!');
    expect(store.comments).to.equal('The best image sharing application that I have ever used !!');
  });

  it('should clear form', () => {
    const store = new FeedbackStore();
    store.setUserName('John');
    store.setComments('The best image sharing application that I have ever used !!');
    expect(store.userName).to.equal('John');
    expect(store.comments).to.equal('The best image sharing application that I have ever used !!');

    store.clearForm();
    expect(store.userName).to.equal('');
    expect(store.comments).to.equal('');
  });
});
