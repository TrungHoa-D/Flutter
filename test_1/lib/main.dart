import 'package:flutter/material.dart';

class Task {
  String title;
  String startTime;
  String endTime;
  String deadline;
  bool isFavorite;
  bool isCompleted;
  String remid;
  String repeat;
  Color color;
  Task(this.title, this.startTime, this.endTime, this.deadline, this.isFavorite,
      this.isCompleted, this.remid, this.repeat, this.color);
}

void main() {
  runApp(const MaterialApp(
    home: Board(),
  ));
}

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> tasklist = [];
    tasklist.add(Task("Very long titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
        "07:43", "10:30", "12:04:2024", true, true, "", "", Colors.blue));
    tasklist.add(Task("Very long titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
        "07:43", "10:30", "12:04:2024", false, true, "", "", Colors.pink));
    tasklist.add(Task("Very long titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
        "07:43", "10:30", "12:04:2024", true, false, "", "", Colors.purple));
    tasklist.add(Task("Very long titleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
        "07:43", "10:30", "12:04:2024", false, false, "", "", Colors.green));
    List<Task> uncom =
        tasklist.where((element) => !element.isCompleted).toList();
    List<Task> com = tasklist.where((element) => element.isCompleted).toList();
    List<Task> fav = tasklist.where((element) => element.isFavorite).toList();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Board"),
          actions: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(elevation: 0),
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(elevation: 0),
                child: const Icon(
                  Icons.notifications_rounded,
                  color: Colors.black,
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(elevation: 0),
                child: const Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.black,
                )),
          ],
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(
              text: "All",
            ),
            Tab(
              text: "Uncompleted",
            ),
            Tab(
              text: "Completed",
            ),
            Tab(
              text: "Favourite",
            ),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: TabBarView(
            children: [
              //All
              ListView.builder(
                itemCount: tasklist.length,
                itemBuilder: (context, i) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: tasklist.elementAt(i).color,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CheckboxExample(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              tasklist.elementAt(i).title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            'From: ${tasklist.elementAt(i).startTime} - To: ${tasklist.elementAt(i).endTime}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Deadline: ${tasklist.elementAt(i).deadline}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      FavoriteCheckbox()
                    ],
                  ),
                ),
              ),
              //Uncompleted
              ListView.builder(
                itemCount: uncom.length,
                itemBuilder: (context, i) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: uncom.elementAt(i).color,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CheckboxExample(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              uncom.elementAt(i).title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            'From: ${uncom.elementAt(i).startTime} - To: ${uncom.elementAt(i).endTime}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Deadline: ${uncom.elementAt(i).deadline}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      FavoriteCheckbox()
                    ],
                  ),
                ),
              ),
              //Completed
              ListView.builder(
                itemCount: com.length,
                itemBuilder: (context, i) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: com.elementAt(i).color,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CheckboxExample(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              com.elementAt(i).title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            'From: ${com.elementAt(i).startTime} - To: ${com.elementAt(i).endTime}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Deadline: ${com.elementAt(i).deadline}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      FavoriteCheckbox()
                    ],
                  ),
                ),
              ),
              //Favourite
              ListView.builder(
                itemCount: fav.length,
                itemBuilder: (context, i) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: fav.elementAt(i).color,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CheckboxExample(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              fav.elementAt(i).title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            'From: ${fav.elementAt(i).startTime} - To: ${fav.elementAt(i).endTime}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Deadline: ${fav.elementAt(i).deadline}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      FavoriteCheckbox()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class All extends StatefulWidget {
  const All({super.key});
  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        value: _isChecked,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value!;
          });
        },
        activeColor: Colors.black,
      ),
    );
  }
}

class FavoriteCheckbox extends StatefulWidget {
  @override
  _FavoriteCheckboxState createState() => _FavoriteCheckboxState();
}

class _FavoriteCheckboxState extends State<FavoriteCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            _isChecked = !_isChecked;
          });
        },
        child: Container(
          child: Icon(
            _isChecked
                ? Icons.favorite
                : Icons.favorite_border, // Sử dụng icon heart
            color: _isChecked
                ? Colors.red
                : Colors.grey, // Màu sắc của icon thay đổi tùy theo trạng thái
            size: 30, // Kích thước của icon
          ),
        ),
      ),
    );
  }
}
