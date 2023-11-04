import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/controller/homescreen_controller/homescreen_controller.dart';
import 'package:test1/view/screens/detailspage/details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<HomescreenController>(context, listen: false).getEmployeeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenprovider =
        Provider.of<HomescreenController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        centerTitle: true,
      ),
      body: homescreenprovider.isLoading
          ? Center(child: const CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          Text("Search"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount:
                        homescreenprovider.userResponse?.username?.length ?? 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                userName: homescreenprovider
                                        .userResponse?.username?[index]
                                        .toString() ??
                                    "null",
                                pH: homescreenprovider
                                        .userResponse?.phone?[index]
                                        .toString() ??
                                    "null", selectedIndex: index,),
                          ));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .1,
                          color: const Color.fromARGB(255, 221, 159, 154),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(homescreenprovider
                                      .userResponse?.username?[index]
                                      .toString() ??
                                  "null"),
                              Text(homescreenprovider
                                      .userResponse?.phone?[index]
                                      .toString() ??
                                  "null")
                            ],
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
    );
  }
}
