import getMuiTheme from "material-ui/styles/getMuiTheme";
import MuiThemeProvider from "material-ui/styles/MuiThemeProvider";
import Room from "./Room";
import AppBar from "./App/AppBar";

export default class App extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    // API.Authentication.getList(this.handleGetAuthenticationCallback);

    // Don't know whether it's react-router bug,
    // when you back to the first loaded route, you will get blank page.
    // This below line will do a trick, replace a POST (full page load) of the first time,
    // by a REPLACE. And it works like a charm.
    Helper.history.replace({
      pathname: Helper.getCurrentPath()});
  }

  render() {
    return (
      <MuiThemeProvider muiTheme={getMuiTheme()}>
        <div>
        {/*<mui.Drawer open={false}>
          <mui.MenuItem>Room List</mui.MenuItem>
        </mui.Drawer>*/}
          <AppBar />
          {this.props.children}
        </div>
      </MuiThemeProvider>
    );
  }
}

