// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  final String modelName;
  final String price;
  final String size;
  final String condition;
  final String city;
  final String uploadDate;
  const MainCard({
    Key? key,
    required this.imageUrl,
    required this.modelName,
    required this.price,
    required this.size,
    required this.condition,
    required this.city,
    required this.uploadDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(31, 191, 190, 190),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 140,
                  width: 120,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Container(
                    height: 100,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  errorWidget: (context, url, error) => Text(error.toString()),
                )
                    // Image.network(
                    //   imageUrl,
                    //   height: 120,
                    //   width: 110,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                const SizedBox(height: 10),
                Text(
                  '₹$price',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  modelName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$size',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    Text(
                      'Condition: $condition',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$city',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    Text(
                      '$uploadDate',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
