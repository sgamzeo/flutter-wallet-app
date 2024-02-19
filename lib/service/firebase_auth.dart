import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<bool> checkPassword(String email, String enteredPassword) async {
    try {
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        // E-posta adresine ait kullanıcı var, şimdi şifreyi kontrol edelim
        String password = querySnapshot.docs.first['password'];
        return enteredPassword == password;
      } else {
        // E-posta adresine ait kullanıcı bulunamadı
        return false;
      }
    } catch (e) {
      print('Şifre sorgusu hatası: $e');
      return false;
    }
  }

  Future<bool> checkEmailExists(String email) async {
    try {
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: email).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('E-posta sorgusu hatası: $e');
      return false;
    }
  }


//   Future<void> signUpUser({
//   required String name,
//   required String surname,
//   required String identityNo,
//   required String phoneNumber,
// }) async {
//   try {
//     await usersCollection.add({
//       'name': name,
//       'surname': surname,
//       'identityNo': identityNo,
//       'phoneNumber': phoneNumber, // Yeni parametre
//     });
//     print('Kullanıcı başarıyla kaydedildi!');
//   } catch (e) {
//     print('Kullanıcı kaydı sırasında bir hata oluştu: $e');
//     throw Exception('Kullanıcı kaydı başarısız oldu.');
//   }
// }

// }


class FirebaseAuthService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference walletsCollection =
      FirebaseFirestore.instance.collection('wallets'); // Cüzdanlar koleksiyonunu tanımla

  Future<void> signUpUser({
    required String name,
    required String surname,
    required String identityNo,
  }) async {
    try {
      DocumentReference userRef = await usersCollection.add({
        'name': name,
        'surname': surname,
        'identityNo': identityNo,
      });

      // Kullanıcı oluşturulduğunda bir cüzdan oluştur
      await walletsCollection.add({
        'userId': userRef.id, // Kullanıcı kimliğine atıfta bulun
        // Diğer cüzdan özelliklerini ekle
      });

      print('Kullanıcı ve cüzdan başarıyla kaydedildi!');
    } catch (e) {
      print('Kullanıcı ve cüzdan kaydı sırasında bir hata oluştu: $e');
      throw Exception('Kullanıcı ve cüzdan kaydı başarısız oldu.');
    }
  }
}



