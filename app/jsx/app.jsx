import getMuiTheme from "material-ui/styles/getMuiTheme";
import MuiThemeProvider from "material-ui/styles/MuiThemeProvider";

export default class App extends React.Component {
  render() {
    return (
      <MuiThemeProvider muiTheme={getMuiTheme()}>
        <mui.Drawer open={true}>
          <mui.MenuItem>FAQ</mui.MenuItem>
        </mui.Drawer>
      </MuiThemeProvider>
    );
  }
}
