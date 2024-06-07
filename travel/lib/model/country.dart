class country
{
  String name,backGround,foreGround;
  country({required this.backGround,required this.foreGround,required this.name});
}


List<country> countries=[
  country(backGround: 'assets/images/japan_backImage.png', foreGround: 'assets/images/japan_frontImage.png', name: 'Japan'),
  country(backGround: 'assets/images/kuala_lumpur_backImage.png', foreGround:  'assets/images/kuala_lumpur_frontImage.png', name: 'Kuala lumpur'),
  country(backGround:'assets/images/paris_backImage.png', foreGround:  'assets/images/paris_frontImage.png', name: 'Paris'),
  country(backGround: 'assets/images/rome_backImage.png', foreGround:  'assets/images/rome_frontImage.png', name: 'Rome'),
  country(backGround:'assets/images/singapore_backImage.png', foreGround:  'assets/images/singapore_frontImage.png', name: 'Singapore'),
  country(backGround:'assets/images/sydney_backImage.png', foreGround:  'assets/images/sydney_frontImage.png', name: 'Sydney'),
  country(backGround:'assets/images/thailand_backImage.png', foreGround:  'assets/images/thailand_frontImage.png', name: 'Thailand'),
  country(backGround:'assets/images/egypt.jpg', foreGround:  'assets/images/egyptback.png', name: 'Egypt'),
];