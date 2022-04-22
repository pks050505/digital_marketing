import 'package:flutter/material.dart';

import '../screen/home_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Purushottam Singh",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text("pks050505@gmail.com",
                    style: TextStyle(color: Colors.black)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/47.jpg"),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/women/74.jpg"),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/47.jpg"),
                  ),
                ],
              ),

              // ListTile(
              //   title: Text("Home"),
              //   leading: IconButton(
              //     icon: Icon(Icons.home),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (BuildContext context) => HomePage()));
              //   },
              // ),
              // Divider(
              //   color: Colors.grey,
              // ),
              // ListTile(
              //   title: Text("Cources"),
              //   leading: IconButton(
              //     icon: Icon(Icons.account_circle),
              //     onPressed: () {},
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (BuildContext context) => MyCource()));
              //   },
              // ),
              // Divider(
              //   color: Colors.grey,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomDrawerTile(
                          title: "Home",
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()),
                            );
                          }),
                      // CustomDivider(),
                      CustomDrawerTile(title: " Cources", onTap: () {}),
                      // CustomDivider(),
                      CustomDrawerTile(title: "About Us", onTap: () {}),
                      // CustomDivider(),
                      CustomDrawerTile(
                          title: " Become An Instructor", onTap: () {}),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Log In')),
              ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
            ],
          )
        ],
      ),
    );
  }
}

class CustomDrawerTile extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;

  const CustomDrawerTile({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      // leading: IconButton(
      //   icon: Icon(Icons.contact_page),
      //   onPressed: () {},
      // ),
      // onTap: () {
      //   Navigator.of(context).pop();
      //   // Navigator.of(context).push(MaterialPageRoute(
      //   //     builder: (BuildContext context) => contact()));
      // },
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.grey);
  }
}
