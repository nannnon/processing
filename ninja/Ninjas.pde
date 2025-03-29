class Nin
{
  PVector _pos;
  float _theta;
  color _color;
  
  final float tSize = 0.8;
  
  Nin(PVector pos, float theta)
  {
    _pos = pos;
    _theta = theta;
    _color = color(random(256), random(256), random(256));
  }
  
  void update()
  {
    final float r = -0.03;
    _pos.x += r * cos(_theta);
    _pos.z += r * sin(_theta);
    _pos.y += r;
  }
  
  void display()
  {
    displayLetter('忍', -tSize);
    displayLetter('者', 0);
  }
  
  void displayLetter(char letter, float addY)
  {
    pushMatrix();
    
    translate(_pos.x, _pos.y + addY, _pos.z);
    rotateY(PI / 2 - _theta);
    
    textSize(tSize);
    fill(_color);
    text(letter, 0, 0, 0);
    
    popMatrix();
  }
}

class Ninjas
{
  ArrayList<Nin> _nins = new ArrayList<Nin>();
  int _counter = 0;

  void addNins()
  {
    final int num = 20;
    for (int i = 0; i < num; ++i)
    {
      float theta = float(i) / num * TWO_PI;
      float x = Tower.baseRadius * cos(theta);
      float z = Tower.baseRadius * sin(theta);
      float y = 0;
      
      _nins.add(new Nin(new PVector(x, y, z), theta));
    }
  }
  
  void update()
  {
    for (int i = _nins.size() - 1; i >= 0; --i)
    {
      Nin n = _nins.get(i);
      n.update();
      
      if (n._pos.y <= -Tower.towerHeight)
      {
        _nins.remove(i);
      }
    }
    
    if (_counter % 50 == 0)
    {
      addNins();
    }
    ++_counter;
  }
  
  void display()
  {
    for (Nin n : _nins)
    {
      n.display();
    }
  }
}
