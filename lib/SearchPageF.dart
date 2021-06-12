import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    String apiKey = "AIzaSyA7B8GU2iS0g0sLaiwgdbpo0hJ0GKBPSRQ";
    googlePlace = GooglePlace(apiKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Location",
          style: TextStyle(
              fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(
                context, //need to send googlePlacealso
                [],
              );
            }),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                  } else {
                    if (predictions.length > 0 && mounted) {
                      setState(() {
                        predictions = [];
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: predictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(predictions[index].description),
                      onTap: () {
                        var itemlist = [];
                        googlePlace.details
                            .get(predictions[index].placeId)
                            .then((value) {
                          itemlist.add(value.result.geometry.location.lat);
                          itemlist.add(value.result.geometry.location.lng);
                          itemlist.add(value.result.name);
                          print(itemlist[0]);
                          Navigator.pop(
                            context, //need to send googlePlacealso
                            itemlist,
                          );
                        });
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                // child: Image.asset("assets/powered_by_google.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }
}
