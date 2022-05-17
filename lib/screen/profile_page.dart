import 'package:digital_marketing/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile_page';
  const ProfilePage({Key? key}) : super(key: key);
  static Route route() {
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
            SizedBox(
              height: 100,
            ),
            Card(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/47.jpg",
                      ),
                      radius: 50.0,
                    ),
                    Text(
                      "Pankaj",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "pankajjoshi699@gmail.com",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Elite Package',
                      style:
                          TextStyle(fontSize: 14, color: Colors.blue.shade300),
                    )
                  ],
                ),
              ),
            ),
            // Card(
            //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 5),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Text(
            //           'Package:',
            //           style: TextStyle(fontSize: 18),
            //         ),
            //         Text(
            //           'Elite',
            //           style: TextStyle(fontSize: 14),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Bio ',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      "This  is  the world’s largest advocacy association representing member companies, state biotechnology groups, academic and research institutions, and related organizations across the United States and in 30+ countries.",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(
                    text: 'refferal link',
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('refferal link Copied')));
              },
              child: const Text('copy your referal link'),
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(AuthenticationLogoutRequested());
                },
                child: const Text(
                  "LogOut",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),

            // Container(
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       colors: [
            //         Colors.deepOrange,
            //         Colors.pinkAccent,
            //       ],
            //     ),
            //   ),
            //   child: Container(
            //     width: double.infinity,
            //     height: 350.0,
            //     child: Center(
            //       child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            //         builder: (context, state) {
            //           return Column(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               CircleAvatar(
            //                 backgroundImage: NetworkImage(
            //                   state.user.image!,
            //                   // "https://randomuser.me/api/portraits/men/47.jpg",
            //                 ),
            //                 radius: 50.0,
            //               ),
            //               SizedBox(
            //                 height: 10.0,
            //               ),
            //               Text(
            //                 state.user.name!,
            //                 style: Theme.of(context).textTheme.headline5,
            //               ),
            //               SizedBox(
            //                 height: 10.0,
            //               ),
            //             ],
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // BlocBuilder<AuthenticationBloc, AuthenticationState>(
            //   builder: (context, state) {
            //     return Card(
            //       margin: const EdgeInsets.symmetric(
            //           horizontal: 20.0, vertical: 5.0),
            //       clipBehavior: Clip.antiAlias,
            //       color: Colors.white,
            //       elevation: 5.0,
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 8.0, vertical: 22.0),
            //         child: Column(
            //           children: [
            //             ProfileTile(title: 'email', value: state.user.email!),
            //             SizedBox(height: 10),
            //             ProfileTile(title: 'phone', value: state.user.phoneNo!),
            //             SizedBox(height: 10),
            //             ProfileTile(
            //                 title: 'package', value: state.user.packageType!),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),
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
            // ElevatedButton(
            //   onPressed: () {
            //     BlocProvider.of<AuthenticationBloc>(context)
            //         .add(AuthenticationLogoutRequested());
            //   },
            //   // shape: RoundedRectangleBorder(
            //   //     borderRadius: BorderRadius.circular(80.0)),
            //   // elevation: 0.0,
            //   // padding: EdgeInsets.all(0.0),
            //   child: Text(
            //     "LogOut",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 26.0,
            //       fontWeight: FontWeight.w300,
            //     ),
            //   ),
            // ),
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
