import 'package:flutter/material.dart';
import 'package:homework_6/data.dart';
import 'package:homework_6/detail.dart';
import 'package:provider/provider.dart';
import 'package:homework_6/caculate.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Cart())],
        child: const MaterialApp(home: ListWidget()));
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: FoodData.typeOfFood.length,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        persistentFooterButtons: [
          context.watch<Cart>().all > 0 && context.watch<Cart>().money > 0
              ? ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.zero), // Loại bỏ padding
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white), // Loại bỏ background color
                    overlayColor: MaterialStateProperty.all(
                        Colors.transparent), // Loại bỏ màu overlay khi nhấn
                    side: MaterialStateProperty.all(const BorderSide(
                        width: 0, color: Colors.transparent)), // Loại bỏ border
                    elevation: const MaterialStatePropertyAll(0),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          const Icon(
                            Icons.shopping_cart,
                            color: Color.fromRGBO(244, 78, 47, 1),
                            size: 48,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor:
                                  const Color.fromRGBO(244, 78, 47, 1),
                              child: Text(
                                context.watch<Cart>().all.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            MoneyFormatter.formatMoney(
                                context.watch<Cart>().money),
                            style: const TextStyle(
                                color: Color.fromRGBO(244, 78, 47, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return _cartList(context);
                                },
                              );
                              //context.read<Cart>().listen();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(244, 78, 47, 1),
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(left: 8),
                              child: const Text(
                                "Giao hàng",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
              : const SizedBox(
                  height: 0,
                ),
        ],
        appBar: AppBar(
          bottom: TabBar(
              isScrollable: true,
              indicatorColor: const Color.fromRGBO(244, 78, 47, 1),
              labelColor: const Color.fromRGBO(244, 78, 47, 1),
              tabAlignment: TabAlignment.start,
              tabs: List.generate(
                  FoodData.typeOfFood.length,
                  (index) => Tab(
                        child: Text(
                          FoodData.typeOfFood.elementAt(index).nameOfType,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ))),
          actions: const [
            Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.share,
                color: Color.fromRGBO(244, 78, 47, 1),
                size: 36,
              ),
            )
          ],
        ),
        body: TabBarView(
            children: List.generate(FoodData.typeOfFood.length,
                (index) => _listFood(FoodData.typeOfFood.elementAt(index)))),
      ),
    ));
  }
}

Widget _cartList(BuildContext context) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black38, width: 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                context.read<Cart>().reset();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Xóa tất cả",
                style: TextStyle(color: Color.fromRGBO(244, 78, 47, 1)),
              ),
            ),
            const Text(
              "Giỏ hàng",
              style: TextStyle(fontSize: 20),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                size: 20,
              ),
            )
          ],
        ),
      ),
      _listFoodFull(context),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              const Icon(
                Icons.shopping_cart,
                color: Color.fromRGBO(244, 78, 47, 1),
                size: 48,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: const Color.fromRGBO(244, 78, 47, 1),
                  child: Text(
                    context.watch<Cart>().all.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                MoneyFormatter.formatMoney(context.watch<Cart>().money),
                style: const TextStyle(
                    color: Color.fromRGBO(244, 78, 47, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  context.read<Cart>().listen();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(244, 78, 47, 1),
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 8),
                  child: const Text(
                    "Giao hàng",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ],
      )
    ],
  );
}

Widget _listFood(TypeOfFood type) {
  List<Food> thisType =
      FoodData.listFoods.where((element) => element.typeId == type.id).toList();
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${type.nameOfType} (${thisType.length.toString()})",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: thisType.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodDetail(
                                    food: thisType.elementAt(index),
                                  )));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black12, width: 1))),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.network(
                                thisType.elementAt(index).imageUlr,
                                //width: 30,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  thisType.elementAt(index).title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  thisType.elementAt(index).describe,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.black38),
                                ),
                                (thisType.elementAt(index).numOfSold >= 1000)
                                    ? Text(
                                        "${thisType.elementAt(index).numOfSold.toDouble() / 1000}K đã bán | ${thisType.elementAt(index).numOfLike} lượt thích",
                                        style: const TextStyle(
                                            color: Colors.black38),
                                      )
                                    : Text(
                                        "${thisType.elementAt(index).numOfSold} đã bán | ${thisType.elementAt(index).numOfLike} lượt thích",
                                        style: const TextStyle(
                                            color: Colors.black38),
                                      ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      MoneyFormatter.formatMoney(
                                          thisType.elementAt(index).cost),
                                      style: const TextStyle(
                                          color: Color.fromRGBO(244, 78, 47, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    (context.watch<Cart>().cartList[
                                                thisType.elementAt(index).id] ==
                                            0)
                                        ? InkWell(
                                            onTap: () {
                                              context.read<Cart>().add(
                                                  thisType.elementAt(index).id);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    244, 78, 47, 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ))
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    context.read<Cart>().minus(
                                                        thisType
                                                            .elementAt(index)
                                                            .id);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromRGBO(
                                                              244, 78, 47, 1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Color.fromRGBO(
                                                          244, 78, 47, 1),
                                                    ),
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 0, 8, 0),
                                                child: Text(context
                                                    .watch<Cart>()
                                                    .cartList[thisType
                                                        .elementAt(index)
                                                        .id]
                                                    .toString()),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    context.read<Cart>().add(
                                                        thisType
                                                            .elementAt(index)
                                                            .id);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              244, 78, 47, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ))
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
                  ))
        ],
      ),
    ),
  );
}

Widget _listFoodFull(BuildContext context) {
  List<Food> thisType = FoodData.listFoods
      .where((element) => context.watch<Cart>().cartList[element.id] > 0)
      .toList();
  return Expanded(
    child: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: thisType.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black12, width: 1))),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.network(
                                thisType.elementAt(index).imageUlr,
                                //width: 30,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  thisType.elementAt(index).title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      MoneyFormatter.formatMoney(
                                          thisType.elementAt(index).cost),
                                      style: const TextStyle(
                                          color: Color.fromRGBO(244, 78, 47, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    (context.watch<Cart>().cartList[
                                                thisType.elementAt(index).id] ==
                                            0)
                                        ? InkWell(
                                            onTap: () {
                                              context.read<Cart>().add(
                                                  thisType.elementAt(index).id);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    244, 78, 47, 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ))
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    context.read<Cart>().minus(
                                                        thisType
                                                            .elementAt(index)
                                                            .id);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromRGBO(
                                                              244, 78, 47, 1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Color.fromRGBO(
                                                          244, 78, 47, 1),
                                                    ),
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 0, 8, 0),
                                                child: Text(context
                                                    .watch<Cart>()
                                                    .cartList[thisType
                                                        .elementAt(index)
                                                        .id]
                                                    .toString()),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    context.read<Cart>().add(
                                                        thisType
                                                            .elementAt(index)
                                                            .id);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              244, 78, 47, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ))
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
                  ))),
    ),
  );
}
