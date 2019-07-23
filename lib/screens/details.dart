import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final List _places = places;
  @override
  Widget build(places) {
    var sizedBox = SizedBox(height: 10);
    var _buildGallery = () {
      return Container(
        padding: EdgeInsets.only(left: 20),
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          primary: false,
          itemCount: _places == null ? 0 : _places.length,
          itemBuilder: (BuildContext ctxt, int index) {
            Map place = _places[index];

            return Padding(
              padding: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${place["img"]}",
                  height: 250,
                  width: MediaQuery.of(context).size.width - 40,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      );
    };

    var _buildImage = (img) {
      return Image.asset(
        "${img}",
        height: 250,
        width: MediaQuery.of(context).size.width - 40,
        fit: BoxFit.cover,
      );
    };

    var _buildTitle = () {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Container(
              child: Text(
                "${_places[0]["name"]}",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                maxLines: 3,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.star,
                  ),
                  onPressed: () {},
                ),
                Text("0")
              ],
            ),
          ),
        ],
      );
    };

    var _buildLocation = () {
      return Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            size: 14,
            color: Colors.blueGrey[300],
          ),
          SizedBox(width: 3),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "${_places[0]["location"]}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.blueGrey[300],
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );
    };

    var _buildPrice = () {
      return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "${_places[0]["price"]}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          maxLines: 1,
          textAlign: TextAlign.left,
        ),
      );
    };

    var _buildDetail = () {
      return [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "${_places[0]["details"]}",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 10),
      ];
    };

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          _buildGallery(),
          SizedBox(height: 20),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              _buildTitle(),
              _buildLocation(),
              SizedBox(height: 20),
              _buildPrice(),
              SizedBox(height: 40),
              ..._buildDetail(),
              sizedBox,
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.airplanemode_active,
        ),
        onPressed: () {},
      ),
    );
  }
}
