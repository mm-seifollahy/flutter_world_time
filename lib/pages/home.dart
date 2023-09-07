import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context)!.settings!.arguments! as Map : data;
    print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor =  data['isDaytime'] ? Colors.blue : Colors.indigo.shade700;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$bgImage'), fit: BoxFit.cover
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                    },
                    icon: const Icon(Icons.edit_location),
                    label: const Text('انتخاب موقعیت مکانی'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28, letterSpacing: 2.0, color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66, color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
