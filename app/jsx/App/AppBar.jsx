export default class AppBar extends React.Component {
  constructor(props) {
    super(props);
  }

  handleLogout = () => {
    $.ajax({
      url: "/users/sign_out",
      method: "DELETE",
      success(response) {
        window.location.href = "/";
      }
    });
  }

  render() {
    let icons =(
      <div>
        <mui.FlatButton label="Sign out" onClick={this.handleLogout} />
      </div>
    );

    return (
      <mui.AppBar
        title="Smart Octocat"
        iconClassNameRight="muidocs-icon-navigation-expand-more"
        iconElementRight={icons}
      />
    );
  }
}
