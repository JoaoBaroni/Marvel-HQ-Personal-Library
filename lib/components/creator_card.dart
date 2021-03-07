import 'package:flutter/material.dart';


class CreatorCard extends StatelessWidget {
  const CreatorCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Center(child: Text('Stan Lee', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('images/stan_lee.jpg'),
            fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        height: 100,
        width: 200,
      ),
    );
  }
}
