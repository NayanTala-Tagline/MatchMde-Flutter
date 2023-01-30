import 'package:flutter/material.dart';
import 'package:matchmde_assessment/util/common_widget.dart';

class ContactDetailsProvider extends ChangeNotifier {

  late List<String> _contactDetails = CommonWidget.contactDetails;
  int _selectedAlphabet = 30;

  List<String> get getContactDetails => _contactDetails;
  set setContactDetails(List<String> value) {
    _contactDetails = value;
    notifyListeners();
  }

  int get getSelectedAlphabet => _selectedAlphabet;
  // set setSelectedAlphabet(int value) {
  //   _selectedAlphabet = value;
  //   notifyListeners();
  // }

  List<String> fetchMatchingContacts(int onSelectedAlphabet) {
    (_selectedAlphabet != onSelectedAlphabet) ? _selectedAlphabet = onSelectedAlphabet : _selectedAlphabet = 30;
    List<String> userDetails = [];

      for (int p = 0; p < CommonWidget.contactDetails.length; p++) {
        String userContact = CommonWidget.contactDetails[p];
        final splitUserContact = CommonWidget.contactDetails[p].split(' ');
        for (int i = 0; i < splitUserContact.length; i++) {
          if (splitUserContact[i][0].toString() == String.fromCharCode(onSelectedAlphabet + 65)) {
            userDetails.add(userContact);
          }
        }
      }

      Set<String> seen = <String>{};
      userDetails = (_selectedAlphabet == 30)
          ? CommonWidget.contactDetails
          : userDetails.where((contact) => seen.add(contact)).toList();
      return userDetails;

  }
}