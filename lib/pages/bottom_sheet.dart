import 'package:cpr_app/widgets/emergency_contact_info.dart';
import 'package:cpr_app/widgets/navigate_hospital_card.dart';
import 'package:cpr_app/widgets/personal_info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class PersistentBottomSheet extends StatefulWidget {
  @override
  _PersistentBottomSheetState createState() => _PersistentBottomSheetState();
}

class _PersistentBottomSheetState extends State<PersistentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.10,
      maxChildSize: 0.90,
      initialChildSize: 0.10,
      builder: (BuildContext context, ScrollController scrollController) {
        return CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: (MediaQuery.of(context).size.width) / 5,
                        height: 4.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.black26),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.info,
                            color: Theme.of(context).accentColor,
                          ),
                          Container(width: 8.0),
                          Text(
                            "Emergency Information",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                      Container(width: 16.0),
                      MaterialButton(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        elevation: 0.0,
                        padding: EdgeInsets.only(left: 32.0, right: 32.0),
                        child: Text(
                          "Contact Ambulance",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        onPressed: () => launch("tel://102"),
                      )
                    ],
                  ),
                ),
                NavigateToHospital(),
                EmergencyContactInfo(),
                PersonalInfoCard(),
              ]),
            )
          ],
        );
      },
    );
  }
}
