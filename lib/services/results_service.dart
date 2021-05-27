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
                "https://lh3.googleusercontent.com/proxy/oYyMQTb6_3ZEbV3Uuxbldqmtija_w3exwNXmd6VNWIZKdAUu7RXP2LGNo9UZd3BW_trjbYrEhGLk0cGuLsy0zN83DFlnzKMi_mo0ij0tlswz5zLWx9BmTyOBR-P0_gu_pA",
          },
          "type": "Badminton",
          "title": "MEN’S SINGLES QUARTERFINALS",
          "description": "INA VS MAS",
          "location": "Mỹ Đình National Stadium",
          "start_date": "2021-12-03 20:00:00",
          "end_date": "2021-12-03 23:00:00",
        }
      ],
      "status": 1,
      "next_page_url": null,
    };

    return _data;
  }
}
