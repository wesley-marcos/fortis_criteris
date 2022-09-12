import 'dart:convert';

class DataModel{
  final String id;
  final String nome;
  final String peso;
  final String nLinhas;
  final String nColunas;
  final List<String>? valores;

  DataModel({
    required this.id,
    required this.nome,
    required this.peso,
    required this.nLinhas,
    required this.nColunas,
    required this.valores,
  });

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'nome': nome,
      'peso' : peso,
      'nLinhas' : nLinhas,
      'nColunas' : nColunas,
      'valores' : valores,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      nome: map['nome'] ?? '',
      peso: map["peso"] ?? '',
      nLinhas: map['nLinhas'] ?? '',
      nColunas: map['nColunas'] ?? '',
      valores : map['valores'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));
}