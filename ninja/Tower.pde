class Tower
{
  static final float towerHeight = 15;
  static final float baseRadius = 15;
  
  void display()
  {
    pushMatrix();
    
    translate(0, -towerHeight / 2, 0);
    
    fill(192);
    stroke(0);
    pillar(towerHeight, 0, baseRadius);
    
    popMatrix();
  }
}
