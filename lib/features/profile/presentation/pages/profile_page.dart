import 'package:flutter/material.dart';

import '../widgets/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 34),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                          height: 96,
                          width: 96,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/hassan.jpg'),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hassan Thabet',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'dev.7assan@gmail.com',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height / 50, horizontal: height / 50),
                        width: width - 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(70),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            CustomListTile(Icons.favorite_border_outlined,
                                "My favourites", () {}),
                            CustomListTile(
                                Icons.view_list_sharp, "Orders", () {}),
                            CustomListTile(Icons.shopping_basket_outlined,
                                "Finished Orders", () {}),
                            CustomListTile(Icons.favorite_border_outlined,
                                "My favourites", () {}),
                            CustomListTile(
                                Icons.view_list_sharp, "Orders", () {}),
                            CustomListTile(Icons.shopping_basket_outlined,
                                "Finished Orders", () {}),
                            CustomListTile(Icons.favorite_border_outlined,
                                "My favourites", () {}),
                            CustomListTile(
                                Icons.view_list_sharp, "Orders", () {}),
                            CustomListTile(Icons.shopping_basket_outlined,
                                "Finished Orders", () {})

                            // Divider(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
