class ReportModel {
  List<CategoryTrans>? categoryTrans;

  ReportModel.fromJson(Map<String, dynamic> json) {
    if (json['category_trans'] != null) {
      categoryTrans = <CategoryTrans>[];
      json['category_trans'].forEach((v) {
        categoryTrans!.add(new CategoryTrans.fromJson(v));
      });
    }
  }
}

class CategoryTrans {
  int? rN;
  String? categoryName;
  String? dealingNum;
  String? dealingDt;
  String? dealingName;
  double? quantity;
  double? previousBalance;
  double? balance;

  CategoryTrans.fromJson(Map<String, dynamic> json) {
    rN = json['RN'];
    categoryName = json['category_name'];
    dealingNum = json['dealing_num'];
    dealingDt = json['dealing_dt'];
    dealingName = json['dealing_name'];
    quantity = json['quantity'];
    previousBalance = json['previous_balance'];
    balance = json['balance'];
  }
}
