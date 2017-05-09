import {Router, Route, Link, IndexRoute, browserHistory} from "react-router"
import App from "./app";
import Room from "./Room";
import RoomDetail from "./Room/RoomDetail";
import Login from "./Login";

const router = (
  <Router history={browserHistory}>
    <Route path="/" component={App}>
      <IndexRoute component={Room} />
      <Route path="rooms" component={Room} />
      <Route path="rooms/:id" component={RoomDetail} />
    </Route>
    <Route path="/users/sign_in" component={Login} />
  </Router>
);

export default router;
