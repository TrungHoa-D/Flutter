import 'package:flutter/material.dart';
import 'package:homework_7/model.dart';
import 'package:homework_7/provider.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  final int index;
  const UpdateScreen({super.key, required this.index});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late Person person;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<PersonProvider>().getPerson(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff33AABA),
        foregroundColor: Colors.white,
        title: const Text(
          "Sửa thông tin đối tác",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xffEEEEEE),
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey, // Gắn GlobalKey với Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Tên
                TextFormField(
                  controller: _nameController
                    ..text = context.watch<PersonProvider>().thisPerson.name!,
                  decoration: const InputDecoration(
                    labelText: 'Tên đối tác',
                    hintText: 'Ví dụ: Nguyễn Văn A',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Tên đối tác không được để trống.';
                    }
                    return null;
                  },
                ),
                //Tuổi
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Text(
                    'Tuổi',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (context.watch<PersonProvider>().thisPerson.age == 0)
                        ? InkWell(
                            onTap: () {},
                            child: const Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.transparent),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              context
                                  .read<PersonProvider>()
                                  .thisPerson
                                  .removeAge();
                              context.read<PersonProvider>().listen();
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                              decoration:
                                  const BoxDecoration(color: Color(0xff33AABA)),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(context
                          .watch<PersonProvider>()
                          .thisPerson
                          .age
                          .toString()),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<PersonProvider>().thisPerson.addAge();
                        context.read<PersonProvider>().listen();
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        decoration:
                            const BoxDecoration(color: Color(0xff33AABA)),
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                //SDT
                TextFormField(
                  controller: _phoneController
                    ..text =
                        context.watch<PersonProvider>().thisPerson.phoneNumber!,
                  decoration: const InputDecoration(
                    labelText: 'Số điện thoại',
                    hintText: 'Ví dụ: 0123456789',
                  ),
                ),
                //Loại đối tác
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Text(
                    'Loại đối tác',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                DropdownButtonFormField(
                  value: //'Khách hàng',
                      (context.watch<PersonProvider>().thisPerson.isCustommer!)
                          ? 'Khách hàng'
                          : 'Nhà cung cấp',
                  items: <String>[
                    'Khách hàng',
                    'Nhà cung cấp',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == 'Khách hàng') {
                      context.read<PersonProvider>().thisPerson.isCustommer =
                          true;
                    } else {
                      context.read<PersonProvider>().thisPerson.isCustommer =
                          false;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[150],
                  ),
                ),
                //Tỉnh
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Text(
                    'Tỉnh/Thành phố',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                DropdownButtonFormField(
                  value: context.watch<PersonProvider>().thisPerson.provice ??
                      null,
                  items: context
                      .watch<PersonProvider>()
                      .province
                      .toNameList()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    context.read<PersonProvider>().updateProvince(value!);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[150],
                  ),
                ),
                //Huyện
                (context.watch<PersonProvider>().presentProvince != '')
                    ? District(
                        id: context.watch<PersonProvider>().presentProvince)
                    : Container()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            context.read<PersonProvider>().thisPerson.name =
                _nameController.text;
            context.read<PersonProvider>().thisPerson.phoneNumber =
                _phoneController.text;
            context.read<PersonProvider>().updatePerson();
            Navigator.pop(context);
            Navigator.of(context).pop();
          }
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: const BoxDecoration(color: Color(0xff33AABA)),
          child: const Text(
            "Xong",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }
}

class District extends StatefulWidget {
  final String id;
  const District({super.key, required this.id});

  @override
  State<District> createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  @override
  void initState() {
    super.initState();
    context.read<PersonProvider>().getDistrictData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<PersonProvider>().isLoading
        ? const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 32),
              child: CircularProgressIndicator(
                color: Color(0xff33AABA),
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Text(
                  'Quận/Huyện',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              DropdownButtonFormField(
                value:
                    context.watch<PersonProvider>().thisPerson.district ?? null,
                items: context
                    .watch<PersonProvider>()
                    .district
                    .toNameList()
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  context.read<PersonProvider>().updateDistrict(value!);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[150],
                ),
              ),
            ],
          );
  }
}
