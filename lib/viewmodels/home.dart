class BannerItem {
  String id;
  String imageUrl;

  BannerItem({required this.id, required this.imageUrl});

  factory BannerItem.formJSON(Map<String, dynamic> json) {
    return BannerItem(id: json["id"] ?? "", imageUrl: json["imgUrl"] ?? "");
  }
}

// {
// 		"id": "1181622001",
// 		"name": "气质女装",
// 		"picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
// 		"children": [{
// 			"id": "1191110001",
// 			"name": "半裙",
// 			"picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
// 			"children": null,
// 			"goods": null
// 		}, {
// 			"id": "1191110002",
// 			"name": "衬衫",
// 			"picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
// 			"children": null,
// 			"goods": null
// 		}],
// 		"goods": null
// 	}

// 分类item
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] != null
          ? (json["children"] as List)
                .map((e) => CategoryItem.fromJSON(e as Map<String, dynamic>))
                .toList()
          : null,
    );
  }
}
