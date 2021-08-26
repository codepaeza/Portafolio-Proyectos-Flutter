class TotAles {
  String id;
  String _item;
  String _descripcion;
  String _unidad;
  String _cantidad_total;
  String _vr_uni_pgy_usd;
  String _vr_tot_pgy_usd;


  TotAles(this.id, this._item, this._descripcion, this._unidad, this._cantidad_total, this._vr_uni_pgy_usd, this._vr_tot_pgy_usd);


  String get item => _item;
  String get descripcion => _descripcion;
  String get unidad => _unidad;
  String get cantidad_total => _cantidad_total;
  String get vr_uni_pgy_usd => _vr_uni_pgy_usd;
  String get vr_tot_pgy_usd => _vr_tot_pgy_usd;


  TotAles.fromMap(dynamic obj) {
    this.id = obj['id'];
    this._item = obj['item'];
    this._descripcion = obj['descripcion'];
    this._unidad = obj['unidad'];
    this._cantidad_total = obj['cantidad_total'];
    this._vr_uni_pgy_usd = obj['vr_uni_pgy_usd'];
    this._vr_tot_pgy_usd = obj['vr_tot_pgy_usd'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['item'] = _item;
    map['descripcion'] = _descripcion;
    map['unidad'] = _unidad;
    map['cantidad_total'] = _cantidad_total;
    map['vr_uni_pgy_usd'] = _vr_uni_pgy_usd;
    map['vr_tot_pgy_usd'] = _vr_tot_pgy_usd;
    return map;

  }

}