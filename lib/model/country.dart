class country
{
  String name,backGround,foreGround;
  country({required this.backGround,required this.foreGround,required this.name});
}


List<country> countries=[
  country(backGround: 'assets/images/japan_backImage.png', foreGround: 'assets/images/japan_frontImage.png', name: 'japan'),
  country(backGround: 'assets/images/kuala_lumpur_backImage.png', foreGround:  'assets/images/kuala_lumpur_frontImage.png', name: 'kuala lumpur'),
  country(backGround:'assets/images/paris_backImage.png', foreGround:  'assets/images/paris_frontImage.png', name: 'paris'),
  country(backGround: 'assets/images/rome_backImage.png', foreGround:  'assets/images/rome_frontImage.png', name: 'rome'),
  country(backGround:'assets/images/singapore_backImage.png', foreGround:  'assets/images/singapore_frontImage.png', name: 'singapore'),
  country(backGround:'assets/images/sydney_backImage.png', foreGround:  'assets/images/sydney_frontImage.png', name: 'sydney'),
  country(backGround:'assets/images/thailand_backImage.png', foreGround:  'assets/images/thailand_frontImage.png', name: 'thailand'),
  country(backGround:'assets/images/paris_backImage.png', foreGround:  'assets/images/paris_frontImage.png', name: 'paris'),
];