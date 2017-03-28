import {Router, Route, Link, IndexRoute, browserHistory} from "react-router"
import App from "./app";
import Room from "./Room";
import RoomDetail from "./Room/RoomDetail";

console.log("abc");
const router = (
  <Router history={browserHistory}>
    <Route path="/" component={App}>
      <IndexRoute component={Room} />
      <Route path="rooms" component={Room} />
      <Route path="rooms/:id" component={RoomDetail} />
    </Route>
  </Router>
);

export default router;
