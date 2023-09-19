class MyUser{
  static const String collectionName="Users";
  String id;
  String fName;
  String lName;
  String userName;
  String email;

  MyUser({ required this.id, required this.fName, required this.lName, required this.userName, required this.email});

  MyUser.fromJson(Map<String ,dynamic>Json) :this(
    id: Json["id"],
    fName:Json["fName"] ,
    lName: Json["lName"],
    userName:Json["userName"] ,
    email:Json["email"]
  );
  Map<String ,dynamic> toJson(){
    return{
      "id": id,
      "fName":fName ,
      "lName": lName,
      "userName":userName ,
      "email":email
    };
  }
}