ngoc = User.create! name: "Bach Van Ngoc", github_id: "NeverSmileK57CLC", chatwork_id: "1614642"
hieu = User.create! name: "Bui Minh Hieu", github_id: "hieubm", chatwork_id: "1212197"
binh = User.create! name: "Truong Loc Binh", github_id: "truonglocbinh", chatwork_id: "1567566"
son = User.create! name: "Nguyen Thai Son", github_id: "nguyenthaison", chatwork_id: "1567616"
mr_thanh = User.create! name: "Ta Minh Thanh", github_id: "thanhtm", chatwork_id: "1458078"

test_octocat = Room.create! name: "Smart Octocat", chatwork_id: "60833608",
  project_github_link: "https://github.com/NeverSmileK57CLC/smart-octocat"
UserRoom.create! user: ngoc, room: test_octocat, role: 0
UserRoom.create! user: hieu, room: test_octocat, role: 1
UserRoom.create! user: binh, room: test_octocat, role: 0
UserRoom.create! user: son, room: test_octocat, role: 0


faq = Room.create! name: "FAQ", chatwork_id: "47423136", project_github_link:
	"https://github.com/framgia/FAQ"
UserRoom.create! user: ngoc, room: faq, role: 0
UserRoom.create! user: hieu, room: faq, role: 1
UserRoom.create! user: binh, room: faq, role: 0
UserRoom.create! user: son, room: faq, role: 0
UserRoom.create! user: mr_thanh, room: faq, role: 4