Server-Client online decoding
=================================
###### Nguyen Hai Duong
###### August 16 2016

Chương trình hỗ trợ online-decoding dựa trên phương thức TCP-IP. Để cài đặtchương
trình hãy mở file INSTALL và làm theo hướng dẫn.

Chương trình nhận dạng cho bộ chữ số tiếng việt. Có thể nhận dạng các số  từ 1 tới
(không bao gồm số 10, cách đọ hai chữ số như mười lăm...).

Dữ liệu được training bao gồm : 1062 audio.wav file với 30 người đọc khác nhau.
Kết quả decoding trên 1062 audio.wav : %WER 0.86 [ 101 / 11698, 93 ins, 1 del, 7 sub ]
Xem chi tiết ở exp/dnn-v2.

Toàn bộ chương trình tại địa chỉ [project site](https://github.com/DuongNguyenHai/connected-digit-online-decoding)

1.	server:
---------------------------------

Server hỗ trợ cho phương thức dnn. Cùng một lúc có thể decoding nhiều client.
Server sẽ liên tục decoing khi có dữ liệu từ client gửi lên. Khi có gói dữ liệu
thứ nhất gửi lên, server sẽ decoding gói đó. Khi có gói thứ 2 gửi lên, server
sẽ decoding lại gói 1 + gói thứ 2. Cứ như thế đến khí client kết thúc việc gửi
dữ liệu.

Server hoàntoàn có thể  decoding chỉ một gói dữ liệu mà client gửi lên nhưng như
thế kết quả đa phần là sẽ không chính xác. Vấn đề này phải giải quyết ở client
với việc cắt chính xác dữ liệu để gửi đi (phần này không được thực hiện).Do vậy
để mô phỏng hết khả năng decoding chính xác của server, server sẽ decoding lại
tất cả gói dữ liệu. Tất nhiên Nếu như vậy thì càng nhiều gói dữ liệu thì server 
sẽ decoding càng lâu. Ngoài ra server cũng có thể chờ đếnkhi client gửi hết dữ 
liệu sau đó mới thực hiện decoding.

File thực thi : src/server-dnn-online

Chạy chương trình : ./server.sh

2. client
---------------------------------

Client sẽ cắt từng gói dữ liệu (12kbyte) từ file audio.wav (tần số 16khz), sau đó 
sẽ gửi lên server để decoding. Dữ liệu server trả về là từ được nhận dạng. Client 
sẽ  hiển thị lên màn hình. Để thuận tiên cho việc theo dõi. Client cứ 1s sẽ đọc dữ
liệu từ audio.wav rồi sau đó mới gửi lên server, đọc tới khi nào hết dữ liệu.

File thực thì : src/client-online.

Chạy chương trình, có 2 cách :
-	./client.sh : client sẽ đọc file audio.wav được liệt kê trong audio/wav.scp
-	./client.sh 'audio.wav' : client đọc trực tiếp file auio.wav

