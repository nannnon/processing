class Pri0 extends Primitive
{
  Pri0(PVector pos, PVector vel)
  {
    // float hcRadius, PVector pos, PVector vel, float dAngle
    super(3, pos, vel, 0);
  }
  
  @Override
  public void display()
  {
    noFill();
    stroke(255, 0, 0);
    circle(_position.x, _position.y, 2 * _hitCircleRadius);
    
    stroke(0, 255, 0);
    float theta = atan2(_velocity.y, _velocity.x);
    float dx = 2 * _hitCircleRadius * cos(theta);
    float dy = 2 * _hitCircleRadius * sin(theta);
    line(_position.x, _position.y, _position.x + dx, _position.y + dy);
  }
}
