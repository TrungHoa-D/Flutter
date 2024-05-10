import 'package:homework_7/edit.dart';
import 'package:homework_7/provider.dart';
import 'package:flutter/material.dart';
import 'package:homework_7/update.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PersonProvider(),
        ),
      ],
      child: const MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<PersonProvider>().getData();
    context.read<PersonProvider>().getProvinceData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff33AABA),
            title: const Text(
              "Learn API",
              style: TextStyle(color: Colors.white),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(44),
              child: Container(
                color: Colors.white,
                child: const TabBar(
                    labelColor: Color(0xff33AABA),
                    indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(color: Color(0xff33AABA), width: 4),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        text: "Khách hàng",
                      ),
                      Tab(
                        text: "Nhà cung cấp",
                      )
                    ]),
              ),
            ),
          ),
          body: const TabBarView(
            children: [Customer(), Customer()],
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const EditScreen()));
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: const BoxDecoration(color: Color(0xff33AABA)),
              child: const Text(
                "Thêm đối tác",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Customer extends StatelessWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    // Move the context.read<PersonProvider>() outside of build method
    final personProvider = context.watch<PersonProvider>();

    return SingleChildScrollView(
      child: personProvider.isLoading
          ? const Padding(
              padding: EdgeInsets.all(208),
              child: CircularProgressIndicator(
                color: Color(0xff33AABA),
              ),
            )
          : Container(
              color: const Color(0xffEEEEEE),
              child: Container(
                margin: const EdgeInsets.all(16),
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: personProvider.people.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Chọn thao tác'),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        UpdateScreen(
                                                          index: index,
                                                        )));
                                          },
                                          child: const Text(
                                            'Sửa',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            personProvider.removePerson(index);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Xóa',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                //Name
                                (personProvider.people[index].name != null)
                                    ? Row(
                                        children: [
                                          const Icon(Icons.person_rounded),
                                          Text(personProvider
                                              .people[index].name!)
                                        ],
                                      )
                                    : Container(),
                                //Phone
                                (personProvider.people[index].phoneNumber !=
                                            null &&
                                        personProvider
                                                .people[index].phoneNumber !=
                                            "")
                                    ? Column(
                                        children: [
                                          const Divider(
                                              color: Color(0xffEEEEEE)),
                                          Row(
                                            children: [
                                              const Icon(Icons.phone_rounded),
                                              Text(personProvider
                                                  .people[index].phoneNumber!)
                                            ],
                                          ),
                                        ],
                                      )
                                    : Container(),
                                //Address
                                (personProvider.people[index].provice != null)
                                    ? Column(
                                        children: [
                                          const Divider(
                                              color: Color(0xffEEEEEE)),
                                          Row(
                                            children: [
                                              const Icon(Icons.home_rounded),
                                              Text(personProvider
                                                  .people[index].provice!)
                                            ],
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
    );
  }
}
