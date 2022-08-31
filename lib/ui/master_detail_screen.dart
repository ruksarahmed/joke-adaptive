import 'package:flutter/material.dart';
import 'package:joke/model/joke.dart';
import 'package:joke/ui/joke_details.dart';
import 'package:joke/ui/joke_listing.dart';

class MasterDetailScreen extends StatefulWidget {
  const MasterDetailScreen({Key? key}) : super(key: key);

  @override
  State<MasterDetailScreen> createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tabletBreakPoint = 600;
  late Joke _selectedJoke;

  Widget _buildMobileLayout() {
    return JokeListing(
      jokeSelectedCallback: (jokeSelected) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return JokeDetails(
                isInTabletLayout: false,
                joke: jokeSelected,
              );
            },
          ),
        );
      },
      jokeSelected: _selectedJoke,
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Material(
            elevation: 13.0,
            child: JokeListing(
              jokeSelectedCallback: (joke) {
                setState(() {
                  _selectedJoke = joke;
                });
              },
              jokeSelected: _selectedJoke,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(
            isInTabletLayout: true,
            joke: _selectedJoke,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait &&
        shortestSide < tabletBreakPoint) {
      //Mobile Layout
      content = _buildMobileLayout();
    } else {
      //Tablet Layout
      content = _buildTabletLayout();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes"),
      ),
      body: content,
    );
  }
}
