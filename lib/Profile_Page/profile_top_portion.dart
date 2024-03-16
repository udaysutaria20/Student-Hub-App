import 'package:flutter/material.dart';

class TopPortion extends StatefulWidget {

  const TopPortion({super.key});

  @override
  State<TopPortion> createState() => _TopPortionState();
}

class _TopPortionState extends State<TopPortion> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _BlueContainer(),
            _WhiteContainer(),
          ],
        ),
        _ImageNamePosition(),
      ],
    );
  }
}

class _WhiteContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingPercentage = 0.05;
    return Container(
      height: 125,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 0.5 * screenWidth * paddingPercentage,
                  bottom: 4 * screenWidth * paddingPercentage,
                ),
                child: const Text("Contributions", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue
                ),),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 0.5 * screenWidth * paddingPercentage,
                  bottom: 4 * screenWidth * paddingPercentage,
                ),
                child: const Text("Connections", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class _ImageNamePosition extends StatefulWidget{
  @override
  State<_ImageNamePosition> createState() => _ImageNamePositionState();
}

class _ImageNamePositionState extends State<_ImageNamePosition> {
  var list = [
    {
      'name' : "Uday Sutaria",
      'contributions' : "500+",
      'connections' : "500+"
    }
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 0,
      left: (screenWidth - 175) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue, // Set the color of the border
                    width: 12, // Set the width of the border
                  ),
                ),
                width: 175,
                height: 175,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Set the color of the border
                      width: 10, // Set the width of the border
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 75, // half of the width and height to make it a circle
                    backgroundImage: AssetImage('assets/images/profiledummyimg.png', )
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Container(
                    child: Icon(Icons.add, size: 40, color: Colors.white,),
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            list[0]['name'].toString(),
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class _BlueContainer extends StatefulWidget{
  @override
  State<_BlueContainer> createState() => _BlueContainerState();
}

class _BlueContainerState extends State<_BlueContainer> {
  var list = [
    {
      'name' : "Vraj Desai",
      'contributions' : "500+",
      'connections' : "500+"
    }
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingPercentage = 0.05;
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 3 * screenWidth * paddingPercentage,
              left: 1.5 * screenWidth * paddingPercentage,
            ),
            child: Text(list[0]['contributions'].toString(), style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: Colors.white
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 3 * screenWidth * paddingPercentage,
              right: 1.5 * screenWidth * paddingPercentage,
            ),
            child: Text(list[0]['connections'].toString(), style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: Colors.white
            ),),
          ),
        ],
      ),
    );
  }
}