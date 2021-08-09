import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_tcc/repositories/user_repository.dart';
import 'package:projeto_tcc/repositories/user_repository_mock.dart';

// class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  final UserRepository repository = UserRepositoryMock();

  test("Testando o setUsers", () async{
    final bool result = await repository.setUser(
      "João", DateTime.now(), "m"
    );
    print(result);
    expect(result, true);
  });

}