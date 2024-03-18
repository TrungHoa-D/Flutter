import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const BloodApp());
}

///Screen 1
class HaUIApp extends StatelessWidget {
  const HaUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Wellcome
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, Đỗ Trung Hòa",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.black54,
                    size: 30,
                  )
                ],
              ),
              //Schedule
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.03),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.green.shade300,
                          size: 50,
                        ),
                        const Column(
                          children: [
                            Text(
                              "Thời khóa biểu",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "17 tháng 3",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                          ),
                          child: const Text(
                            "Lịch thi",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Không có lịch!"),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Xem thêm TKB",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //Title notice
              const Text(
                "Thông báo gần đây",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
              //Notice
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.03),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                child: const Column(
                  children: [
                    Text(
                      "THÔNG BÁO V/v mở, không mở các lớp học phần trong học kỳ 2 năm học 2023-2024 cho sinh viên Đại học các khóa",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.blue),
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Colors.black45,
                          ),
                          Text(
                            "03:30 02/02/2024",
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //Title utilities
              const Text(
                "Tiện ích",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
              //Utilities
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(20)),
                                ),
                                child: const Icon(
                                  Icons.payments_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const Text(
                              "Tài chính",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(20)),
                                ),
                                child: const Icon(
                                  Icons.equalizer_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const Text(
                              "Kết quả HP",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(20)),
                                ),
                                child: const Icon(
                                  Icons.receipt_long_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const Text(
                              "Học phần",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(20)),
                                ),
                                child: const Icon(
                                  Icons.school_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const Text(
                              "Tốt nghiệp",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(20)),
                                ),
                                child: const Icon(
                                  Icons.call_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const Text(
                              "DV một cửa",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(20)),
                                ),
                                child: const Icon(
                                  Icons.edit_note_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const Text(
                              "Đánh giá rèn luyện",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(20)),
                                ),
                                child: const Icon(
                                  Icons.help_outline_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const Text(
                              "Học phần",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(20)),
                                ),
                                child: const Icon(
                                  Icons.border_color_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const Text(
                              "Khảo sát",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///Screen 2
class BloodApp extends StatelessWidget {
  const BloodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              //Nav
              Container(
                width: 600,
                height: 50,
                decoration: const BoxDecoration(color: Colors.red),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 80, 0),
                      child: Text(
                        "Lịch sử hiến máu",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.forum_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              //Avatar
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage('assets/avt.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(
                        Icons.photo_camera_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              //Name
              const Text(
                "Đỗ Trung Hòa",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              //rank
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  child: const Text(
                    "Mức 2",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              //history
              Container(
                padding: const EdgeInsets.all(5),
                color: const Color.fromRGBO(239, 239, 239, 1),
                height: 390,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //detail
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 0.1)),
                      child: Row(
                        children: [
                          Container(
                            height: 84,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(239, 239, 239, 1),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lần 4",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 84,
                            width: 286.199,
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "25/01/2024",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.vaccines_outlined,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          "350 ml (Toàn phần)",
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Trung tâm Máu Quốc Gia",
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Colors.black45,
                                      ),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.black45,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 0.1)),
                      child: Row(
                        children: [
                          Container(
                            height: 84,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(239, 239, 239, 1),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lần 3",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 84,
                            width: 286.199,
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "28/10/2023",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.vaccines_outlined,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          "350 ml (Toàn phần)",
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Trung tâm Máu Quốc Gia",
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Colors.black45,
                                      ),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.black45,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 0.1)),
                      child: Row(
                        children: [
                          Container(
                            height: 84,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(239, 239, 239, 1),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lần 2",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 84,
                            width: 286.199,
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "05/06/2023",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.vaccines_outlined,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          "350 ml (Toàn phần)",
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Trung tâm Máu Quốc Gia",
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Colors.black45,
                                      ),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.black45,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 0.1)),
                      child: Row(
                        children: [
                          Container(
                            height: 84,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(239, 239, 239, 1),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lần 1",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 84,
                            width: 286.199,
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "18/02/2023",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.vaccines_outlined,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          "350 ml (Toàn phần)",
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Trung tâm Máu Quốc Gia",
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Colors.black45,
                                      ),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.black45,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
