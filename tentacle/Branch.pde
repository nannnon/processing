class Edge
{
  float x;
  float y;
  float theta;
  
  Edge(float x2, float y2, float theta2)
  {
    x = x2;
    y = y2;
    theta = theta2;
  }
}

class Branch
{
  final static int MaxLevel = 10;
  final static float MaxTheta = PI / 4;
  final static float MaxOmega = PI / 120;
  final static float MinOmega = PI / 240;
  final static float MaxWidth = 80;
  final static float MaxHeight = 120;
  final int[] MaxChildrenNum = {10, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4};
  
  final int _level;
  float _x, _y;
  float _baseTheta, _theta, _omega;
  final float _width, _height;
  ArrayList<Branch> _children;
  
  Branch(int level, float x, float y, float baseTheta)
  {
    _level = level;
    _x = x;
    _y = y;
    _baseTheta = baseTheta;
    _theta = 0;
    _omega = random(MinOmega, MaxOmega) * (random(1) < 0.5 ? -1 : 1);
    _width = MaxWidth / (_level + 1);
    _height = MaxHeight / (_level + 1);
    _children = new ArrayList<Branch>();
    
    if (_level == 0)
    {
      int num = MaxChildrenNum[_level];
      float step = TWO_PI / num;
      for (int i = 0; i < num; ++i)
      {
        float theta2 = step * i;
        float x2 = _x + _height * cos(theta2);
        float y2 = _y + _height * sin(theta2);
        _children.add(new Branch(_level + 1, x2, y2, theta2));
      }
    }
    else if (_level <= MaxLevel)
    {
      int num = round(random(1, MaxChildrenNum[_level]));
      for (int i = 0; i < num; ++i)
      {
        Edge edge = getEdge();
        _children.add(new Branch(_level + 1, edge.x, edge.y, edge.theta));
      }
    }
  }
  
  private Edge getEdge()
  {
    float theta2 = _baseTheta + _theta;
    float x2 = _x + _height * cos(theta2);
    float y2 = _y + _height * sin(theta2);
    
    return new Edge(x2, y2, theta2);
  }
  
  void update(float x, float y, float baseTheta)
  {
    _x = x;
    _y = y;
    _baseTheta = baseTheta;
    
    if (_level == 0)
    {
      int num = _children.size();
      float step = TWO_PI / num;
      for (int i = 0; i < num; ++i)
      {
        float theta2 = step * i;
        float x2 = _x + _height * cos(theta2);
        float y2 = _y + _height * sin(theta2);
        _children.get(i).update(x2, y2, theta2);
      }
    }
    else
    {
      _theta += _omega;
      if (_theta < -MaxTheta || _theta > MaxTheta)
      {
        _omega *= -1;
      }
    
      for (Branch b : _children)
      {
        Edge edge = getEdge();
        b.update(edge.x, edge.y, edge.theta);
      }
    }
  }
  
  void display()
  {
    if (_level == 0)
    {
      stroke(0);
      fill(255);
      ellipse(_x, _y, 2 * _height, 2 * _height);
    }
    else
    {
      stroke(0);
      fill(255);
      
      pushMatrix();
      translate(_x, _y);
      rotate(_baseTheta + _theta);
      rect(0, -_width / 2, _height, _width);
      popMatrix();
    }
    
    for (Branch b : _children)
    {
      b.display();
    }
  }
}
