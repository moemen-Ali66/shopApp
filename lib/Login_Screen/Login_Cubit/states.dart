abstract class ShopLoginStates {}

class ShopLoginInitialStates extends ShopLoginStates{}

class ShopLoginSuccessStates extends ShopLoginStates{}

class ShopLoginLoadingStates extends ShopLoginStates{}

class ChangePasswordStates extends ShopLoginStates{}

class ShopLoginErrorStates extends ShopLoginStates{
  final String Error;

  ShopLoginErrorStates(this.Error);
}