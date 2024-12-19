import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/cast_controller.dart';
import '../models/show_model.dart';
import '../widgets/cast_card.dart';

class ShowDetails extends StatefulWidget {
  final ShowModel show;

  const ShowDetails({super.key, required this.show});

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  bool _showCast = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.show.name)),
      body: Column(
        children: [
          Image.network(
            widget.show.image ?? "",
            height: 250,
            width: double.infinity,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 250,
              color: Colors.grey,
              child: const Center(child: Icon(Icons.broken_image, size: 50)),
            ),
          ),
          const SizedBox(height: 16),
          Text(
              "Language:${widget.show.language}\nGenres:${widget.show.genres}\nRating:${widget.show.rating}\nOfficial site:${widget.show.officialSite}"),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showCast = true;
              });
              Provider.of<CastController>(context, listen: false)
                  .getCasts(widget.show.id);
            },
            child: const Text('Show Cast'),
          ),
          Expanded(
            child: _showCast
                ? Consumer<CastController>(
                    builder: (context, value, child) {
                      if (value.isloading) {
                        
                        return const Center(child: CircularProgressIndicator());
                      } else if (value.casts.isEmpty) {
                       
                        return const Center(
                          child: Text('No cast available for this show'),
                        );
                      } else {
                      
                        return ListView.builder(
                          itemCount: value.casts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: CastCard(
                                actorImageUrl:
                                    value.casts[index].personImage ?? '',
                                actorName: value.casts[index].personName,
                                characterName: value.casts[index].characterName,
                              ),
                            );
                          },
                        );
                      }
                    },
                  )
                : const Center(
                    child: Text('Press "Show Cast" to load the cast'),
                  ),
          ),
        ],
      ),
    );
  }
}
