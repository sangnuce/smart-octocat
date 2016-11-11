ngoc = User.create! name: "Bach Van Ngoc", github_id: "NeverSmileK57CLC", chatwork_id: "1614642"
hieu = User.create! name: "Bui Minh Hieu", github_id: "hieubm", chatwork_id: "1212197"
binh = User.create! name: "Truong Loc Binh", github_id: "truonglocbinh", chatwork_id: "1567566"

chat_mr_hieu = Room.create! name: "Chat with Hieu", chatwork_id: "51413536"

faq = Room.create! name: "FAQ", chatwork_id: "60833608", project_github_link:
	"https://github.com/NeverSmileK57CLC/smart-octocat"
UserRoom.create user: ngoc, room: faq, role: 0
UserRoom.create user: hieu, room: faq, role: 1
UserRoom.create user: binh, room: faq, role: 0