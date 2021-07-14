import '../icon_image_path.dart';

class ResultService {
  static Future<Map<String, dynamic>?> getMatchResultList({
    String? nextPageUrl,
  }) async {
    await Future.delayed(Duration(seconds: 1));

    Map<String, dynamic> _data = {
      "data": [
        {
          "image": {
            "url":
                "https://s.yimg.com/ny/api/res/1.2/yt7LaNWBSKOzBvn6sl3DSw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MA--/https://s.yimg.com/uu/api/res/1.2/vd2HQDq0isE_Uq9LeASIKA--~B/aD01MTI7dz03Njg7YXBwaWQ9eXRhY2h5b24-/https://media.zenfs.com/en/afp.com.au/48761454a4e2160b25520f3664a827da",
          },
          "type": "Para Badminton",
          "title": "MEN’S SINGLES QUARTERFINALS",
          "description": "INA VS MAS",
          "location": "ISA SPORTS CITY",
          "start_date": "2021-12-03 20:00:00",
          "end_date": "2021-12-03 23:00:00",
        }
      ],
      "status": 1,
      "next_page_url": null,
    };

    return _data;
  }

  static Future<Map<String, dynamic>?> getMatchResult() async {
    await Future.delayed(Duration(seconds: 1));

    Map<String, dynamic> _data = {
      "start_time": "2021-12-02 18:00:00",
      "end_time": "2021-12-02 23:00:00",
      "location": "ISA SPORTS CITY",
      "sport": "Badminton",
      "event": "Men's Singles Quarterfinals",
      "galleries": [
        'https://www.globaltimes.cn/Portals/0/attachment/2020/2020-05-20/b35faab5-d681-428b-8868-8532cdbacc3b.jpeg',
        'https://i.ytimg.com/vi/5_YmSE1Vs4w/maxresdefault.jpg',
        'https://static.bangkokpost.com/media/content/20200519/c1_3636952.jpg',
        'https://d3avoj45mekucs.cloudfront.net/rojakdaily/media/iylia/news/ldlcw1.jpg'
      ],
      "type": 0, //0: score (badminton), 1: timing (swimming)
      "total_sets": 5, // null if is timing
      "results": [
        {
          "country_flag": AppImages.malaysia,
          "country_code": "MAS",
          "won_set": 3,
          "scores": [21, 21, 19, 21, null],
          "players_name": ['C.W. Lee'],
        },
        {
          "country_flag": AppImages.indonesia,
          "country_code": "INA",
          "won_set": 1,
          "scores": [17, 18, 21, 19, null],
          "players_name": ['M.C. Gideon'],
        },
      ]
    };

    return _data;
  }
}
