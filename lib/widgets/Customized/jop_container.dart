import 'package:flutter/material.dart';

class JopContainer extends StatelessWidget {
  const JopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 11, bottom: 3, right: 24),
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xffCCCCCC))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/Frame 1984078161.png'),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Company name',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'UI Designer',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Mansoura,Egypt.',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              )
            ],
          ),
          Spacer(),
          Text(
            'Posted',
            style: TextStyle(
                color: Color(0xff465697),
                fontSize: 10,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
