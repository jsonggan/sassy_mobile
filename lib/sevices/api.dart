import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  late String token;
  late String userId;
  late String eventCode;

  ApiService(
    String token,
    String userId,
    String eventCode,
  ) {
    this.token = token;
    this.userId = userId;
    this.eventCode = eventCode;
  }

  final String baseUrl = 'https://api.fronthaus.com/api/v1';

  Future<Map<String, dynamic>> register(
    String title,
    String first_name,
    String last_name,
    String email,
    String hospital_institution,
    String mcr_snb_number,
    String country,
    String profession,
    String dietary_restrictions,
  ) async {
    print('pass through api register');
    String url = baseUrl + '/register';
    Map<String, dynamic> mapRegister = {};

    http.Response response = await http.post(Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: jsonEncode({
          'title': title,
          'first_name': first_name,
          'last_name': last_name,
          'email': email,
          'hospital_institution': hospital_institution,
          'mcr_snb_number': mcr_snb_number,
          'country': country,
          'profession': profession,
          'dietary_restrictions': dietary_restrictions,
        }));

    if (response.statusCode != 200) {
      // Map<String, dynamic> body = jsonDecode(response.body);
      // Map<String, dynamic> errors = body['errors'];
      // String errorMessage = '';
      // errors.forEach((key, value) {
      //   value.forEach((element) {
      //     errorMessage += element + '\n';
      //   });
      // });
      // throw Exception(errorMessage);
      print('cant pass api statue code');
    }
    mapRegister = jsonDecode(response.body);
    print(mapRegister);

    return mapRegister;
  }

  Future<Map<String, dynamic>> loginStep1(String email) async {
    String uri = baseUrl + '/login/step1';
    Map<String, dynamic> mapGetLogin1 = {};

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: jsonEncode({'email': email}));
    print(response.statusCode);

    try {
      mapGetLogin1 = jsonDecode(response.body);
    } catch (e) {
      // bool error = true;
      mapGetLogin1 = {'message': 'Check your network connection'};
    }

    print(response.body);

    return mapGetLogin1;
  }

  Future<Map<String, dynamic>> loginStep2(String email, String mfa_code) async {
    print('go into api login Step2');
    String uri = baseUrl + '/login/step2';
    Map<String, dynamic> mapGetUserDetail = {};

    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: jsonEncode({'email': email, 'mfa_code': mfa_code}),
    );

    print('go into api login Step2 after passing data');
    print(response.statusCode);
    print(response.body);
    mapGetUserDetail = jsonDecode(response.body);

    if (response.statusCode == 400) {}
    return mapGetUserDetail;
  }

  Future<Map<String, dynamic>> loginResendMFA(String email) async {
    print('go into api loginResendMFA');
    String uri = baseUrl + '/login/resendMFA';
    Map<String, dynamic> mapResendMFA = {};

    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: jsonEncode({'email': email}),
    );

    print('go into api loginResendMFA 2');
    print(response.statusCode);

    if (response.statusCode == 400) {}
    print(response.body);
    mapResendMFA = jsonDecode(response.body);
    return mapResendMFA;
  }

  Future<Map<String, dynamic>> fetchAgendaData(
      String date, int trackNumber) async {
    print('go into fetch agenda data api');

    Map<String, dynamic> mapGetAgenda = {};
    final queryParameters = {
      'date': date,
      'track_number': trackNumber,
    }.map((key, value) => MapEntry(key, value.toString()));

    http.Response response = await http.get(
      Uri.https(
        'api.fronthaus.com',
        '/api/v1/agenda',
        queryParameters,
      ),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch agenda data api http.response pass');

    print(response.body);
    if (response.statusCode == 200) {
      try {
        mapGetAgenda = jsonDecode(response.body);

        print('successfully map');
      } catch (e) {
        print('agenda error 1');
      }
    }
    if (response.statusCode == 400) {
      try {
        mapGetAgenda = jsonDecode(response.body);

        print('successfully map');
      } catch (e) {
        print('agenda error 1');
      }
    }
    print('check this');
    print(mapGetAgenda);
    return mapGetAgenda;
  }

  Future<Map<String, dynamic>> getEvent(
      String? eventName, String? eventCode) async {
    print('go into fetch event data api');
    Map<String, dynamic> mapGetEvent = {};

    final queryParameters = {
      'event_name': eventName,
      'event_code': eventCode,
    }.map((key, value) => MapEntry(key, value.toString()));

    print('token in api');
    print(token);
    http.Response response = await http.get(
      Uri.https(
        'api.fronthaus.com',
        '/api/v1/event',
        queryParameters,
      ),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch event data api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('agenda error 1');
      }
    }
    mapGetEvent = jsonDecode(response.body);
    return mapGetEvent;
  }

  Future<Map<String, dynamic>> getMap() async {
    print('go into fetch Map data api');

    Map<String, dynamic> mapGetMap = {};

    http.Response response = await http.get(
      Uri.https(
        'api.fronthaus.com',
        '/api/v1/event/' + eventCode + '/map',
      ),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch Map data api http.response pass');

    print(response.body);
    if (response.statusCode == 200) {
      try {
        mapGetMap = jsonDecode(response.body) as Map<String, dynamic>;

        print('successfully map');
      } catch (e) {
        print('agenda error 1');
      }
    }
    print(mapGetMap.runtimeType);
    return mapGetMap;
  }

  Future<Map<String, dynamic>> getSponsors() async {
    print('go into fetch sponsors api');
    Map<String, dynamic> mapGetSponsors = {};
    final uri = baseUrl + '/event/' + eventCode + '/sponsors';
    print(eventCode);
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch sponsors api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        mapGetSponsors = jsonDecode(response.body);

        print('successfully map');
      } catch (e) {
        print('agenda error 1');
      }
    }
    return mapGetSponsors;
  }

  Future<Map<String, dynamic>> getSpeakers() async {
    print('go into fetch Speakers api');
    Map<String, dynamic> mapGetSpeakers = {};
    final uri = baseUrl + '/event/' + eventCode + '/speakers';
    print(eventCode);
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch Speakers api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Speakers error 1');
      }
    }
    mapGetSpeakers = jsonDecode(response.body);
    return mapGetSpeakers;
  }

  Future<Map<String, dynamic>> getSpeaker(String speakerId) async {
    print('go into fetch Speaker api');
    Map<String, dynamic> mapGetSpeaker = {};
    final uri = baseUrl + '/event/' + eventCode + '/speakers/' + speakerId;
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch Speaker api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Speaker error 1');
      }
    }
    mapGetSpeaker = jsonDecode(response.body);
    return mapGetSpeaker;
  }

  Future<Map<String, dynamic>> getSessions() async {
    print('go into fetch Sessions api');
    Map<String, dynamic> mapGetSessions = {};
    final uri = baseUrl + '/event/' + eventCode + '/sessions';

    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch Sessions api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Sessions error 1');
      }
    }
    mapGetSessions = jsonDecode(response.body);
    return mapGetSessions;
  }

  Future<Map<String, dynamic>> getSession(String sessionId) async {
    print('go into fetch Session api');
    Map<String, dynamic> mapGetSession = {};
    final uri = baseUrl + '/event/' + eventCode + '/sessions/' + sessionId;
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch Session api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Session error 1');
      }
    }
    mapGetSession = jsonDecode(response.body);
    return mapGetSession;
  }

  Future<Map<String, dynamic>> getUserBookedSessions() async {
    print('go into fetch getUserBookedSessions api');
    Map<String, dynamic> mapGetBookedSessions = {};
    final uri = baseUrl + '/' + userId + '/booked_sessions';
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch getUserBookedSessions api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('getUserBookedSessions error 1');
      }
    }
    mapGetBookedSessions = jsonDecode(response.body);
    return mapGetBookedSessions;
  }

  Future<Map<String, dynamic>> bookPackage(String packageId) async {
    print('go into bookPackage api');
    Map<String, dynamic> mapBookPackage = {};
    final uri =
        baseUrl + '/' + userId + '/sessionsPackage/' + packageId + '/booking';

    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch Sessions api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Sessions error 1');
      }
    }
    mapBookPackage = jsonDecode(response.body);
    return mapBookPackage;
  }

  Future<Map<String, dynamic>> cancelPackageBooking(String packageId) async {
    print('go into cancelPackageBooking api');
    Map<String, dynamic> mapcancelPackageBooking = {};
    final uri = baseUrl +
        '/' +
        userId +
        '/sessionsPackage/' +
        packageId +
        '/cancelBooking';

    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Sessions error 1');
      }
    }
    mapcancelPackageBooking = jsonDecode(response.body);
    return mapcancelPackageBooking;
  }

  Future<Map<String, dynamic>> showParticulars() async {
    print('go into showParticulars api');
    Map<String, dynamic> mapShowParticulars = {};
    final uri = baseUrl + '/' + userId + '/particulars';

    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print('fetch Sessions api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Sessions error 1');
      }
    }
    mapShowParticulars = jsonDecode(response.body);
    return mapShowParticulars;
  }

  Future<Map<String, dynamic>> updateParticulars(
    String title,
    String first_name,
    String last_name,
    String hospital_institution,
    String mcr_snb_number,
    String country,
    String profession,
    String dietary_restrictions,
  ) async {
    print('go into updateParticulars api');
    Map<String, dynamic> mapUpdateParticulars = {};
    final uri = baseUrl + '/' + userId + '/updateParticulars';

    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: jsonEncode({
        'title': title,
        'first_name': first_name,
        'last_name': last_name,
        'hospital_institution': hospital_institution,
        'mcr_snb_number': mcr_snb_number,
        'country': country,
        'profession': profession,
        'dietary_restrictions': dietary_restrictions,
      }),
    );
    print('fetch Sessions api http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Sessions error 1');
      }
    }
    mapUpdateParticulars = jsonDecode(response.body);
    return mapUpdateParticulars;
  }

  Future<Map<String, dynamic>> getUserRegisteredEvents() async {
    print('go into getUserRegisteredEvents api');
    Map<String, dynamic> mapGetUserRegisteredEvents = {};
    print('CHECK THIS');
    print(userId);
    final uri = baseUrl + '/' + userId + '/registeredEvents';

    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Sessions error 1');
      }
    }
    mapGetUserRegisteredEvents = jsonDecode(response.body);
    return mapGetUserRegisteredEvents;
  }

  /*
  get world time
  from http://worldtimeapi.org/timezones
  */
  Future<Map<String, dynamic>> worldTimeApi() async {
    print('go into  worldTimeApi api');
    Map<String, dynamic> mapWorldTimeApi = {};
    final uri = 'http://worldtimeapi.org/api/timezone/Asia/Singapore';

    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    print('WorldTimeApi http.response pass');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        print('successfully map');
      } catch (e) {
        print('Sessions error 1');
      }
    }
    mapWorldTimeApi = jsonDecode(response.body);
    return mapWorldTimeApi;
  }
}
