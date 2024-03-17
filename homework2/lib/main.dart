import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const HaUIApp());
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
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
