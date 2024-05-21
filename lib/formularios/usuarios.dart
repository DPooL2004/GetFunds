import 'package:firebase_auth/firebase_auth.dart';

class Usuarios{
  final FirebaseAuth _fa = FirebaseAuth.instance;

  Future registerUsuario(String correo, String password)async{
    try{
      UserCredential uc = await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: correo, password: password);
      print(uc.user);
      return 3;
    }on FirebaseAuthException catch(e){
      if(e.code=='weak-password'){
        print('El password es debil');
        return 1;
      }else if(e.code == 'email-already-in-use'){
        print('el correo ya existe');
        return 2;
      }
    }catch (e){
      print(e);
      return 0;
    }
  }

  Future loginUsuario(String correo, String password)async{
    if(correo.isNotEmpty && password.isNotEmpty){
      try{
        UserCredential uc = await _fa.signInWithEmailAndPassword(email: correo, password: password);
        final u = uc.user;
        if(u!=null){
          return 1;
        }
      }on FirebaseAuthException catch(e){
        print('Error de Auth: ${e.code}');
        if(e.code=='user-not-found'||e.code=='wrong-password'){
          return 2;
        }
      }catch(e){
        print('error');
      }
    }else{
      print('Correo y Contraseña no pueden estar vacios');
      return 3;
    }
  }
}