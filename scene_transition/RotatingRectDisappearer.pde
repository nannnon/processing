class RotatingRectDisappearer
{
  final float DeltaScale = -0.01;
  final float Omega = PI / 10;
  
  final int _x;
  final int _y;
  final PImage _image;
  float _scale;  
  float _theta;
  boolean _startDisappearing;
  
  RotatingRectDisappearer(int x, int y, PImage img)
  {
    _x = x;
    _y = y;
    _image = img;
    _scale = 1;
    _theta = 0;
    _startDisappearing = false;
  }
  
  void startDisappearing()
  {
    _startDisappearing = true;
  }
  
  void display()
  {
    if (!_startDisappearing)
    {
      image(_image, _x, _y);
    }
    else
    {
      if (_scale > 0)
      {
        pushMatrix();
        translate(_x + _image.width / 2.0, _y + _image.height / 2.0);
        scale(_scale);
        rotate(_theta);
        image(_image, -_image.width / 2.0, -_image.height / 2.0);
        popMatrix();
        
        _scale += DeltaScale;
        _theta += Omega;
      }
    }
  }
}
