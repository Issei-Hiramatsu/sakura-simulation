import '../domain/user/user.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class UserUseCase {
  UserUseCase({required this.userRepository});
  final IUserRepository userRepository;

  void registerUser({required User user}) {
    return userRepository.registerUser(user);
  }
}
