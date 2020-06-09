import { action, observable } from 'mobx';

export class FeedbackStore {
  @observable userName;
  @observable comments;

  constructor() {
    this.userName = '';
    this.comments = '';
  }

  @action
  setUserName(userName) {
    this.userName = userName;
  }

  @action
  setComments(comments) {
    this.comments = comments;
  }

  @action
  clearForm() {
    this.userName = '';
    this.comments = '';
  }
}

export default FeedbackStore;
