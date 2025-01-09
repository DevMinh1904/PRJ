function tinhTongTien() {

    // Lấy giá trị nhập từ người dùng
    var soLuongNguoi = document.getElementById('soLuongNguoi').value;

    // Kiểm tra nếu người dùng nhập không phải là số
    if ( soLuongNguoi < 0) {
      alert('Vui lòng nhập số người hợp lệ.');
    }

    else if(isNaN(soLuongNguoi) || soLuongNguoi == 0){
        alert("0 người sao mà đi")
    }

    // Tính tổng tiền
    else{
        var tongTien = soLuongNguoi * 150;
        alert('Tổng bill của em trai là '+ tongTien +'$' )
    }

    // Hiển thị tổng tiền
    document.getElementById('hienThiTongTien').innerHTML = tongTien;
  }