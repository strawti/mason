import 'dart:convert';

class PaginationModel<T> {
  T? data;
  final int totalItems;
  final int itemCount;
  final int itemsPerPage;
  final int totalPages;
  final int currentPage;
  PaginationModel({
    required this.data,
    required this.totalItems,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
  });

  PaginationModel<T> copyWith({
    T? data,
    int? totalItems,
    int? itemCount,
    int? itemsPerPage,
    int? totalPages,
    int? currentPage,
  }) {
    return PaginationModel<T>(
      data: data ?? this.data,
      totalItems: totalItems ?? this.totalItems,
      itemCount: itemCount ?? this.itemCount,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'totalItems': totalItems,
      'itemCount': itemCount,
      'itemsPerPage': itemsPerPage,
      'totalPages': totalPages,
      'currentPage': currentPage,
    };
  }

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel<T>(
      data: map['data'],
      totalItems: map['totalItems']?.toInt() ?? 0,
      itemCount: map['itemCount']?.toInt() ?? 0,
      itemsPerPage: map['itemsPerPage']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
      currentPage: map['currentPage']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationModel.fromJson(String source) =>
      PaginationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaginationModel(totalItems: $totalItems, itemCount: $itemCount, itemsPerPage: $itemsPerPage, totalPages: $totalPages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaginationModel &&
        other.totalItems == totalItems &&
        other.itemCount == itemCount &&
        other.itemsPerPage == itemsPerPage &&
        other.totalPages == totalPages &&
        other.currentPage == currentPage;
  }

  @override
  int get hashCode {
    return totalItems.hashCode ^
        itemCount.hashCode ^
        itemsPerPage.hashCode ^
        totalPages.hashCode ^
        currentPage.hashCode;
  }
}
