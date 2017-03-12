import BaseAPI from "./BaseAPI";

export default class Room extends BaseAPI {
	static getList(callback, options = {}) {
		this.sendAjax(callback, {
			url: "rooms",
			data: options,
		});
	}
}
