export default class Room extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      rooms: [],
    }
  }
  componentDidMount() {
    API.Room.getList(this.handleGetListRoom);
  }

  handleGetListRoom = (status, data) => {
    if (status) {
      this.setState({
        rooms: data.rooms,
      });
    }
  }

  handleClickRoom = (room_id) => {
    Helper.transitionTo(`/rooms/${room_id}`);
  }

  render() {
    let rooms = this.state.rooms;
    return (
      <mui.Table>
        <mui.TableHeader>
          <mui.TableRow>
            <mui.TableHeaderColumn tooltip="The ID">ID</mui.TableHeaderColumn>
            <mui.TableHeaderColumn tooltip="The Chatwork ID">Chatwork ID</mui.TableHeaderColumn>
            <mui.TableHeaderColumn tooltip="The Name">Team name</mui.TableHeaderColumn>
            <mui.TableHeaderColumn tooltip="The Github Link">Github Link</mui.TableHeaderColumn>
          </mui.TableRow>
        </mui.TableHeader>
        <mui.TableBody>
          {rooms.map((room, index) => (
            <mui.TableRow key={index} className="pointer"
              onTouchTap={() => this.handleClickRoom(room.id)}>
              <mui.TableRowColumn>{room.id}</mui.TableRowColumn>
              <mui.TableRowColumn>{room.chatwork_id}</mui.TableRowColumn>
              <mui.TableRowColumn>{room.name}</mui.TableRowColumn>
              <mui.TableRowColumn>{room.project_github_link}</mui.TableRowColumn>
            </mui.TableRow>
            ))}
        </mui.TableBody>
      </mui.Table>
    );
  }
}
