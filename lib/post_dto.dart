// post_dto.dart

// 테이블 용
class PostDTOTable {
  String rank; // 랭킹
  String auiCnt; // 관객수
  String movieNm; // 영화제목
  String openDt; // 개봉일
  // 생성자
  PostDTOTable({
    required this.rank,
    required this.auiCnt,
    required this.movieNm,
    required this.openDt
  });

  factory PostDTOTable.fromJson(dynamic json) => PostDTOTable(
        rank: json["rank"],
        auiCnt: json["audiCnt"],
        movieNm: json["movieNm"],
        openDt: json["openDt"]
      );

  static List<PostDTOTable> fromJsonList(List jsonList) {
    return jsonList.map((json) => PostDTOTable.fromJson(json)).toList();
  }
}
