import 'package:flutter/material.dart';
import 'package:simple_ocr_app/helper/my_color.dart';
import 'package:simple_ocr_app/pages/form_page.dart';

class MyRoomsBox extends StatelessWidget {
  final String title;
  final String subTitle;

  const MyRoomsBox({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Route to FormPage
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormPage(
              onTab: () {},
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Container(
          decoration: const BoxDecoration(
            color: MyColor.darkBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.all(24),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // image
              const Center(
                child: Image(
                  image: AssetImage("assets/images/mylogo.png"),
                  color: Colors.white,
                  width: 60,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  color: MyColor.yellow,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                height: 50,
                width: 50,
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
