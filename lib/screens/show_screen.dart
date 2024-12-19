import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/show_controller.dart';
import '../widgets/show_card.dart';
import 'show_detail.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({
    super.key,
  });

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  void initState() {
    context.read<ShowController>().getShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TV Shows')),
      body: Consumer<ShowController>(
        builder: (context, value, child) {
          return GridView.builder(
              itemCount: value.shows.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final show = value.shows[index];
                return ShowCard(
                  imageUrl: show.image ?? '',
                  title: show.name,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowDetails(show: show),
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
