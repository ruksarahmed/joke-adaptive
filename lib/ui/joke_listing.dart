import 'package:flutter/material.dart';

import '../model/joke.dart';

class JokeListing extends StatelessWidget {
  const JokeListing({
    Key? key,
    required this.jokeSelectedCallback,
    required this.jokeSelected,
  }) : super(key: key);

  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke jokeSelected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((joke) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5),
          ),
          child: ListTile(
            title: Text(joke.setup),
            onTap: () => jokeSelectedCallback(joke),
            selected: jokeSelected == joke,
          ),
        );
      }).toList(),
    );
  }
}
