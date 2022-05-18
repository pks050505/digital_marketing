import 'package:digital_marketing/dao/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screen/cource_detail_page.dart';
import '../screen/home_page.dart';

class CourceNewCard extends StatelessWidget {
  const CourceNewCard({Key? key, required this.cource}) : super(key: key);
  final CourceModel cource;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CourceDetailScreen.routeName,
          arguments: cource,
        );
      },
      child: SizedBox(
        width: 250,
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
                  style: GoogleFonts.aclonica(
                      fontWeight: FontWeight.w500,
                      color: Colors.green.shade300),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, bottom: 12, top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Adobe photoshop: \nComplete Cource in English Complete Cource  Complete Cource in English Complete Cource',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
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
