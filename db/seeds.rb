User.delete_all
Post.delete_all

# User table
5.times do |n|
  User.create(
    name: "Nguyen Van A0#{n+1}",
    password: "123456",
    password_confirmation: "123456",
    email: "user#{n+1}@gmail.com",
    phone: "0123456789",
    address: "HN",
  )
end

5.times do |n|
  Post.create(
    user_id: n,
    title: "Những thuộc tính css của images mà bạn cần biết",
    body: "1. Làm sắc nét hình ảnh với image-rendering
Khi một hình ảnh được phóng to, trình duyệt làm mịn hình ảnh, do đó, nó không nhìn pixelated. Tuy nhiên, tùy thuộc vào độ phân giải của hình ảnh và màn hình, điều này có thể không phải là tốt nhất mọi lúc. Bạn có thể kiểm soát hành vi trình duyệt này với thuộc tính hiển thị hình ảnh.

Thuộc tính được hỗ trợ tốt này điều khiển thuật toán được sử dụng để phóng to một hình ảnh. Hai giá trị chính của nó là crisp-edges và pixelated

Giá trị crisp-edges duy trì độ tương phản giữa các điểm ảnh. Nói cách khác, không làm mịn được thực hiện cho hình ảnh, mà tuyệt vời cho điểm ảnh nghệ thuật.

Khi pixelated được sử dụng, các điểm ảnh gần đó của một điểm ảnh có thể chiếm diện mạo của nó, làm cho nó giống như nhau tạo thành một pixel lớn, tuyệt vời cho màn hình có độ phân giải cao.

Nếu bạn tiếp tục xem xét chặt chẽ các cạnh hoa trong GIF bên dưới, bạn có thể thấy sự khác biệt giữa hình ảnh bình thường và hình ảnh có pixelated.",
  picture: ""
  )
# end
#
end
