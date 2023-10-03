import 'package:flutter/material.dart';
import 'package:kuis/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final DataBuku judul;
  final Uri _url = Uri.parse('https://flutter.dev');

  Details({Key? key, required this.judul}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.judul.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: widget.judul.isBookmarked
                ? Icon(
              Icons.bookmark,
              color: Colors.white,
            )
                : Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.judul.isBookmarked = !widget.judul.isBookmarked;
              });
              final snackBar = SnackBar(
                content: Text(
                  widget.judul.isBookmarked
                      ? 'You have nice taste!'
                      : 'Change of taste is alright!',
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
                child: Image.network(widget.judul.imageLink),
              ),
                Text(
                  widget.judul.author,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
                Text(
                  widget.judul.country,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.judul.language,
                  style: TextStyle(fontSize: 15),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL(widget.judul.link[1]);
        },
        child: Icon(Icons.open_in_browser_sharp),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
