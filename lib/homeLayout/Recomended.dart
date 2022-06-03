import 'package:flutter/material.dart';

class Recomended extends StatelessWidget {
  final String url;
  const Recomended({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              recomendedCard(url: this.url),
              SizedBox(
                width: 12.0,
              )
            ],
          );
        },
      ),
    );
  }
}

class recomendedCard extends StatelessWidget {
  final String url;
  const recomendedCard({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
            image: NetworkImage(
              this.url,
            ),
            width: 130,
            height: 130),
        SizedBox(
          height: 8,
        ),
        Text(
          "Song",
          style: (TextStyle(color: Colors.grey, fontSize: 12.0)),
        )
      ],
    );
  }
}
