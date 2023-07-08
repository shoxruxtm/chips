import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  double b = 40;
  bool isChecked = true;

  bool isChecked_1 = false;

  void onPressed() async {
    b = 0;
    setState(() {
      isChecked = !isChecked;
    });
    await Future.delayed(const Duration(milliseconds: 150));
    b = 40;
    setState(() {});
  }

  void onTap() {
    setState(() {
      isChecked_1 = !isChecked_1;
    });
  }

  void check() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isChecked ? Colors.lightBlue : Colors.black45,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black54,
                elevation: b,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(30),
                maximumSize: const Size(180, 180),
                shape: const CircleBorder(),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color:
                      isChecked ? Colors.yellow.shade200 : Colors.blueGrey,
                      offset: const Offset(0, 5),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Image.asset(
                  isChecked ? "image/sun_PNG13419.png" : "image/moon_PNG12.png",
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                maximumSize: const Size(200, 200),
                minimumSize: const Size(100, 50),
                backgroundColor: Colors.black,
                padding: const EdgeInsets.only(left: 3, right: 1),
                side: const BorderSide(
                  color: Colors.white,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0,
                  ),
                  isChecked_1
                      ? const Text(
                          "Downloading",
                          style: TextStyle(color: Colors.white),
                        )
                      : const Text(
                          "Download",
                          style: TextStyle(color: Colors.white),
                        ),
                  IconButton(
                    style: IconButton.styleFrom(
                      focusColor: Colors.white,
                      backgroundColor: Colors.white,
                      fixedSize: const Size(30, 30),
                      minimumSize: const Size(43, 43),
                      maximumSize: const Size(50, 50),
                    ),
                    onPressed: onTap,
                    icon: isChecked_1
                        ? const CircularProgressIndicator(
                            color: Colors.blue,
                          )
                        : const Icon(
                            CupertinoIcons.arrow_down_to_line_alt,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
