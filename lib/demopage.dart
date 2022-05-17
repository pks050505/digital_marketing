import 'package:digital_marketing/screen/home_page.dart';
import 'package:flutter/material.dart';

class NewCourceTile extends StatelessWidget {
  const NewCourceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrll),
              ),
              ListTile(
                tileColor: Colors.grey.shade200,
                title: Text(
                  'Instructor name',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        'Adobe photoshop: \nComplete Cource in English',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '1h 11m.',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          '6 Lessions',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
