import 'package:cart_rover/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(itemBuilder: (context , index){
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(GlobalVariable.categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                    ),
                    
                  ),
                ),
                Text(GlobalVariable.categoryImages[index]['title']!,style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ),)
              ],
            );
      } , itemCount: GlobalVariable.categoryImages.length,scrollDirection: Axis.horizontal,
      itemExtent: 75,
      ),
    );
  }
}