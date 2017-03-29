export default class RoomDetail extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      room: {},
    }
  }

  componentDidMount() {
    API.Room.get(this.handleGetRoomDetailCallback, this.props.params.id, {})
  }

  handleGetRoomDetailCallback = (status, data) => {
    if (!status) return;
    this.setState({
      room: data.room,
    });
  }

  handleClickGithubId = (githubId) => {
    Helper.windowOpen(`https://github.com/${githubId}`);
  }

  render() {
    let room = this.state.room;
    let users = room.users || [];
    return (
      <div>
        <mui.List>
          <mui.ListItem primaryText={room.name} />
          <mui.ListItem primaryText={room.project_github_link}
            onClick={() => Helper.windowOpen(room.project_github_link)} />
        </mui.List>
        <mui.Table>
          <mui.TableHeader>
            <mui.TableRow>
              <mui.TableHeaderColumn tooltip="The ID">ID</mui.TableHeaderColumn>
              <mui.TableHeaderColumn tooltip="The Chatwork ID">Chatwork ID</mui.TableHeaderColumn>
              <mui.TableHeaderColumn tooltip="The Name">Name</mui.TableHeaderColumn>
              <mui.TableHeaderColumn tooltip="The Github ID">Github ID</mui.TableHeaderColumn>
            </mui.TableRow>
          </mui.TableHeader>
          <mui.TableBody>
            {users.map((user, index) => (
              <mui.TableRow key={index}>
                <mui.TableRowColumn>{user.id}</mui.TableRowColumn>
                <mui.TableRowColumn>{user.chatwork_id}</mui.TableRowColumn>
                <mui.TableRowColumn>{user.name}</mui.TableRowColumn>
                <mui.TableRowColumn onTouchTap={() => this.handleClickGithubId(user.github_id)}>
                  <span className="link">{user.github_id}</span>
                </mui.TableRowColumn>
              </mui.TableRow>
              ))}
          </mui.TableBody>
        </mui.Table>
      </div>
    );
  }
}
