import BaseAPI from "./BaseAPI";

export default class Authentication extends BaseAPI {
  static logIn(callback, user) {
    this.sendAjax(callback, {
      url: "sessions",
      method: "POST",
      data: user
    });
  }
}
