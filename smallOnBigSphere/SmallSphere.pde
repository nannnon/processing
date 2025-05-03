class SmallSphere
{
  float _r;
  float _theta;
  float _phi;
  
  SmallSphere(float r, float theta, float phi)
  {
    _r = r;
    _theta = theta;
    _phi = phi;
  }
  
  void setRadius(float r)
  {
    _r = r;
  }
  
  PVector getCoord()
  {
    float x = _r * sin(_theta) * cos(_phi);
    float y = _r * sin(_theta) * sin(_phi);
    float z = _r * cos(_theta);
    
    PVector coord = new PVector(x, y, z);
    return coord;
  }
  
  void display()
  {
    pushMatrix();
    
    PVector coord = getCoord();
    translate(coord.x, coord.y, coord.z);
    
    noStroke();
    fill(255, 128);
    
    final float SmallSphereRadius = 8;
    sphere(SmallSphereRadius);
    
    popMatrix();
  }
}
