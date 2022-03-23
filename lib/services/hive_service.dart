import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Box? box;

  addData(String name, var value) async {
    box = await Hive.openBox(name);
    box!.add(value);
  }

  getData(String name, var key) async {
    Box box = await Hive.openBox(name);
    print(box.values);
    return box.values;
  }

  deleteData(String name) {
    Hive.box(name).clear();
  }
}
