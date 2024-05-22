import 'package:flutter/material.dart';

class Modal_Ahorro{
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            padding: EdgeInsets.all(20),
            height: 500,
            width: MediaQuery.of(context).size.width*1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.access_alarm_rounded,
                      size: 30,
                    ),
                    Icon(Icons.ad_units,
                      size: 30,
                    ),
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}