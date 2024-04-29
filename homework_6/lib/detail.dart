import 'package:flutter/material.dart';
import 'package:homework_6/data.dart';
import 'package:homework_6/main.dart';
import 'package:provider/provider.dart';
import 'package:homework_6/caculate.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  const FoodDetail({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(244, 78, 47, 1),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.network(
                food.imageUlr,
                //width: 30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.title,
                  //overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  food.describe,
                  //overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black38, fontSize: 20),
                ),
                (food.numOfSold >= 1000)
                    ? Text(
                        "${food.numOfSold.toDouble() / 1000}K đã bán | ${food.numOfLike} lượt thích",
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 20),
                      )
                    : Text(
                        "${food.numOfSold} đã bán | ${food.numOfLike} lượt thích",
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 20),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MoneyFormatter.formatMoney(food.cost),
                      style: const TextStyle(
                          color: Color.fromRGBO(244, 78, 47, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    (context.watch<Cart>().cartList[food.id] == 0)
                        ? InkWell(
                            onTap: () {
                              context.read<Cart>().add(food.id);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(244, 78, 47, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: () {
                                    context.read<Cart>().minus(food.id);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              244, 78, 47, 1)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Color.fromRGBO(244, 78, 47, 1),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  context
                                      .watch<Cart>()
                                      .cartList[food.id]
                                      .toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    context.read<Cart>().add(food.id);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(244, 78, 47, 1),
                                      borderRadius: BorderRadius.circular(5),
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
            )
          ],
        ),
      ),
    ));
  }
}
