class Pri5 extends Primitive
{
  Pri5(PVector pos, PVector vel, float dAngle)
  {
    // float hcRadius, PVector pos, PVector vel, float dAngle
    super(1600, pos, vel, dAngle);
  }
  
  @Override
  public void display()
  {
    noiseSeed(42);    
    noStroke();
    for (float r = _hitCircleRadius; r > 0; r -= 20)
    {
      fill(noise(r / _hitCircleRadius) * 255);
      circle(_position.x, _position.y, 2 * r);
    }
  }
}
