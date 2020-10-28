import 'package:bloc/bloc.dart';

// import 'package:barberq/reserveInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barberq/presentation/CustomerList.dart';
class StoredCubit extends Cubit<List<CustomerList>>{
  final databaseReference = Firestore.instance;
  StoredCubit() : super(List<CustomerList>());
  List<String> nameList = [];
 void addlist(value) { 
       if(nameList.indexOf(value.name) == -1){
             nameList.add(value.name);
             state.add(value);
       }
   
  }


 void printlist() {
   for( int i = 0 ; i < state.length ; i++){
          print(nameList[i] + "(from printlist)");
          print(state[i].phone);
   }
 }
 void getCustomer() {
   CustomerList ctm;
    databaseReference
        .collection("customer")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) =>{ 
         ctm = CustomerList(
            f.data["Name"],
            f.data["Phone"],
          ),
        addlist(ctm),
        print(f.data['Phone']),
        print(f.documentID),
      });
    });
  }
 int getnextId() {
    print(state.length);
    return state.length+1;
  }
  String rememberCustomer(String name){
    String thisphone;
      if(nameList.indexOf(name) != -1){
          thisphone = state[nameList.indexOf(name)].phone;
           return thisphone;
      }
      else{
        return null;
      }
  }
}



