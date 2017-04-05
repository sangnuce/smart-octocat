ngoc = User.create! name: "Bach Van Ngoc", github_id: "NeverSmileK57CLC", chatwork_id: "1614642",
  email: "neversmile12b1@gmail.com", password: "123123"
hieu = User.create! name: "Bui Minh Hieu", github_id: "hieubm", chatwork_id: "1212197",
  email: Faker::Internet.email, password: "123123"
binh = User.create! name: "Truong Loc Binh", github_id: "truonglocbinh", chatwork_id: "1567566",
  email: Faker::Internet.email, password: "123123"
son = User.create! name: "Nguyen Thai Son", github_id: "nguyenthaison", chatwork_id: "1567616",
  email: Faker::Internet.email, password: "123123"
mr_thanh = User.create! name: "Ta Minh Thanh", github_id: "thanhtm", chatwork_id: "1458078",
  email: Faker::Internet.email, password: "123123"
chi_hang = User.create! name: "Tran Minh Hang", chatwork_id: "1474267",
  email: Faker::Internet.email, password: "123123"

# Project Smart Octocat
test_octocat = Room.create! name: "Smart Octocat", chatwork_id: "60833608",
  project_github_link: "https://github.com/NeverSmileK57CLC/smart-octocat"
UserRoom.create! user: ngoc, room: test_octocat, role: 0
UserRoom.create! user: hieu, room: test_octocat, role: 1
UserRoom.create! user: binh, room: test_octocat, role: 0
UserRoom.create! user: son, room: test_octocat, role: 0

# Project FAQ
anh_vu = User.create! name: "Le Dinh Vu", github_id: "octoberstorm", chatwork_id: "637888",
  email: Faker::Internet.email, password: "123123"
norin = User.create! name: "Hor Norin", github_id: "PrinceNorin", chatwork_id: "1352079",
  email: Faker::Internet.email, password: "123123"

faq = Room.create! name: "FAQ", chatwork_id: "47423136", project_github_link:
	"https://github.com/framgia/FAQ"
UserRoom.create! user: ngoc, room: faq, role: 0
UserRoom.create! user: hieu, room: faq, role: 1
UserRoom.create! user: binh, room: faq, role: 0
UserRoom.create! user: son, room: faq, role: 0
UserRoom.create! user: mr_thanh, room: faq, role: 4
UserRoom.create! user: chi_hang, room: faq, role: 2
UserRoom.create! user: anh_vu, room: faq, role: 0
UserRoom.create! user: norin, room: faq, role: 0

# Project Assurance
ha_tam = User.create! name: "Ha Thanh Tam", github_id: "hathanhtamnd", chatwork_id: "2095016",
  email: Faker::Internet.email, password: "123123"
tran_tuan = User.create! name: "Tran Van Tuan B", github_id: "tranvantuanb", chatwork_id: "2095012",
  email: Faker::Internet.email, password: "123123"
nguyen_truong = User.create! name: "Nguyen Van Truong", github_id: "truongnv0211", chatwork_id: "1385456",
  email: Faker::Internet.email, password: "123123"
chi_thanh = User.create! name: "Nguyen Chi Thanh", github_id: "ChiThanh93", chatwork_id: "2118505",
  email: Faker::Internet.email, password: "123123"
hoang_duong = User.create! name: "Pham Hoang Duong", github_id: "duongpham910", chatwork_id: "2047031",
  email: Faker::Internet.email, password: "123123"
nam = User.create! name: "Nguyen Van Nam", github_id: "namnv609", chatwork_id: "1079357",
  email: Faker::Internet.email, password: "123123"

assurance = Room.create! name: "Assurance", chatwork_id: "60551987",
  project_github_link: "https://github.com/framgia/Assurance"
UserRoom.create! user: hieu, room: assurance, role: 1
UserRoom.create! user: ha_tam, room: assurance, role: 0
UserRoom.create! user: tran_tuan, room: assurance, role: 0
UserRoom.create! user: nguyen_truong, room: assurance, role: 0
UserRoom.create! user: chi_thanh, room: assurance, role: 0
UserRoom.create! user: hoang_duong, room: assurance, role: 0
UserRoom.create! user: nam, room: assurance, role: 1
