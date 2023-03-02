import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:zarity_proj/utils/tiles.dart';
import 'package:zarity_proj/utils/listTile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'model/tasks_model.dart';
import 'service/database_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tiles = [
    ["assets/tile_1.png", "CTA-1"],
    ["assets/tile2&3.png", "CTA-2"],
    ["assets/tile2&3.png", "CTA-3"],
  ];
  DatabaseService service = DatabaseService();
  // Future<List<Tasks>>? taskList;
  List<Tasks> retrievedTaskList = [];

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  // List<dynamic> docIds = [];
  // List data = [];
  List<Tasks> imm = [];
  List<Tasks> tw = [];
  List<Tasks> tm = [];

  Future<void> _initRetrieval() async {
    // taskList = service.retrieveTasks();
    retrievedTaskList = await service.retrieveTasks();
    log(retrievedTaskList.length.toString());

    for (var e in retrievedTaskList) {
      log(e.status);
      if (e.dueDate == 'immediate') {
        imm.add(e);
      } else if (e.dueDate == 'This week') {
        tw.add(e);
      } else {
        tm.add(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/man.png",
                    fit: BoxFit.fill,
                    height: 60,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Good Afternoon",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "John Doe",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),

              //TASK LIST
              GestureDetector(
                onTap: () {
                  bottomSheet();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.indigo.shade600,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircularPercentIndicator(
                        animation: true,
                        radius: 30.0,
                        lineWidth: 4.0,
                        percent: 0.70,
                        center: const Text(
                          "70%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        progressColor: Colors.green,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Flexible(
                        child: Text(
                          "Please complete your profile to book consultations.",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Section Title 1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: tiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Tiles(image: tiles[index][0], name: tiles[index][1]);
                  },
                ),
              ),
              const SizedBox(height: 25),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                contentPadding: const EdgeInsets.all(8),
                leading: Image.asset("assets/man_2.png"),
                title: const Text(
                  "Roe Rogan",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.indigo.shade600,
                subtitle: const Text(
                  "Sub text shown here\nCard Description",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade700)),
                  onPressed: () {},
                  child: const Text(
                    "CTA",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              // Card(
              //   color: Colors.white,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Text("Hello"),
              // )

              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.indigo.shade600,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Card Title",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const listTile(),
                    Divider(
                      color: Colors.indigo.shade900,
                      indent: 0,
                      thickness: 5,
                    ),
                    const listTile(),
                    Divider(
                      color: Colors.indigo.shade900,
                      indent: 0,
                      thickness: 5,
                    ),
                    const listTile(),
                    Divider(
                      color: Colors.indigo.shade900,
                      indent: 0,
                      thickness: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700,
                                borderRadius: BorderRadius.circular(20)),
                            child: const FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                "View More",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: GNav(
          tabMargin: EdgeInsets.symmetric(vertical: 10),
          // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.indigo.shade600,
          curve: Curves.bounceIn,
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.person_add,
              text: "Members",
            ),
            GButton(
              icon: Icons.medical_services,
              text: "Aid",
            ),
            GButton(
              icon: Icons.description_outlined,
              text: "Documents",
            ),
          ]),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
        isDismissible: false,
        // isScrollControlled: true,
        // useSafeArea: true,
        backgroundColor: Colors.indigo,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Immediate',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.indigo.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: imm.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              showCustomDialog(imm[index]);
                            },
                            leading: const Icon(
                              Icons.timelapse_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                            title: Text(
                              imm[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              imm[index].status,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'This Week',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.indigo.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: tw.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              showCustomDialog(tw[index]);
                            },
                            leading: const Icon(
                              Icons.timelapse_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                            title: Text(
                              tw[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              tw[index].status,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  showCustomDialog(Tasks task) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.indigo.shade300,
              ),
              child: Center(
                  child: Text(
                task.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          );
        });
  }
}
