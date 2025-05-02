class CircleLine
{
  float _theta;
  float _radius;
  float _noiseValueForOmega;
  float _noiseValueForDeltaRadius;
  float _noiseValueForCenterX;
  float _noiseValueForCenterY;
  final color _color;
  
  CircleLine(float theta, color c)
  {
    _theta = theta;
    _radius = width / 2;
    _noiseValueForOmega = random(10);
    _noiseValueForDeltaRadius = random(10);
    _noiseValueForCenterX = random(10);
    _noiseValueForCenterY = random(10);
    _color = c;
  }
  
  void display()
  {
    // 円周上の点と、反対の点を結ぶ
    float centerx = width / 2 + noise(_noiseValueForCenterX) * 100 - 50;
    float centery = height / 2 + noise(_noiseValueForCenterY) * 100 - 50;
    _noiseValueForCenterX += 0.01;
    _noiseValueForCenterY += 0.01;
    
    float x = _radius * cos(_theta) + centerx;
    float y = _radius * sin(_theta) + centery;
    float ox = _radius * cos(_theta + PI) + centerx;
    float oy = _radius * sin(_theta + PI) + centery;
    stroke(_color, 60);
    noFill();
    line(x, y, ox, oy);
    
    final float MaxOmega = radians(6);
    float omega = noise(_noiseValueForOmega) * MaxOmega - MaxOmega / 2;
    _noiseValueForOmega += 0.005;
    _theta += omega;
    
    final float MaxDeltaRadius = width;
    _radius = noise(_noiseValueForDeltaRadius) * MaxDeltaRadius + 1;
    _noiseValueForDeltaRadius += 0.005;
  }
}
