import 'package:firebase_database/firebase_database.dart';

class PlanDetails {
   String _Id;
   String _Plan;
   String _Precio;

   PlanDetails(this._Id, this._Plan, this._Precio);

   PlanDetails.map(dynamic obj) {
      this._Id = obj['id'];
      this._Plan = obj['plan'];
      this._Precio = obj['precio'];
   }

   String get Id => _Id;
   String get Plan => _Plan;
   String get Precio => _Precio;

   PlanDetails.fromSnapshot(DataSnapshot snapshot) {
      _Id = snapshot.key;
      _Plan = snapshot.value['plan'];
      _Precio = snapshot.value['precio'];
   }
}


//Clase que recupera los datos de la base de datos en Firebase y los muestra al usuario
/*
class PlanDetails{
   String Id;
   String _Pais;
   String _Departamento;
   String _Ciudad;
   String _Razon;
   String _Direccion;
   String _TelefonoFijo;
   String _Celular;
   String _Whatsapp;
   String _email;
   String _facebook;
   String _instagram;
   String _twitter;
   String _tiktok;
   String _SectorCadena;
   String _Plan;
   String _CantidadPersonas;
   String _DetallePlan;
   String _Precio;
   String _Dia;
   String _HoraInicio;
   String _HoraFin;
   String _Edad;

   //Creación de constructor con todos los campos de la BD de Planes en el repositorio Firebase
   PlanDetails(this.Id, this._Pais, this._Departamento, this._Ciudad, this._Razon, this._Direccion,
       this._TelefonoFijo, this._Celular, this._Whatsapp, this._email, this._facebook, this._instagram,
       this._twitter, this._tiktok, this._SectorCadena, this._Plan, this._CantidadPersonas, this._DetallePlan,
       this._Precio, this._Dia, this._HoraInicio, this._HoraFin, this._Edad
       );

   //Métodos GET para cada uno de los parámetros de la base de datos que están declarados como privados: _parámetro
   String get Pais=>_Pais;
   String get Departamento=>_Departamento;
   String get Ciudad=>_Ciudad;
   String get Razon=>_Razon;
   String get Direccion=>_Direccion;
   String get TelefonoFijo=>_TelefonoFijo;
   String get Celular=>_Celular;
   String get Whatsapp=>_Whatsapp;
   String get email=>_email;
   String get facebook=>_facebook;
   String get instagram=>_instagram;
   String get twitter=>_twitter;
   String get tiktok=>_tiktok;
   String get SectorCadena=>_SectorCadena;
   String get Plan=>_Plan;
   String get CantidadPersonas=>_CantidadPersonas;
   String get DetallePlan=>_DetallePlan;
   String get Precio=>_Precio;
   String get Dia=>_Dia;
   String get HoraInicio=>_HoraInicio;
   String get HoraFin=>_HoraFin;
   String get Edad=>_Edad;

   //Constructor con nombre, llamado fromJson (), que tomará un objeto json  y lo transformará en un mensaje
   PlanDetails.map(dynamic obj){
      this.Id = obj['Id'];
      this._Pais=obj['Pais'];
      this._Departamento=obj['Departamento'];
      this._Ciudad=obj['Ciudad'];
      this._Razon=obj['Razon'];
      this._Direccion=obj['Direccion'];
      this._TelefonoFijo=obj['Telefono_Fijo'];
      this._Celular=obj['Celular'];
      this._Whatsapp=obj['Whatsapp'];
      this._email=obj['Email'];
      this._facebook=obj['Facebook'];
      this._instagram=obj['Instagram'];
      this._twitter=obj['Twitter'];
      this._tiktok=obj['Tiktok'];
      this._SectorCadena=obj['Sector_Cadena'];
      this._Plan=obj['Plan'];
      this._CantidadPersonas=obj['Cantidad_Personas'];
      this._DetallePlan=obj['Detalle_Plan'];
      this._Precio=obj['Precio'];
      this._Dia=obj['Dia'];
      this._HoraInicio=obj['Hora_Inicio'];
      this._HoraFin=obj['Hora_Fin'];
      this._Edad=obj['Edad'];
   }

   //Método que transforma el objeto PlanDetails
   PlanDetails.fromSnapshot(DataSnapshot snapshot){
      Id=snapshot.key;
      _Pais=snapshot.value['Pais'];
      _Departamento=snapshot.value['Departamento'];
      _Ciudad=snapshot.value['Ciudad'];
      _Razon=snapshot.value['Razon'];
      _Direccion=snapshot.value['Direccion'];
      _TelefonoFijo=snapshot.value['Telefono_Fijo'];
      _Celular=snapshot.value['Celular'];
      _Whatsapp=snapshot.value['Whatsapp'];
      _email=snapshot.value['Email'];
      _facebook=snapshot.value['Facebook'];
      _instagram=snapshot.value['Instagram'];
      _twitter=snapshot.value['Twitter'];
      _tiktok=snapshot.value['Tiktok'];
      _SectorCadena=snapshot.value['Sector_Cadena'];
      _Plan=snapshot.value['Plan'];
      _CantidadPersonas=snapshot.value['Cantidad_Personas'];
      _DetallePlan=snapshot.value['Detalle_Plan'];
      _Precio=snapshot.value['Precio'];
      _Dia=snapshot.value['Dia'];
      _HoraInicio=snapshot.value['Hora_Inicio'];
      _HoraFin=snapshot.value['Hora_Fin'];
      _Edad=snapshot.value['Edad'];

   }
}
*/
