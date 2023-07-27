import 'package:flutter/material.dart';
import 'package:oru_phones_assignment/models/filters.dart';

void bottomSheetShow(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Center(
              child: FutureBuilder<FiltersResponse>(
                future: FiltersResponse.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text('Message: ${snapshot.data!.message}'),
                        const SizedBox(height: 8),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 12, right: 12, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Filters',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'Clear Filter',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.filters.length,
                            itemBuilder: (context, index) {
                              var entry = snapshot.data!.filters.entries
                                  .elementAt(index);
                              return _buildFilterCard(entry.key, entry.value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text(
                              'APPLY',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ),
            // Positioned(
            //   top: -27,
            //   right: 50,
            //   child: IconButton(
            //     icon: Container(
            //       color: Colors.red,
            //       child: Icon(
            //         Icons.close,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onPressed: () {
            //       // Close the bottom sheet when the close icon is pressed
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ),
          ],
        );
      });
}

Widget _buildFilterCard(String category, List<String> items) {
  List<String> modifiedItems = ['All', ...items];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category,
            style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
        const SizedBox(height: 8),
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: modifiedItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Chip(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  label: Text(modifiedItems[index]),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  backgroundColor: Colors.transparent,
                  labelStyle: const TextStyle(color: Colors.black),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
