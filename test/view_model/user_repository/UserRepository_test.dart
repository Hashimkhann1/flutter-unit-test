import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_practice/model/user_model.dart';
import 'package:unit_test_practice/view_model/user_repository/user_repository.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group("UserRepository -", () {
    group("getUser function -", () {
      /// for getUser success test
      test(
          "given a UserRepository class when getUser function is called and status code is 200 than return UserData model",
          () async {
        /// Arrange
        when(() => mockHTTPClient
                .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")))
            .thenAnswer((invocation) async {
          return Response(
              '''{"id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "address": {
              "street": "Kulas Light",
              "suite": "Apt. 556",
              "city": "Gwenborough",
              "zipcode": "92998-3874",
              "geo": {
              "lat": "-37.3159",
              "lng": "81.1496"
              }
              },
              "phone": "1-770-736-8031 x56442",
              "website": "hildegard.org",
              "company": {
              "name": "Romaguera-Crona",
              "catchPhrase": "Multi-layered client-server neural-net",
              "bs": "harness real-time e-markets"}}''',
              200);});

        /// Act
        final userModelData = await userRepository.getUser();

        /// Assert
        expect(userModelData, isA<UserModel>());
      });

      /// for getUser failed test
      test(
          "given a UserRepository class when getUser function is called and status code is not 200 than an exception should be thrown",
          () async {
        /// Arrange
            when( () => mockHTTPClient.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"))).thenAnswer((invocation) async => Response('{}', 500));
        /// Act
        final userModelData = userRepository.getUser();

        /// Assert
        expect(userModelData, throwsException);
      });
    });
  });
}
