import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Text(
            "Deal of the day",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network('https://images.unsplash.com/photo-1682687982502-1529b3b33f85?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8fA%3D%3D',
        height: 235,fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text('\$100', style: TextStyle(fontSize: 18),),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5,right: 15),
          child: const Text("Prem", overflow: TextOverflow.ellipsis,maxLines: 2,),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https://images.unsplash.com/photo-1682687982502-1529b3b33f85?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8fA%3D%3D',fit: BoxFit.fitWidth,width: 100,height: 100,),
              Image.network('https://images.unsplash.com/photo-1682687982502-1529b3b33f85?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8fA%3D%3D',fit: BoxFit.fitWidth,width: 100,height: 100,),
              Image.network('https://images.unsplash.com/photo-1682687982502-1529b3b33f85?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8fA%3D%3D',fit: BoxFit.fitWidth,width: 100,height: 100,),
              Image.network('https://images.unsplash.com/photo-1682687982502-1529b3b33f85?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8fA%3D%3D',fit: BoxFit.fitWidth,width: 100,height: 100,),

            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical:15, ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text("See all deals", style: TextStyle(color: Colors.cyan[800], ),),
        )
      ],
    );
  }
}
