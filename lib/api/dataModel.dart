import 'dart:convert';

class DataModel{
  final int id;
  final String nome;
  final double peso;
  final List<double>? valores;

  DataModel({
    required this.id,
    required this.nome,
    required this.peso,
    required this.valores,
  });

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'nome': nome,
      'peso' : peso,
      'valores' : valores,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      nome: map['nome'] ?? '',
      peso: map["peso"].toDouble(),
      valores : map['valores'].cast<double>(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));
}