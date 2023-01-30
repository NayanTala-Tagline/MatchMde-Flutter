import 'package:flutter/material.dart';
import 'package:matchmde_assessment/provider/contact_details_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactDetailsProvider>(builder: (context, value, _) {
      return Scaffold(
        body: Column(
          children: [
            Container(
              height: 80,
              color: Colors.grey.shade200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 26,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          value.setContactDetails = ContactDetailsProvider.matchingContacts(index);
                        },
                        child: CircleAvatar(
                          minRadius: 20,
                          backgroundColor:
                              (ContactDetailsProvider.selectedAlphabet != index) ? Colors.teal.shade200 : Colors.white,
                          child: Text(String.fromCharCode(index + 65),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: (ContactDetailsProvider.selectedAlphabet == index)
                                      ? Colors.teal.shade200
                                      : Colors.white)),
                        ),
                      ),
                    );
                  }),
            ),
            (value.getContactDetails.isNotEmpty)
                ? Flexible(
                    child: ListView.builder(
                        itemCount: value.getContactDetails.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              color: Colors.grey.shade200,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  value.getContactDetails[index],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }))
                : const Expanded(
                    child: Center(
                      child: Text(
                        "No Data",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
