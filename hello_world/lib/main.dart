import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
                if (result != null && result is Map<String, String>) {
                  setState(() {
                    _username = result['username'];
                    _password = result['password'];
                  });
                }
              },
              child: const Text('Đăng ký'),
            ),
            const SizedBox(height: 20),
            RegisterInfo(username: _username, password: _password),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey, // Gắn GlobalKey với Form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Tên đăng nhập',
                  hintText: '> Nhập tên đăng nhập vào đây <',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Tên đăng nhập không được để trống.';
                  }
                  RegExp regex = RegExp(r'^[a-zA-Z0-9_]+$');
                  if (!regex.hasMatch(value)) {
                    return 'Tên đăng nhập chỉ được chứa chữ cái, chữ số và dấu gạch dưới.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  hintText: '> Nhập mật khẩu vào đây <',
                ),
                obscureText: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Mật khẩu không được để trống.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Gọi hàm _submit khi người dùng nhấn nút Đăng ký
                  _submit(context);
                },
                child: const Text('Đăng ký'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    // Kiểm tra các trường dữ liệu của Form
    if (_formKey.currentState!.validate()) {
      // Nếu dữ liệu hợp lệ, trả về dữ liệu vào màn hình trước
      String username = _usernameController.text;
      String password = _passwordController.text;
      Navigator.pop(context, {'username': username, 'password': password});
    }
  }
}

class RegisterInfo extends StatelessWidget {
  final String? username;
  final String? password;

  const RegisterInfo({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Thông tin tài khoản:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text('Tên đăng nhập: ${username ?? ''}'),
        Text('Mật khẩu: ${password ?? ''}'),
      ],
    );
  }
}
