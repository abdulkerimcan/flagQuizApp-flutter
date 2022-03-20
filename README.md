# Flag Quiz App by Flutter



## About The Project

I have made a flag quiz application in this project. It is a quiz in the form of 10 questions randomly displaying the flags of more than 30 countries. I kept the country's names and image paths in the database thanks to SQLite. I have created a class called DatabaseHelper to call the database. Thanks to the FlagsDao class, I was able to pull sql queries. <br>

With the following sql query, we can pull 10 different countries in the database. and with this information, we can create a flag object.
```dart
Future<List<Flags>> getRandomly10() async {

    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 10");
    return List.generate(maps.length, (i) {
      var row = maps[i];

      return Flags(row["bayrak_id"],row["bayrak_ad"],row["bayrak_resim"]);
    });
```

There are 4 buttons. 1 is the correct answer and 3 are the wrong answers. I was able to pull this from the database thanks to this sql query.
```dart
Future<List<Flags>> getRandomly3(int bayrak_id) async {

    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id ORDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (i) {
      var row = maps[i];

      return Flags(row["bayrak_id"],row["bayrak_ad"],row["bayrak_resim"]);
    });
  }
```



![image](https://user-images.githubusercontent.com/79968953/159159135-a051aa11-9cfa-47af-b3fc-baa263f3c350.png)
![image](https://user-images.githubusercontent.com/79968953/159159167-19a5c769-f8f8-4d9c-b17b-bab7f52f60ea.png)
![image](https://user-images.githubusercontent.com/79968953/159159200-a79c3c8d-d5a2-4e8a-a461-5c88ec6e928b.png)


