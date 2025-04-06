class MyKunoji
{
  final static float Size = 64;
  
  final float _x;
  final float _y;
  float _theta;
  boolean _rotate;
  int _counter;
  int _dir;
  
  MyKunoji(float x, float y)
  {
    _x = x;
    _y = y;
    _theta = int(random(4)) * PI / 2;
    _rotate = false;
    _counter = 0;
    _dir = 0;
  }
  
  void startRotation()
  {
    if (!_rotate)
    {
      _rotate = true;
      _counter = 0;
      int dir = int(random(2));
      _dir = (dir == 0) ? 1 : -1;
    }
  }
  
  void update()
  {
    final int MaxCounter = 50;
    
    if (_rotate)
    {
      float omega = _dir * (PI / 2) / MaxCounter;
      _theta += omega;
      
      ++_counter;
      if (_counter >= MaxCounter)
      {
        _rotate = false;
      }
    }
  }
  
  void display()
  {
    pushMatrix();
    
    translate(_x, _y);
    rotate(_theta);
    
    final float Wide = 10;
    fill(255);
    noStroke();
    rect(-Wide / 2, -Wide / 2, Size / 2 + Wide / 2, Wide);
    rect(-Wide / 2, -Wide / 2, Wide, Size / 2 + Wide);
    rect(-Size / 2, -Wide / 2, Size / 2 + Wide / 2, Wide);
    
    popMatrix();
  }
}
