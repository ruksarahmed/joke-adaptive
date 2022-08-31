import 'package:flutter/material.dart';

import '../model/joke.dart';

class JokeDetails extends StatelessWidget {
  const JokeDetails({
    Key? key,
    required this.isInTabletLayout,
    required this.joke,
  }) : super(key: key);

  final bool isInTabletLayout;
  final Joke joke;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            // joke?.setup ?? "No Joke Selected",
            joke.setup,
            style: textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            // joke?.punchline ?? "Please select a Joke.",
            joke.punchline,
            style: textTheme.subtitle1,
          ),
        ),
      ],
    );

    if (isInTabletLayout) {
      return Center(
        child: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        // title: Text(joke?.type ?? "No Jokes"),
        title: Text(joke.type),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: content,
      ),
    );
  }
}
