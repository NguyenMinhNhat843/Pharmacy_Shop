<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>
    ĐƠN HÀNG
  </title>
  <script src="https://cdn.tailwindcss.com">
  </script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
 </head>
<body class="bg-gray-100 font-sans">
  <div class="container mx-auto p-4">
   <div class="flex justify-between items-center mb-4">
    <h1 class="text-2xl font-bold">
     Đơn hàng
    </h1>
    <div class="flex space-x-2">
     <!-- <button class="bg-white border border-gray-300 text-gray-700 px-4 py-2 rounded">
      Exporta
     </button>
     <button class="bg-white border border-gray-300 text-gray-700 px-4 py-2 rounded">
      More actions
     </button> -->
     <button class="bg-orange-500 text-white px-4 py-2 rounded">
        Tạo đơn hàng
     </button>
    </div>
   </div>
   <div class="bg-white p-4 rounded shadow mb-4">
    <div class="grid grid-cols-6 gap-4 text-center">
     <div>
      <p class="text-gray-500">
        Tổng số đơn hàng
      </p>
      <p class="text-xl font-bold">
       480
      </p>
     </div>
     <div>
      <p class="text-gray-500">
        Các đơn bị hủy 
      </p>
      <p class="text-xl font-bold">
       6
      </p>
     </div>
     <div>
      <p class="text-gray-500">
      Tổng đơn hàng giao thành công 
      </p>
      <p class="text-xl font-bold">
       450
      </p>
     </div>
     <div>
        <p class="text-gray-500">
        Các đơn hàng chưa giao
        </p>
        <p class="text-xl font-bold">
         24
        </p>
       </div>
    </div>
   </div>
   <div class="bg-white p-4 rounded shadow mb-4">
    <div class="flex space-x-4 mb-4">
     <button class="text-orange-500 border-b-2 border-orange-500 pb-2">
      All
     </button>
     <button class="text-gray-500 pb-2">
      Chưa thanh toán
     </button>
     <button class="text-gray-500 pb-2">
      Cần phải vận chuyển
     </button>
     <button class="text-gray-500 pb-2">
      Đã gửi
     </button>
     <button class="text-gray-500 pb-2">
      Hoàn thành
     </button>
     <button class="text-gray-500 pb-2">
      Hủy bỏ
     </button>
    </div>
    <div class="flex justify-between items-center mb-4">
     <input class="border border-gray-300 rounded px-4 py-2 w-full max-w-xs" placeholder="Search order..." type="text"/>
     <div class="flex space-x-2">
      <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded">
       <i class="fas fa-th">
       </i>
      </button>
      <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded">
       <i class="fas fa-list">
       </i>
      </button>
      <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded">
        Lọc
      </button>
     </div>
    </div>
    <table class="w-full text-left">
     <thead>
      <tr class="text-gray-500">
       <th class="py-2">
        ĐƠN HÀNG
       </th>
       <th class="py-2">
        KHÁCH HÀNG
       </th>
       <th class="py-2">
        NGÀY
       </th>
       <th class="py-2">
        TỔNG CỘNG
       </th>
       <th class="py-2">
        TRẠNG THÁI THANH TOÁN
       </th>
       <th class="py-2">
        SỐ LƯỢNG
       </th>
       <th class="py-2">
        PHƯƠNG THỨC GIAO HÀNG
       </th>
      </tr>
     </thead>
     <tbody>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Welkids Adek" height="32" src="image/Hinh1.jpg" width="32"/>
        <span class="ml-2">
            Welkids Adek
        </span>
       </td>
       <td class="py-2">
        Nguyễn Văn Anh
       </td>
       <td class="py-2">
        Apr 19, 08:01 AM
       </td>
       <td class="py-2">
        385.000 VND
       </td>
       <td class="py-2">
        Chưa thanh toán
       </td>
       <td class="py-2">
        1 Hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Bột Charz" height="32" src="image/2.jpg" width="32"/>
        <span class="ml-2">
            Bột Charz 
        </span>
       </td>
       <td class="py-2">
        Phan Thị Hằng
       </td>
       <td class="py-2">
        Apr 19, 09:15 AM
       </td>
       <td class="py-2">
        266.000 VND
       </td>
       <td class="py-2">
        Đã thanh toán
       </td>
       <td class="py-2">
        2 Hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Cốm Probiotics Lactomin Plus Novarex" height="32" src="image/3.png" width="32"/>
        <span class="ml-2">
        Cốm Probiotics Lactomin Plus Novarex
        </span>
       </td>
       <td class="py-2">
        Đặng Thị Thu
       </td>
       <td class="py-2">
        Apr 19, 10:30 AM
       </td>
       <td class="py-2">
        187.000 VND
       </td>
       <td class="py-2">
        Đã thanh toán
       </td>
       <td class="py-2">
        1 Hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Trà Linh Chi Ladophar" height="32" src="image/5.png" width="32"/>
        <span class="ml-2">
          Trà Linh Chi Ladophar
        </span>
       </td>
       <td class="py-2">
        Phan Nhật Thành
       </td>
       <td class="py-2">
        Apr 19, 11:45 AM
       </td>
       <td class="py-2">
        84.800 VND
       </td>
       <td class="py-2">
        Đã thanh toán
       </td>
       <td class="py-2">
        3 hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Bột PROANTIOBIOPLUS " height="32" src="image/6.png" width="32"/>
        <span class="ml-2">
          Bột PROANTIOBIOPLUS 
        </span>
       </td>
       <td class="py-2">
        Nguyễn Thi Mai
       </td>
       <td class="py-2">
        Apr 19, 01:00 PM
       </td>
       <td class="py-2">
        490.000 VND
       </td>
       <td class="py-2">
        Chưa thanh toán
       </td>
       <td class="py-2">
        1 Hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="INFOGOS hỗ trợ điều trị táo bón" height="32" src="image/6.png" width="32"/>
        <span class="ml-2">
        INFOGOS hỗ trợ điều trị táo bón
        </span>
       </td>
       <td class="py-2">
        Đặng Anh Kiệt
       </td>
       <td class="py-2">
        Apr 19, 02:15 PM
       </td>
       <td class="py-2">
        120.000 VND
       </td>
       <td class="py-2">
         Đã thanh toán
       </td>
       <td class="py-2">
        1 Hộp
       </td>
       <td class="py-2">
        Miễn Phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Enzymax Kids" height="32" src="image/7.png" width="32"/>
        <span class="ml-2">
          Enzymax Kids
        </span>
       </td>
       <td class="py-2">
         Mai Anh Khải
       </td>
       <td class="py-2">
        Apr 19, 03:30 PM
       </td>
       <td class="py-2">
        1.200.000 VND
       </td>
       <td class="py-2">
        Đã thanh toán
       </td>
       <td class="py-2">
        2 Hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Vương não khang" height="32" src="image/8.png" width="32"/>
        <span class="ml-2">
          Vương não khang
        </span>
       </td>
       <td class="py-2">
        Ma Văn Yên
       </td>
       <td class="py-2">
        Apr 19, 04:45 PM
       </td>
       <td class="py-2">
        215.000 VND
       </td>
       <td class="py-2">
        Đã thanh toán
       </td>
       <td class="py-2">
        1 Hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Edoz" height="32" src="image/9.png" width="32"/>
        <span class="ml-2">
          Edoz
        </span>
       </td>
       <td class="py-2">
        Đặng Thị Tình
       </td>
       <td class="py-2">
        Apr 19, 05:30 PM
       </td>
       <td class="py-2">
        105.000
       </td>
       <td class="py-2">
        Đã thanh toán
       </td>
       <td class="py-2">
        3 Hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển
       </td>
      </tr>
      <tr class="border-t">
       <td class="py-2 flex items-center">
        <input class="mr-2" type="checkbox"/>
        <img alt="Men Vi Sinh CONDITION PROBIO" height="32" src="image/10.png" width="32"/>
        <span class="ml-2">
        Men Vi Sinh CONDITION PROBIO
        </span>
       </td>
       <td class="py-2">
        Trương Anh 
       </td>
       <td class="py-2">
        Apr 19, 01:15 PM
       </td>
       <td class="py-2">
        210.000 VND
       </td>
       <td class="py-2">
        Chưa thanh toán
       </td>
       <td class="py-2">
        1 Hộp
       </td>
       <td class="py-2">
        Miễn phí vận chuyển 
       </td>
      </tr>
     </tbody>
    </table>
   </div>
  </div>
 </body>
</html>