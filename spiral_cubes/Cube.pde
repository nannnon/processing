class Cube
{
  static final float r = 10;
  static final float omegaT = 0.01;
  static final float omegaP = 0.0005;
  static final float cubeSize = 0.5;
  
  float _theta;
  float _phi;
  color _color;
  
  Cube()
  {
    _theta = 0;
    _phi = -PI / 2;
    _color = color(random(256), random(256), random(256));
  }
  
  void update()
  {
    _theta += omegaT;
    _phi += omegaP;
  }
  
  boolean display()
  {
    float x = r * cos(_phi) * cos(_theta);
    float y = r * sin(_phi);
    float z = r * cos(_phi) * sin(_theta);
    
    pushMatrix();
    
    translate(x, y, z);
    fill(_color);
    noStroke();
    box(cubeSize);
    
    popMatrix();
    
    
    if (_phi + omegaP >= PI / 2)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
