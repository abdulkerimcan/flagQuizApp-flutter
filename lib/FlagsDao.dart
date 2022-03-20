import 'package:flag_quiz_app/DatabaseHelper.dart';
import 'package:flag_quiz_app/Flags.dart';

class FlagsDao {


  Future<List<Flags>> getRandomly10() async {

    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 10");
    return List.generate(maps.length, (i) {
      var row = maps[i];

      return Flags(row["bayrak_id"],row["bayrak_ad"],row["bayrak_resim"]);
    });
  }


  Future<List<Flags>> getRandomly3(int bayrak_id) async {

    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id ORDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (i) {
      var row = maps[i];

      return Flags(row["bayrak_id"],row["bayrak_ad"],row["bayrak_resim"]);
    });
  }
}