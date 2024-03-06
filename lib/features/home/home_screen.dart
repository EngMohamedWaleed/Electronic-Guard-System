import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:untitled2/core/widgets/text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hello, Ibrahim",
                          style: AppTextStyles.headtext,
                        ),
                        Text(
                          "Welcome to the Electronic Guard System",
                          style: AppTextStyles.headtext.copyWith(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomeHomeCard(),
                  const SizedBox(
                    height: 15,
                  ),
                  HomeViewRoomsCard(
                    width: 10000,
                    onTap: null,
                    roomTitle: "Total Rooms",
                    description: "12",
                    isMainWidget: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 40),
            
                ElevatedButton(
                  child: Text('Open URL'),
                  onPressed: () async {
                    const url = 'http://192.168.1.10/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                SizedBox(height: 40),
            
                ElevatedButton(
                  child: Text('Open URL'),
                  onPressed: () async {
                    const url = 'http://192.168.1.10/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                SizedBox(height: 40),
            
                ElevatedButton(
                  child: Text('Open URL'),
                  onPressed: () async {
                    const url = 'http://192.168.1.10/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  child: Text('Open URL'),
                  onPressed: () async {
                    const url = 'http://192.168.1.10/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                  // Expanded(
                  //     child: GridView.builder(
                  //       physics: BouncingScrollPhysics(),
                  //       itemCount: 8,
                  //       itemBuilder: (context, index) => HomeViewRoomsCard(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => MyHomePage(),
                  //               ));
                  //         },
                  //         roomTitle: "Room- ${index + 1}",
                  //         isMainWidget: false,
                  //         description: "",
                  //         width: 150,
                  //       ),
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           crossAxisSpacing: 20,
                  //           mainAxisSpacing: 8,
                  //           childAspectRatio: 1.5 / 0.6),
                  //     ))
                ],
              ),
            ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VlcPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      'http://192.168.1.10/video', // Adjust the URL with the correct endpoint
      hwAcc: HwAcc.full,
      autoPlay: false,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose(); // Dispose the controller to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: VlcPlayer(
          controller: _videoPlayerController,
          aspectRatio: 16 / 9,
          placeholder: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class HomeViewRoomsCard extends StatefulWidget {
  const HomeViewRoomsCard(
      {super.key,
        required this.width,
        required this.description,
        this.isMainWidget = false,
        required this.roomTitle,
        required this.onTap});
  final double width;
  final String roomTitle;

  final String description;
  final bool isMainWidget;
  final Function()? onTap;
  @override
  State<HomeViewRoomsCard> createState() => _HomeViewRoomsCardState();
}

class _HomeViewRoomsCardState extends State<HomeViewRoomsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 60),
        height: 90,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.isMainWidget
                ? Colors.white
                : Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              widget.isMainWidget
                  ? BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 10,
              )
                  : BoxShadow()
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    widget.roomTitle,
                    style: AppTextStyles.headtext.copyWith(
                        color: widget.isMainWidget
                            ? Colors.black
                            : Colors.green.shade800,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  widget.isMainWidget
                      ? Text(
                    "12",
                    style: AppTextStyles.headtext.copyWith(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                      : SizedBox.shrink()
                ],
              ),
            ),
            widget.isMainWidget
                ? Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(0.2)),
              child: const Icon(
                Icons.home,
                color: Colors.green,
                size: 40,
              ),
            )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class CustomeHomeCard extends StatelessWidget {
  const CustomeHomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        top: 20,
      ),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Colors.green[300]!,
            Colors.green,
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
            child: const Icon(
              Icons.security,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Set Up your Home!",
            style: AppTextStyles.headtext.copyWith(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            "Welcome to the Electronic Guard System",
            style: AppTextStyles.headtext.copyWith(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomElevatedButon(
            backgroundColor: Colors.white,
            titleColor: Colors.green,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SetupView();
                },
              ));
            },
            buttonTitle: "set up",
          )
        ],
      ),
    );
  }
}

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: rooms.length,
                    itemBuilder: (context, index) => RoomCard(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomInputData(),
                            ));
                      },
                      title: rooms[index].title,
                      icon: rooms[index].icon,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 22,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class RoomInputData extends StatelessWidget {
  const RoomInputData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Room Location",
                style: AppTextStyles.headtext
                    .copyWith(color: Colors.green, fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              GeneralSearchTextField(
                hintText: "Enter Room Location",
                onSubmitted: (p0) {},
              ),
              SizedBox(
                height: 30,
              ),
              Text("Room Windows count",
                  style: AppTextStyles.headtext
                      .copyWith(color: Colors.green, fontSize: 22)),
              SizedBox(
                height: 8,
              ),
              GeneralSearchTextField(
                hintText: "Enter Room Windows count",
                onSubmitted: (p0) {},
              ),
              SizedBox(
                height: 30,
              ),
              Text("Room Description",
                  style: AppTextStyles.headtext
                      .copyWith(color: Colors.green, fontSize: 22)),
              SizedBox(
                height: 8,
              ),
              GeneralSearchTextField(
                hintText: "Enter Room Description",
                onSubmitted: (p0) {},
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomElevatedButon(
                  backgroundColor: Colors.green,
                  titleColor: Colors.white,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Data Saved Successfully",
                        style: AppTextStyles.headtext
                            .copyWith(color: Colors.white, fontSize: 15),
                      ),
                      backgroundColor: Colors.green,
                    ));
                  },
                  buttonTitle: "Save Data",
                ),
              )
            ],
          ),
        ));
  }
}

class GeneralSearchTextField extends StatelessWidget {
  const GeneralSearchTextField({
    Key? key,
    required this.hintText,
    required this.onSubmitted,
  }) : super(key: key);

  final void Function(String)? onSubmitted;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    // Create a FocusNode

    // Set the Arabic keyboard locale when the TextField gains focus

    return TextField(
      onChanged: onSubmitted,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.green,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }
}

class RoomModel {
  final String title;
  final IconData icon;
  RoomModel({required this.title, required this.icon});
}

List<RoomModel> rooms = [
  RoomModel(
    title: "Living Room",
    icon: Icons.home,
  ),
  RoomModel(
    title: "Bed Room",
    icon: Icons.bed,
  ),
  RoomModel(
    title: "Kitchen",
    icon: Icons.kitchen,
  ),
  RoomModel(
    title: "Bathroom",
    icon: Icons.bathtub,
  ),
  RoomModel(
    title: "Garage",
    icon: Icons.directions_car,
  ),
  RoomModel(
    title: "Garden",
    icon: Icons.grass,
  ),
  RoomModel(
    title: "Balcony",
    icon: Icons.balcony,
  ),
  RoomModel(
    title: "Office",
    icon: Icons.work,
  ),
  RoomModel(
    title: "Gym",
    icon: Icons.sports,
  ),
  RoomModel(
    title: "Swimming Pool",
    icon: Icons.pool,
  ),
  RoomModel(
    title: "Library",
    icon: Icons.book,
  ),
  RoomModel(
    title: "Game Room",
    icon: Icons.games,
  ),
];

class RoomCard extends StatelessWidget {
  const RoomCard(
      {super.key,
        required this.icon,
        required this.title,
        required this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
            boxShadow: []),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 70,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: AppTextStyles.headtext.copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

abstract class AppTextStyles {
  static const TextStyle headtext =
  TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600);
}

class CustomElevatedButon extends StatelessWidget {
  final Function()? onTap;
  final String buttonTitle;
  final Color backgroundColor;
  final Color titleColor;
  const CustomElevatedButon(
      {super.key,
        required this.onTap,
        required this.buttonTitle,
        required this.backgroundColor,
        required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          onPressed: onTap,
          child: Text(buttonTitle,
              style: AppTextStyles.headtext.copyWith(
                color: titleColor,
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}