import 'package:digital_marketing/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile_page';
  const ProfilePage({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const ProfilePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const CustomNavBar(),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepOrange,
                    Colors.pinkAccent,
                  ],
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/men/47.jpg",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Purushottam Kumar singh",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      // Card(
                      //   margin: EdgeInsets.symmetric(
                      //       horizontal: 20.0, vertical: 5.0),
                      //   clipBehavior: Clip.antiAlias,
                      //   color: Colors.white,
                      //   elevation: 5.0,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 8.0, vertical: 22.0),
                      //     child: Row(
                      //       children: [
                      //         Expanded(
                      //           child: Column(
                      //             children: [
                      //               Text(
                      //                 "Posts",
                      //                 style: TextStyle(
                      //                   color: Colors.redAccent,
                      //                   fontSize: 22.0,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 5.0,
                      //               ),
                      //               Text(
                      //                 "1200",
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   color: Colors.pinkAccent,
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Column(
                      //             children: [
                      //               Text(
                      //                 "Followers",
                      //                 style: TextStyle(
                      //                   color: Colors.redAccent,
                      //                   fontSize: 22.0,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 5.0,
                      //               ),
                      //               Text(
                      //                 "21.2K",
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   color: Colors.pinkAccent,
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Column(
                      //             children: [
                      //               Text(
                      //                 "Follow",
                      //                 style: TextStyle(
                      //                   color: Colors.redAccent,
                      //                   fontSize: 22.0,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 5.0,
                      //               ),
                      //               Text(
                      //                 "1200",
                      //                 style: TextStyle(
                      //                   fontSize: 20.0,
                      //                   color: Colors.pinkAccent,
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              elevation: 5.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
                child: Column(
                  children: [
                    ProfileTile(title: 'email', value: 'pks050505@gmail.com'),
                    SizedBox(height: 10),
                    ProfileTile(title: 'phone', value: '9123456789'),
                    SizedBox(height: 10),
                    ProfileTile(title: 'package', value: 'Elite'),
                  ],
                ),
              ),
            ),
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //         vertical: 30.0, horizontal: 16.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Info:",
            //           style: TextStyle(
            //               color: Colors.redAccent,
            //               fontStyle: FontStyle.normal,
            //               fontSize: 28.0),
            //         ),
            //         SizedBox(
            //           height: 10.0,
            //         ),
            //         Text(
            //           'My name is Purushottam and I am  a freelance mobile app developper.\n'
            //           'Having Experiece in Flutter and Android & DevOps',
            //           style: TextStyle(
            //             fontSize: 22.0,
            //             fontStyle: FontStyle.italic,
            //             fontWeight: FontWeight.w300,
            //             color: Colors.black,
            //             letterSpacing: 2.0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(AuthenticationLogoutRequested());
                },
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(80.0)),
                // elevation: 0.0,
                // padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.pink, Colors.pinkAccent],
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "LogOut",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final String value;
  const ProfileTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          flex: 1,
        ),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          flex: 3,
        ),
      ],
    );
  }
}
