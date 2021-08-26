class SolarProjects {
  String id;
  String _cod_proy;
  String _constructor;
  String _ejecutor;
  String _nom_proy;
  String _propietario;
  String _tipo;
  String _item;
  String _descripcion;
  String _unidad;
  String _cantidad_total;


  SolarProjects(this.id, this._cod_proy, this._constructor, this._ejecutor, this._nom_proy, this._propietario,
      this._tipo,this._item, this._descripcion, this._unidad,this._cantidad_total );


  String get cod_proy => _cod_proy;
  String get constructor => _constructor;
  String get ejecutor => _ejecutor;
  String get nom_proy => _nom_proy;
  String get propietario => _propietario;
  String get tipo => _tipo;
  String get item => _item;
  String get descripcion => _descripcion;
  String get unidad => _unidad;
  String get cantidad_total => _cantidad_total;

  SolarProjects.fromMap(dynamic obj) {
    this.id = obj['id'];
    this._cod_proy = obj['cod_proy'];
    this._constructor = obj['constructor'];
    this._ejecutor = obj['ejecutor'];
    this._nom_proy = obj['nom_proy'];
    this._propietario = obj['propietario'];
    this._tipo = obj['tipo'];

    this._item = obj['item'];
    this._descripcion = obj['descripcion'];
    this._unidad = obj['unidad'];
    this._cantidad_total = obj['cantidad_total'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['cod_proy'] = _cod_proy;
    map['constructor'] = _constructor;
    map['ejecutor'] = _ejecutor;
    map['nom_proy'] = _nom_proy;
    map['propietario'] = _propietario;
    map['tipo'] = _tipo;

    map['item'] = _item;
    map['descripcion'] = _descripcion;
    map['unidad'] = _unidad;
    map['cantidad_total'] = _cantidad_total;
    return map;




  }

}