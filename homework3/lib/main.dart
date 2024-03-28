import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class Caculation {
  int num1;
  int num2;
  int result;
  String sign;
  bool isCorrect;

  ///Khởi tạo đầy đủ
  Caculation(this.num1, this.num2, this.result, this.sign, this.isCorrect);

  ///Khởi tạo không có đối số
  factory Caculation.zero() {
    return Caculation(1, 1, 2, "+", true);
  }

  ///Khởi tạo với 1 phép tính
  factory Caculation.undefined(
      {required int num1,
      required int num2,
      required String sign,
      required int result}) {
    bool isCorrect = false;
    if (sign == "+" && (num1 + num2 == result)) {
      isCorrect = true;
    } else if (sign == "-" && (num1 - num2 == result)) {
      isCorrect = true;
    } else if (sign == "*" && (num1 * num2 == result)) {
      isCorrect = true;
    } else if (sign == "/" && (num1 ~/ num2 == result)) {
      isCorrect = true;
    } else {
      isCorrect = false;
    }
    return Caculation(num1, num2, result, sign, isCorrect);
  }

  ///Tạo ra một phép tính ngẫu nhiên
  void generate() {
    num1 = Random().nextInt(11);
    num2 = Random().nextInt(11);
    int signTh = Random().nextInt(3);
    int isRight = Random().nextInt(3);
    if (signTh == 0) {
      sign = "+";
    } else if (signTh == 1) {
      sign = "-";
    } else if (signTh == 2) {
      sign = "*";
    } else {
      sign = "/";
    }
    int ans = 0;
    if (sign == "+") {
      ans = num1 + num2;
    } else if (sign == "-") {
      ans = num1 - num2;
    } else if (sign == "*") {
      ans = num1 * num2;
    } else if (sign == "/") {
      ans = num1 ~/ num2;
    }
    if (isRight == 2) {
      isCorrect = true;
      result = ans;
    } else {
      isCorrect = false;
      result = Random().nextInt(20);
      while (ans == result) {
        result = Random().nextInt(20);
      }
    }
  }

  ///Chuyển phép tính thành xâu kí tự
  @override
  String toString() {
    return ('${num1.toString()} $sign ${num2.toString()} = ${result.toString()} ');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  int status = 0; // 0 home, 1 play, 2 over
  int score = 0;
  int highScore = 0;
  Caculation caculation = Caculation.zero();
  final int _initialCounter = 10; // Thời gian đếm ngược ban đầu
  late int _counter;
  late Timer _timer;
  bool _timerStarted = false;
  @override
  void initState() {
    super.initState();
    _counter = _initialCounter;
    //startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_counter < 1) {
        _counter = _initialCounter; // Đặt lại _counter về giá trị ban đầu
        timer.cancel();
        // Xử lý khi đếm ngược kết thúc
        setState(() {
          highScore = max(highScore, score);
          status = 2;
        });
      } else {
        setState(() {
          _counter -= 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math',
      home: Scaffold(
        body: status == 0
            ? _homeScreen()
            : status == 1
                ? _playingScreen()
                : _gameOverScreen(),
      ),
    );
  }

  void _traloidung() {
    _counter = _initialCounter; // Đặt lại _counter về giá trị ban đầu
    _timer.cancel();
    score++;
    caculation.generate();
    startTimer(); // load 1 phép tính mới
  }

  void _traloisai() {
    _counter = _initialCounter; // Đặt lại _counter về giá trị ban đầu
    _timer.cancel();
    highScore = max(highScore, score);
    status = 2;
    _timerStarted = false;
    setState(() {});
  }

  Container _homeScreen() {
    return Container(
      width: 10000,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "1 + 1 = 2",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Freaking ",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
              ),
              Text(
                "Math",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                status = 1;
              });
            },
            child: const Icon(
              Icons.play_arrow_sharp,
              color: Colors.blueAccent,
              size: 80,
            ),
          ),
        ],
      ),
    );
  }

  Container _playingScreen() {
    if (!_timerStarted) {
      startTimer();
      _timerStarted = true;
    }
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(
          255,
          196,
          18,
          1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$_counter',
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
              Text(
                '$score',
                style: const TextStyle(fontSize: 50, color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Text(
            caculation.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 80),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (caculation.isCorrect) {
                    _traloidung();
                  } else {
                    _traloisai();
                  }
                },
                child: const Icon(
                  Icons.check,
                  color: Colors.blueAccent,
                  size: 80,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (caculation.isCorrect) {
                    _traloisai();
                  } else {
                    _traloidung();
                  }
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 80,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _gameOverScreen() {
    return Container(
      width: 1000,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Column(
        children: [
          const Text(
            'GAME OVER',
            style: TextStyle(color: Colors.white, fontSize: 60),
          ),
          const Text(
            'curent',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            '$score',
            style: const TextStyle(color: Colors.white, fontSize: 50),
          ),
          const Text(
            'best',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            '$highScore',
            style: const TextStyle(color: Colors.white, fontSize: 50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    score = 0;
                    status = 1;
                  });
                },
                child: const Icon(
                  Icons.replay_rounded,
                  color: Colors.blueGrey,
                  size: 80,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    score = 0;
                    status = 0;
                  });
                },
                child: const Icon(
                  Icons.home,
                  color: Colors.blueGrey,
                  size: 80,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
