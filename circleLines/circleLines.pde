ArrayList<CircleLine> g_lines = new ArrayList<CircleLine>();

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  for (int i = 0; i < 8; ++i)
  {
    g_lines.add(new CircleLine(random(0, PI), color(random(255), random(255), random(255))));
  }
  
  background(255);
}

void draw()
{
  // だんだん薄くする
  noStroke();
  fill(255, 1);
  rect(0, 0, width, height);
  
  for (CircleLine l : g_lines)
  {
    l.display();
  }
  
  //saveFrame("frames/######.png");
}
