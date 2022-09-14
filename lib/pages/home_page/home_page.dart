import 'package:flutter/material.dart';
import '../../core/services/alpha_auth_api/alpha_auth_api.dart';
import '../../core/services/alpha_borsa_bulten_api/alpha_borsa_bulten_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = '';
  @override
  void initState() {
    super.initState();
    kayanYazi().then((value) => data = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: () {
              logout().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/LoginPage', (route) => false);
              });
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('get data'),
            onPressed: () async {
              var temp = await kayanYazi();
              setState(() {
                data = temp;
              });
            },
          ),
          Text(data)
        ],
      ),
    );
  }
}
