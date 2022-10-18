import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  int number;
  String title;
  String text;
  CardView({required this.number, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      margin: const EdgeInsets.only(left: 20.0, right: 21.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 25,
            // changes position of shadow
          ),
        ],
        border: Border.all(
          color: const Color(0xFFF0F0FF),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(32.0),
        color: Color.fromARGB(255, 141, 76, 167),
        // gradient: const LinearGradient(
        //   colors: [Color(0xFFFFFFFF), Color(0xFFF3F3FF)],
        // ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "#$number",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          VerticalDivider(
            color: Colors.white, //color of divider
            width: 10, //width space of divider
            thickness: 0.7, //thickness of divier line
            indent: 20, //Spacing at the top of divider.
            endIndent: 20, //Spacing at the bottom of divider.
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 270,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "$title",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 30, left: 10),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
