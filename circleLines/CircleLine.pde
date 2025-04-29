class CircleLine
{
  float _theta;
  float _radius;
  float _noiseValueForOmega;
  float _noiseValueForDeltaRadius;
  final color _color;
  
  CircleLine(float theta, color c)
  {
    _theta = theta;
    _radius = width / 2;
    _noiseValueForOmega = random(10);
    _noiseValueForDeltaRadius = random(10);
    _color = c;
  }
  
  void display()
  {
    // 円周上の点と、反対の点を結ぶ
    float x = _radius * cos(_theta) + width / 2;
    float y = _radius * sin(_theta) + height / 2;
    float ox = _radius * cos(_theta + PI) + width / 2;
    float oy = _radius * sin(_theta + PI) + height / 2;
    stroke(_color, 255);
    noFill();
    line(x, y, ox, oy);
    
    final float MaxOmega = PI / 50;
    float omega = noise(_noiseValueForOmega) * MaxOmega - MaxOmega / 2;
    _noiseValueForOmega += 0.1;
    _theta += omega;
    
    final float MaxDeltaRadius = width / 2;
    _radius = noise(_noiseValueForDeltaRadius) * MaxDeltaRadius;
    _noiseValueForDeltaRadius += 0.1;
  }
}
