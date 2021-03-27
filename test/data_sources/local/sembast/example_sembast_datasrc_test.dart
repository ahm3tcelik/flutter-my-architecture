import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template/app/data/data_sources/local/abstract/IExampleLocalDataSrc.dart';
import 'package:template/app/data/data_sources/local/concrete/sembast/example_sources/example_sembast_local_datasrc.dart';
import 'package:template/app/data/models/example.dart';

class ExampleDataSrcMock extends Mock implements ExampleSembastDataSource {}

void main() {

  late IExampleLocalDataSrc exampleLocalDataSrc;

  final exampleList = <Example>[
    Example(exampleId: 1, exampleData: "Lorem"),
    Example(exampleId: 2, exampleData: "Ipsum")
  ];

  setUp(() {
    exampleLocalDataSrc = ExampleDataSrcMock();
  });

  test('should return examples data', () async {
    when(exampleLocalDataSrc.getAll())
        .thenAnswer((_) => Future.value(exampleList));

    final List<Example>? result = await exampleLocalDataSrc.getAll();
    expect(result, exampleList);

  });

  test('should return example whose id is 1', () async {
    when(exampleLocalDataSrc.get(1))
        .thenAnswer((_) => Future.value(exampleList[0]));

    final Example? result = await exampleLocalDataSrc.get(1);
    expect(result, exampleList[0]);

  });

}
