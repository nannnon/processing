ArrayList<TargetLine> lines = new ArrayList<TargetLine>();
int counter = 0;

void setup()
{
  size(512, 512);
  
  lines.add(new TargetLine(0, 0, true));
  lines.add(new TargetLine(width - 1, 0, false));
  lines.add(new TargetLine(0, height - 1, false));
  lines.add(new TargetLine(width - 1, height - 1, true));
  
  for (TargetLine l : lines)
  {
    l.setTarget(width / 2, height / 2);
  }
  
  colorMode(RGB, 1);
  background(0);
}

void draw()
{
  if (counter >= TargetLine.targetTime)
  {
    float x = random(width);
    float y = random(height);
    
    for (TargetLine l : lines)
    {
      l.setTarget(x, y);
    }
    
    counter = 0;
    
    colorMode(RGB, 1);
    noStroke();
    fill(0, 0.5);
    rect(0, 0, width, height);
  }
  else
  {
    for (TargetLine l : lines)
    {
      l.display();
    }
    
    ++counter;
  }
  
  //saveFrame("frames/######.png");
}
