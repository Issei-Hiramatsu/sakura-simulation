import '/domain/user_info/user_info.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class UserInfoUseCase {
  UserInfoUseCase({required this.userRepository});
  final IUserInfoRepository userRepository;

  void registerUser({required UserInfo userInfo}) {
    return userRepository.registerUserInfo(userInfo);
  }
}
