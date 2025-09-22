class Pri3 extends Primitive
{
  Pri3(PVector pos, PVector vel, float dAngle)
  {
    // float hcRadius, PVector pos, PVector vel, float dAngle
    super(300, pos, vel, dAngle);
  }
  
  @Override
  public void display()
  {
    noStroke();
    fill(128, 128, 128);
    circle(_position.x, _position.y, 2 * _hitCircleRadius);
    fill(64, 64, 64);
    circle(_position.x, _position.y, _hitCircleRadius);
  }
}
