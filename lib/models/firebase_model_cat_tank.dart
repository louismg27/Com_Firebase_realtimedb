// To parse this JSON data, do
//
//     final catTank = catTankFromJson(jsonString);

import 'dart:convert';

CatTank catTankFromJson(String str) => CatTank.fromJson(json.decode(str));

String catTankToJson(CatTank data) => json.encode(data.toJson());

class CatTank {
  String ntanque;
  String cmdOpenValveIn;
  String cmdOpenValveOut;
  String varNivelAgua;
  String varCaudalIn;
  String varCaudalOut;
  String varSwitchHighNivel;

  CatTank({
    required this.ntanque,
    required this.cmdOpenValveIn,
    required this.cmdOpenValveOut,
    required this.varNivelAgua,
    required this.varCaudalIn,
    required this.varCaudalOut,
    required this.varSwitchHighNivel,
  });

  factory CatTank.fromJson(Map<String, dynamic> json) => CatTank(
    ntanque: json["ntanque"],
    cmdOpenValveIn: json["cmd_open_valve_in"],
    cmdOpenValveOut: json["cmd_open_valve_out"],
    varNivelAgua: json["var_nivel_agua"],
    varCaudalIn: json["var_caudal_in"],
    varCaudalOut: json["var_caudal_out"],
    varSwitchHighNivel: json["var_switch_high_nivel"],
  );

  Map<String, dynamic> toJson() => {
    "ntanque": ntanque,
    "cmd_open_valve_in": cmdOpenValveIn,
    "cmd_open_valve_out": cmdOpenValveOut,
    "var_nivel_agua": varNivelAgua,
    "var_caudal_in": varCaudalIn,
    "var_caudal_out": varCaudalOut,
    "var_switch_high_nivel": varSwitchHighNivel,
  };
}
