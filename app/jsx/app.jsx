import getMuiTheme from "material-ui/styles/getMuiTheme";
import MuiThemeProvider from "material-ui/styles/MuiThemeProvider";
import Room from "./Room";

export default class App extends React.Component {
	constructor(props) {
		super(props);
	}

  render() {
    return (
      <MuiThemeProvider muiTheme={getMuiTheme()}>
      	<div>
        {/*<mui.Drawer open={false}>
          <mui.MenuItem>Room List</mui.MenuItem>
        </mui.Drawer>*/}
        	{this.props.children}
			  </div>
      </MuiThemeProvider>
    );
  }
}

