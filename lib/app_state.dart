import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _ServerLink = prefs.getString('ff_ServerLink') ?? _ServerLink;
    _MessageFromAddress =
        prefs.getString('ff_MessageFromAddress') ?? _MessageFromAddress;
    _MessageToAddress =
        prefs.getString('ff_MessageToAddress') ?? _MessageToAddress;
    _PollPeriod = prefs.getInt('ff_PollPeriod') ?? _PollPeriod;
    _PollingMode = prefs.getBool('ff_PollingMode') ?? _PollingMode;
    _defaultServerLink =
        prefs.getString('ff_defaultServerLink') ?? _defaultServerLink;
    _defaultMessage = prefs.getString('ff_defaultMessage') ?? _defaultMessage;
  }

  SharedPreferences prefs;

  String _ServerLink = 'https://nexus.deltamatrix.org:8243';
  String get ServerLink => _ServerLink;
  set ServerLink(String _value) {
    _ServerLink = _value;
    prefs.setString('ff_ServerLink', _value);
  }

  String _MessageFromAddress = '';
  String get MessageFromAddress => _MessageFromAddress;
  set MessageFromAddress(String _value) {
    _MessageFromAddress = _value;
    prefs.setString('ff_MessageFromAddress', _value);
  }

  String _MessageToAddress = '';
  String get MessageToAddress => _MessageToAddress;
  set MessageToAddress(String _value) {
    _MessageToAddress = _value;
    prefs.setString('ff_MessageToAddress', _value);
  }

  int _PollPeriod = 5;
  int get PollPeriod => _PollPeriod;
  set PollPeriod(int _value) {
    _PollPeriod = _value;
    prefs.setInt('ff_PollPeriod', _value);
  }

  bool _PollingMode = true;
  bool get PollingMode => _PollingMode;
  set PollingMode(bool _value) {
    _PollingMode = _value;
    prefs.setBool('ff_PollingMode', _value);
  }

  String _defaultServerLink = 'https://nexus.deltamatrix.org:8243';
  String get defaultServerLink => _defaultServerLink;
  set defaultServerLink(String _value) {
    _defaultServerLink = _value;
    prefs.setString('ff_defaultServerLink', _value);
  }

  String _defaultMessage = 'Hello from my Nexus Messenger !';
  String get defaultMessage => _defaultMessage;
  set defaultMessage(String _value) {
    _defaultMessage = _value;
    prefs.setString('ff_defaultMessage', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
