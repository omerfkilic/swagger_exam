// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:swagger_exam/models/combo_box_model.dart';
import 'package:swagger_exam/models/kayan_yazi_model.dart';
import 'package:swagger_exam/pages/home_page/helper/sales_graphic.dart';
import 'package:swagger_exam/pages/home_page/view_model/home_page_view_model.dart';
import '../../../core/services/alpha_auth_api/alpha_auth_api.dart';
import '../../../core/services/alpha_borsa_bulten_api/alpha_borsa_bulten_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool firtTime = true;
  Future<ComboBoxModel> _() async {
    print('first time? ' + firtTime.toString());

    if (firtTime) {
      await HomePageViewModel.instance.getComboBoxData();
      HomePageViewModel.instance.dropDownValue =
          HomePageViewModel.instance.comboBox!.data!.first;
      firtTime = false;
    }
    await HomePageViewModel.instance.getGraphicData();
    return HomePageViewModel.instance.comboBox!;
  }

  //ComboBoxDatum? dropDownValue;
  @override
  Widget build(BuildContext context) {
    print('build çalıştı');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    await HomePageViewModel.instance.getKayanYaziData();
                    setState(() {
                      HomePageViewModel.instance.kayanYazi!.data![0]
                          .toJson()
                          .toString();
                    });
                  },
                ),
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
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FutureBuilder<ComboBoxModel>(
                future: _(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //dropDownValue = snapshot.data!.data!.first;
                    return Column(
                      children: [
                        DropdownButton<ComboBoxDatum>(
                            value: HomePageViewModel.instance.dropDownValue,
                            items: HomePageViewModel.instance.comboBox!.data!
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e.maladi!),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                HomePageViewModel.instance.dropDownValue =
                                    value;
                                HomePageViewModel.instance.getGraphicData();
                              });
                            }),
                        SalesGraphic(),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    print('dropDownBox.error = ${snapshot.error}');

                    return const Center(
                      child: Text('Hataa'),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              FutureBuilder<KayanYaziModel>(
                future: HomePageViewModel.instance.getKayanYaziData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 75,
                      width: MediaQuery.of(context).size.width - 35,
                      child: ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            subtitle: Text(
                                '${snapshot.data!.data![index].kilo!} kilo'),
                            title: Text(snapshot.data!.data![index].maladi!),
                            trailing: Text(
                                '${snapshot.data!.data![index].adet!} adet'),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print('hata   ${snapshot.error}');
                    return const Center(
                      child: Text('Hataa'),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
