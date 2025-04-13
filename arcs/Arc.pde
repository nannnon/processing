class Arc
{
  float _theta;
  final float _omega;
  final float _radiusInside;
  final float _radiusOutside;
  final int _bandsNum;
  ArrayList<Integer> _bandColors;
  
  Arc(float omega, float r0, float r1, int bandsNum)
  {
    _theta = 0;
    _omega = omega;
    _radiusInside = r0;
    _radiusOutside = r1;
    _bandsNum = bandsNum;
    
    _bandColors = new ArrayList<Integer>();
    for (int i = 0; i < _bandsNum; ++i)
    {
      _bandColors.add(color(i * 1.0 / _bandsNum, 1, 1));
    }
  }
  
  void update()
  {
    _theta += _omega;
  }
  
  void display()
  {
    stroke(0);
    
    // まず円弧を描く
    float step = TWO_PI / _bandsNum;
    for (int i = 0; i < _bandsNum; ++i)
    {
      pushMatrix();
      
      fill(_bandColors.get(i));
      
      translate(width/2, height/2);
      rotate(_theta);
      
      float start = i * step;
      float stop = (i + 1) * step;
      arc(0, 0, 2*_radiusOutside, 2*_radiusOutside, start, stop);
      
      popMatrix();
    }
    
    // 内側に背景色の円を描く
    fill(g_backgroundColor);
    ellipse(width/2, height/2, 2*_radiusInside, 2*_radiusInside);
  }
}
