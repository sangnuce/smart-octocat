import BaseAPI from "./BaseAPI";

export default class Room extends BaseAPI {
	static getList(callback, options = {}) {
		this.sendAjax(callback, {
			url: "rooms",
			data: options,
		});
	}

	static get(callback, id, options = {}) {
    this.sendAjax(callback, {
      url: `rooms/${id}`,
      data: options,
    });
  }
}
