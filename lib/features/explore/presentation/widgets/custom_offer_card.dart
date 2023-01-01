import 'package:flutter/material.dart';

class CustomOfferCard extends StatelessWidget {
  final String title, imageUrl;

  const CustomOfferCard(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {},
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              )),
        ],
      ),
    );
  }
}
