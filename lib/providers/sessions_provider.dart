import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/sevices/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionsProvider with ChangeNotifier {
  Map<String, dynamic> mapSessions = {};
  Map<String, dynamic> mapSession = {};
  Map<String, dynamic> mapBookPackage = {};
  Map<String, dynamic> mapUserBookedSessions = {};
  Map<String, dynamic> mapcancelPackageBooking = {};
  //for user booked session
  List listOfPackageDescription = [];
  List listOfPackageDate = [];
  List listOfPackageUrl = [];
  List listOfPackageLocation = [];
  List listOfSessionDescription = [];

  List tempListForSessionNameDate = [];
  List tempListForSessionNameLocation = [];
  List tempListForSessionUrl = [];
  //for user booked session

  //for session
  List listOfIsPackageBookable = [];
  //for session

  //for book session
  List listOfTimeStartForDescription = [];
  List listOfTimeEndForDescription = [];
  List listOfSpeakerImage = [];

  bool error = false;
  bool getUserBookedSessionsIsDone = false;
  bool bookPackageIsDone = false;
  String isPackageBookable = '1';
  int itemCount = 0;
  String startTime = '';
  String endTime = '';
  String packageId = '';
  String bookingImageUrl = '';
  late String event;
  late String category;

  late ApiService apiService;
  late AuthProvider authProvider;

  SessionsProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    print('here is token');
    print(authProvider.token);
    // this.apiService = ApiService(authProvider.token);
    this.apiService = ApiService(
        authProvider.token, authProvider.id.toString(), authProvider.eventCode);
  }

  Future<void> getSessions() async {
    print('go into get Sessions provider getSessions');
    mapSessions = await apiService.getSessions();
    listOfIsPackageBookable.clear();
    //isPackage Bookable
    for (var i = 0; i < mapSessions['categories'].length; i++) {
      listOfIsPackageBookable.add([]);
      for (var m = 0;
          m <
              mapSessions['sub_categories'][mapSessions['categories'][i]]
                  .length;
          m++) {
        listOfIsPackageBookable[i].add(mapSessions['result']
                    [mapSessions['categories'][i]]
                [mapSessions['sub_categories'][mapSessions['categories'][i]][m]]
            [0]['is_package_bookable']);
      }
    }
    notifyListeners();
  }

  Future<void> getSession(
      String sessionId, String event, String category) async {
    print('go into get Session provider getSession');
    mapSession = await apiService.getSession(sessionId);

    var dateTimeStart = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
        .parse(mapSession['result']['datetime_start'], true);
    var dateLocalStart = dateTimeStart.toLocal();

    var dateTimeEnd = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
        .parse(mapSession['result']['datetime_end'], true);
    var dateLocalEnd = dateTimeEnd.toLocal();
    //time start for session

    listOfTimeStartForDescription.add(dateLocalStart
            .toString()
            .split(' ')[1]
            .split('.')[0]
            .split(':')[0] +
        ':' +
        dateLocalStart.toString().split(' ')[1].split('.')[0].split(':')[1]);

    //time start for session

    listOfTimeEndForDescription.add(
        dateLocalEnd.toString().split(' ')[1].split('.')[0].split(':')[0] +
            ':' +
            dateLocalEnd.toString().split(' ')[1].split('.')[0].split(':')[1]);

    this.event = event;
    this.category = category;
    bookingImageUrl = mapSession['result']['session_banner_url'];
    notifyListeners();
  }

  Future<void> getUserBookedSessions() async {
    print('go into get Session provider getBookedSessions');
    mapUserBookedSessions = await apiService.getUserBookedSessions();
    if (mapUserBookedSessions['message'] ==
        "Sucessfully retrieved your booked session(s)!") {
      itemCount = 0;
      listOfPackageDescription.clear();
      listOfPackageDate.clear();
      listOfPackageLocation.clear();
      tempListForSessionNameDate.clear();
      tempListForSessionNameLocation.clear();
      tempListForSessionUrl.clear();
      listOfPackageUrl.clear();

      //for subcategories
      for (var i = 0; i < mapUserBookedSessions['categories'].length; i++) {
        for (var m = 0;
            m <
                mapUserBookedSessions['sub_categories']
                        [mapUserBookedSessions['categories'][i]]
                    .length;
            m++) {
          listOfPackageDescription.add(mapUserBookedSessions['sub_categories']
              [mapUserBookedSessions['categories'][i]][m]);
        }
      }

      //date start
      for (var i = 0; i < mapUserBookedSessions['result'].length; i++) {
        if (tempListForSessionNameDate.contains(
            mapUserBookedSessions['result'][i]['package_description'])) {
        } else {
          tempListForSessionNameDate
              .add(mapUserBookedSessions['result'][i]['package_description']);

          listOfPackageDate.add(
              mapUserBookedSessions['result'][i]['datetime_start'].toString());
        }
      }
      print(listOfPackageDate);
      print('check this');
      print(tempListForSessionNameLocation);
      for (var i = 0; i < mapUserBookedSessions['result'].length; i++) {
        if (tempListForSessionNameLocation.contains(
            mapUserBookedSessions['result'][i]['package_description'])) {
        } else {
          tempListForSessionNameLocation
              .add(mapUserBookedSessions['result'][i]['package_description']);
          print(tempListForSessionNameLocation);
          listOfPackageLocation
              .add(mapUserBookedSessions['result'][i]['location']);
        }
      }
      print(listOfPackageLocation);

      for (var i = 0; i < mapUserBookedSessions['result'].length; i++) {
        if (tempListForSessionUrl.contains(
            mapUserBookedSessions['result'][i]['package_description'])) {
        } else {
          tempListForSessionUrl
              .add(mapUserBookedSessions['result'][i]['package_description']);
          print(tempListForSessionUrl);
          listOfPackageUrl
              .add(mapUserBookedSessions['result'][i]['session_banner_url']);
        }
      }
      print('CHECKKKKKKKK');
      print(listOfPackageUrl);

      for (var i = 0; i < mapUserBookedSessions['categories'].length; i++) {
        itemCount += mapUserBookedSessions['sub_categories']
                [mapUserBookedSessions['categories'][i]]
            .length as int;
      }
    }
    getUserBookedSessionsIsDone = true;

    notifyListeners();
  }

  Future<void> bookPackage(String packageId) async {
    print('go into get Session provider bookPackage');
    mapBookPackage = await apiService.bookPackage(packageId);
    notifyListeners();
  }

  Future<void> cancelPackageBooking(String packageId) async {
    print('go into get Session provider cancelPackageBooking');
    mapcancelPackageBooking = await apiService.cancelPackageBooking(packageId);
    notifyListeners();
  }

  void initialForBookSession() {
    listOfTimeStartForDescription.clear();
    listOfTimeEndForDescription.clear();
    notifyListeners();
  }

  void setPackageId(String packageId) {
    this.packageId = packageId;
  }

  void setSessionDescription(String description) {
    listOfSessionDescription.add(description);
  }

  void setSessionSpeakerImage(String imageUrl) {
    print('BOTH TRUE FALSE SHOULD BE TRUE');
    print(imageUrl != 'No speaker(s) for selected session.');
    print(!listOfSpeakerImage.contains(imageUrl));
    if (imageUrl != 'No speaker(s) for selected session.' &&
        !listOfSpeakerImage.contains(imageUrl)) {
      listOfSpeakerImage.add(imageUrl);
    }
  }

  void setIsPackageBookable(String isPackageBookable) {
    this.isPackageBookable = isPackageBookable;
  }

  void initialForGetUserBookedSessions() {
    getUserBookedSessionsIsDone = false;
  }

  void initialForSessionDescription() {
    listOfSessionDescription.clear();
  }

  void initialForSpeakerImage() {
    listOfSpeakerImage.clear();
  }

  void setStartTime(startTime) {
    this.startTime = startTime;
    notifyListeners();
  }

  void setEndTime(endTime) {
    this.endTime = endTime;
    notifyListeners();
  }
}
