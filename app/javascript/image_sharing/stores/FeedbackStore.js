import { action, observable } from 'mobx';

export class FeedbackStore {
  @observable userName;
  @observable comments;

  @action
  setUserName(userName) {
    this.userName = userName;
  }

  @action
  setComments(comments) {
    this.comments = comments;
  }
}

export default FeedbackStore;
