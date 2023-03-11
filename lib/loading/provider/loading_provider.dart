
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<AccessToken?> accesstoken() async{
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
    return accessToken;
}