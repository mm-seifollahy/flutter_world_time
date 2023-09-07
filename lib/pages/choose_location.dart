import 'package:flutter/material.dart';

import 'package:flutter_world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // void getData() async {
  //   // simulate network request
  //   String username = await Future.delayed(const Duration(seconds: 3), () {
  //     return 'yoshi';
  //   });
  //
  //   String bio = await Future.delayed(const Duration(seconds: 2), () {
  //     return 'musician, egg collector';
  //   });
  // }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'لندن', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'آتن', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'قاهره', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'نایروبی', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'شیکاگو', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'نیویورک', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'سئول', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'جاکارتا', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    print('state initiated');
  }

  @override
  Widget build(BuildContext context) {
    print('build function triggered');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Chooose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('state disposed');
  }
}
