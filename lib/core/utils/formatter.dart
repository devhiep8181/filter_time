// ignore_for_file: non_constant_identifier_names

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class Formatter {
  static final _instance = Formatter._internal();
  Formatter._internal();

  factory Formatter() => _instance;

  final _productPrice = NumberFormat.decimalPattern('en_us');
  final _longNumberGroup = NumberFormat("###,###,###,###", "en_US");
  final _yyyyMmDD_hHmMsS = DateFormat('yyyy-MM-dd HH:mm:ss');
  // final _hHMmSs_DdMmYyyy = DateFormat('HH:mm:ss dd-MM-yyyy');
  final _ddMmYyyy = DateFormat('dd/MM/yyyy HH:mm');
  final _hhMmSs = DateFormat('HH:mm:ss');
  final _yyyyMmDd = DateFormat('yyyy-MM-dd');

  String vnd(double number, {String unit = ''}) {
    return '${_productPrice.format(number)} đ${unit.isEmpty ? '' : ' / $unit'}';
  }

  String latLng(LatLng latLng) {
    return '${latLng.longitude.toStringAsFixed(5)} & ${latLng.latitude.toStringAsFixed(5)}';
  }

  DateTime dateTimeFromYyyyMmDDhHmMsS(String inputString) {
    return _yyyyMmDD_hHmMsS.parse(inputString);
  }

  DateTime dateTimeFromYyyyMmDD(String inputString) {
    return _yyyyMmDd.parse(inputString);
  }

  DateTime dateTimeFromHhMmSs(String inputString) {
    return _hhMmSs.parse(inputString);
  }

  String dateTimeToYyyyMmDdTHhMmSsSsssZ(DateTime dateTime) {
    final yearStr = dateTime.year.toString().padLeft(4, '0');
    final monthStr = dateTime.month.toString().padLeft(2, '0');
    final dayStr = dateTime.day.toString().padLeft(2, '0');
    final hourStr = dateTime.hour.toString().padLeft(2, '0');
    final minuteStr = dateTime.minute.toString().padLeft(2, '0');
    final secondStr = dateTime.second.toString().padLeft(2, '0');
    return '$yearStr-$monthStr-${dayStr}T$hourStr:$minuteStr:$secondStr.000Z';
  }

  String dateTimeToYyyyMmDd(DateTime dateTime) {
    final yearStr = dateTime.year.toString().padLeft(4, '0');
    final monthStr = dateTime.month.toString().padLeft(2, '0');
    final dayStr = dateTime.day.toString().padLeft(2, '0');
    return '$yearStr/$monthStr/$dayStr';
  }

  String dateTimeToDdMmYyyy(DateTime dateTime) {
    final yearStr = dateTime.year.toString().padLeft(4, '0');
    final monthStr = dateTime.month.toString().padLeft(2, '0');
    final dayStr = dateTime.day.toString().padLeft(2, '0');
    return '$dayStr/$monthStr/$yearStr';
  }

  String dateTimeToDdMmYyyyParameter(DateTime dateTime) {
    final yearStr = dateTime.year.toString().padLeft(4, '0');
    final monthStr = dateTime.month.toString().padLeft(2, '0');
    final dayStr = dateTime.day.toString().padLeft(2, '0');
    return '$yearStr-$monthStr-$dayStr';
  }

  String dateTimeToDdMmYyyy_HhMmSs(DateTime dateTime) {
    final hourStr = dateTime.hour.toString().padLeft(2, '0');
    final minuteStr = dateTime.minute.toString().padLeft(2, '0');
    final secondStr = dateTime.second.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr:$secondStr ${dateTimeToDdMmYyyy(dateTime)}';
  }

  String dateTimeToHhMmSs(DateTime dateTime) {
    final hourStr = dateTime.hour.toString().padLeft(2, '0');
    final minuteStr = dateTime.minute.toString().padLeft(2, '0');
    final secondStr = dateTime.second.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr:$secondStr';
  }

  String yyyyMmDD_hHmMsS_to_hHMmSs_DdMmYyyy(String dateTimeString) {
    try {
      final dateTime = _yyyyMmDD_hHmMsS.parse(dateTimeString);
      return dateTimeToDdMmYyyy_HhMmSs(dateTime);
    } catch (_) {
      return dateTimeString;
    }
  }

  String yyyyMmDD_hHmMsS_to_hHMmSs(String dateTimeString) {
    try {
      final dateTime = _yyyyMmDD_hHmMsS.parse(dateTimeString);
      return dateTimeToHhMmSs(dateTime);
    } catch (_) {
      return dateTimeString;
    }
  }

  String dateTimeToRegularString(DateTime dateTime) {
    return _ddMmYyyy.format(dateTime);
  }

  DateTime dateTimeFromRegularString(String string) {
    return _ddMmYyyy.parse(string);
  }

  String groupLongNumber(num number) {
    return _longNumberGroup.format(number);
  }
}
