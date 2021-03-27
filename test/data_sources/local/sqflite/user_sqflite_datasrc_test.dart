import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template/app/data/data_sources/local/abstract/IUserLocalDataSrc.dart';
import 'package:template/app/data/data_sources/local/concrete/sqflite/user_sources/user_sqflite_local_datasrc.dart';
import 'package:template/app/data/models/user.dart';

class ExampleDataSrcMock extends Mock implements UserSqfliteDataSource {}

void main() {

  IUserLocalDataSrc userLocalDataSrc;

  final exampleList = <User>[
    User(userId: '1', userName: "Lorem"),
    User(userId: '2', userName: "Ipsum"),
  ];

  setUp(() {
    userLocalDataSrc = ExampleDataSrcMock();
  });

  test('should return examples data', () async {
    when(userLocalDataSrc.getAll())
        .thenAnswer((_) => Future.value(exampleList));

    final result = await userLocalDataSrc.getAll();
    expect(result, exampleList);

  });

  test('should return example whose id is 1', () async {
    when(userLocalDataSrc.get('1'))
        .thenAnswer((_) => Future.value(exampleList[0]));

    final result = await userLocalDataSrc.get('1');
    expect(result, exampleList[0]);

  });

}
