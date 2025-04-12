ArrayList<RotatingText> g_texts = new ArrayList<RotatingText>();

void setup()
{
  // X← Y↓ Z↑
  size(1024, 1024, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);

  PFont font = createFont("Meiryo", 50);
  textFont(font);

  // RotatingText(String text, float radius, float theta, float omega, float phi, color c, float charStep)
  g_texts.add(new RotatingText("I thought what I'd do was, I'd pretend I was one of those deaf-mutes", 150, random(2*PI), -PI/200, 0, color(0, 255, 128), PI/40));
  g_texts.add(new RotatingText("深淵をのぞきこんでいると、深淵もまた、君をのぞきこむ", 150, random(2*PI), -PI/200, PI/8, color(255, 128, 0), PI/20));
  g_texts.add(new RotatingText("If you don't like where you are, change it. You're not a tree", 150, random(2*PI), -PI/200, -PI/8, color(128, 255, 0), PI/40));
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
  
  //saveFrame("frames/######.png");
}
