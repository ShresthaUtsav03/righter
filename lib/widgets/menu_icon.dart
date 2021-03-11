import 'package:flutter/material.dart';
import 'package:righter/views/quiz/play_quiz.dart';

class MenuItem extends StatelessWidget {
  final int level;
  final String menuLabel;
  final Color bgColor;
  final String imageLocation;
  final double iconSize;
  final String quizId;

  MenuItem(
      {@required this.bgColor,
      this.iconSize,
      @required this.imageLocation,
      @required this.menuLabel,
      @required this.level,
      @required this.quizId});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Level ' + level.toString(),
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 22.0,
                ),
          ),
          SizedBox(height: height * 0.01),
          CircleAvatar(
            backgroundColor: bgColor,
            backgroundImage: ExactAssetImage(imageLocation),
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Quiz(quizId, menuLabel, level.toString()),
                ),
              ),
            ),
            // child: Image.asset(
            //   imageLocation,
            //   // fit: BoxFit.cover,
            //   scale: iconSize,
            // ),
            radius: height * 0.065,
          ),
          SizedBox(height: 10.0),
          Text(
            menuLabel,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
