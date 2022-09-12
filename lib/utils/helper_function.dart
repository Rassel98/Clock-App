import 'package:intl/intl.dart';


String getFormatDate(DateTime dt,String format){
  return DateFormat(format).format(dt);
}