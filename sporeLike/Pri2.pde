class Pri2 extends Primitive
{
  Pri2(PVector pos, PVector vel, float dAngle)
  {
    // float hcRadius, PVector pos, PVector vel, float dAngle
    super(60, pos, vel, dAngle);
  }
  
  @Override
  public void display()
  {
    float side = _hitCircleRadius * cos(PI/4) * 2;
    
    pushMatrix();
    translate(_position.x, _position.y);
    rotate(_angle);
    
    noFill();
    stroke(0, 255, 255);
    square(-side/2, -side/2, side);
    
    popMatrix();
  }
}
