ArrayList<RotatingText> g_texts = new ArrayList<RotatingText>();

void setup()
{
  // X← Y↓ Z↑
  size(1024, 1024, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
  
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  
  g_texts.add(new RotatingText("Hello world", 150, random(2 * PI), -PI/200, 0, color(255, 0, 0)));
  g_texts.add(new RotatingText("ハローワールド", 120, random(2 * PI), -PI/150, PI/8, color(0, 0, 255)));
  g_texts.add(new RotatingText("Hello world", 100, random(2 * PI), -PI/100, PI/8, color(255)));
}

void draw()
{
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  camera(0, 0, -300, 0, 0, 0, 0, 1, 0);
  
  background(0);
  
  for (RotatingText t : g_texts)
  {
    t.update();
    t.display();
  }
}
