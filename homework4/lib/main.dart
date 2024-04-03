import 'package:flutter/material.dart';
import 'package:homework4/Data/dummy_data.dart';

void main() {
  runApp(const MaterialApp(
    home: Categories(),
  ));
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 249, 200, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(234, 30, 99, 1),
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.white, fontSize: 30),
          textAlign: TextAlign.left,
        ),
      ),
      body: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(DUMMY_CATEGORIES.length, (index) {
            return Material(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: DUMMY_CATEGORIES[index].color,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MealList(index: index)));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      DUMMY_CATEGORIES[index].title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ));
          })),
    );
  }
}

class MealList extends StatelessWidget {
  const MealList({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    List<Meal> mealList = DUMMY_MEALS
        .where((element) =>
            element.categories.contains(DUMMY_CATEGORIES[index].id))
        .toList();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 249, 200, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(234, 30, 99, 1),
        title: Text(
          DUMMY_CATEGORIES[index].title,
          style: const TextStyle(color: Colors.white, fontSize: 30),
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MealDetail(id: mealList.elementAt(i).id)));
          },
          child: Flexible(
              child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.network(mealList.elementAt(i).imageUrl),
                    Container(
                      width: 300,
                      color: Colors.black45,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        mealList.elementAt(i).title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.schedule_outlined),
                          Text(
                              "${mealList.elementAt(i).duration.toString()} min")
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work_rounded),
                          Text(mealList.elementAt(i).complexity.name)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.attach_money_outlined),
                          Text(mealList.elementAt(i).affordability.name)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class MealDetail extends StatelessWidget {
  const MealDetail({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    Meal thisMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 249, 200, 1),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: const Color.fromRGBO(234, 30, 99, 1),
          title: Text(
            thisMeal.title,
            style: const TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.left,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.network(thisMeal.imageUrl),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Ingredients",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: thisMeal.ingredients.length,
                      itemBuilder: (context, i) => Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color.fromRGBO(255, 171, 64, 1)),
                        child: Text(
                          thisMeal.ingredients[i],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Steps",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: thisMeal.steps.length,
                        itemBuilder: (context, i) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(138, 4, 64, 1),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Text(
                                      "# ${i + 1}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 370,
                                    child: Text(
                                      thisMeal.steps[i],
                                      maxLines: 5,
                                    ),
                                  )
                                ],
                              ),
                            )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
