
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key,
    required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title
            , style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w700
            ),
          ),

          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text("see more", style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w700
                ),),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios,
            size: 15,
            color: Colors.white70,
          )
        ],
      ),
    );
  }
}