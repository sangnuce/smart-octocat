import {browserHistory} from "react-router";
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from "material-ui/styles/getMuiTheme";
import {ToastContainer, ToastMessage} from "react-toastr";
var ToastMessageFactory = React.createFactory(ToastMessage.animation);

export default class Helper extends React.Component {
  constructor(props) {
    super(props);
    global.Helper = this;
    this.history = browserHistory;
  }

  setTheme() {
    return (
      getMuiTheme({
        fontFamily: "Mieryo, 'メイリオ', sans-serif",
        palette: {
          primary1Color: "f49ac1",
          accent1Color: "#555555",
        },
      })
    )
  }

  showMessage(message, type = "success", title = "") {
    this.refs.toastContainer[type](
      title,
      message, {
        timeOut: 2000,
        extendedTimeOut: 1000,
    });
  }

  showErrors(data, target=null) {
    if (typeof data === "object" && target) {
      for (var key in data) {
        this.showMessage(t(`${target}.attributes.${key}`) + " " + data[key][0], "error");
      }
    } else {
      this.showMessage(data, "error");
    }
  }

  transitionTo(pathName, state = {}) {
    let location = {pathname: pathName};
    location["state"] = state;

    browserHistory.push(location);
  }

  windowOpen(link) {
    window.open(link);
  }

  getCurrentPath() {
    return browserHistory.getCurrentLocation().pathname;
  }

  getCurrentLocationState() {
    return browserHistory.getCurrentLocation().state || {};
  }

  render() {
    let theme = this.setTheme();
    return (
      <MuiThemeProvider muiTheme={theme}>
        <div>
          <ToastContainer ref="toastContainer"
            toastMessageFactory={ToastMessageFactory}
            preventDuplicates={false}
            className="toast-top-right" />
        </div>
      </MuiThemeProvider>
    );
  }
}
