class Rotating3DArc
{
  final int ArcResolution = 100;
  
  final PVector _centerPos;
  final float _innerRadius;
  final float _outerRadius;
  final float _startAngle;
  final float _endAngle;
  final color _color;
  float _theta;
  final float _omega;
  
  Rotating3DArc(PVector centerPos, float inR, float outR, float start, float end, color c, float omega)
  {
    _centerPos = centerPos;
    _innerRadius = inR;
    _outerRadius = outR;
    _startAngle = start;
    _endAngle = end;
    _color = c;
    _theta = 0;
    _omega = omega;
  }
  
  void display()
  {
    noStroke();
    fill(_color);
    
    pushMatrix();
    translate(_centerPos.x, _centerPos.y, _centerPos.z);
    rotateY(_theta);
  
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i <= ArcResolution; i++) {
      float t = map(i, 0, ArcResolution, _startAngle, _endAngle);
      float cosT = cos(t);
      float sinT = sin(t);
  
      float xOuter = cosT * _outerRadius;
      float zOuter = sinT * _outerRadius;
      float xInner = cosT * _innerRadius;
      float zInner = sinT * _innerRadius;
  
      // 外周 → 内周の順で追加（TRIANGLE_STRIPの帯）
      vertex(xOuter, 0, zOuter);
      vertex(xInner, 0, zInner);
    }
    endShape();
    
    popMatrix();
    
    _theta += _omega;
  }
}
