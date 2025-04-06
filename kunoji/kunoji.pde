ArrayList<MyKunoji> g_kunojis = new ArrayList<MyKunoji>();
int g_counter = 0;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  int horNum = round(width / MyKunoji.Size);
  int verNum = round(height / MyKunoji.Size);
  for (int i = 0; i < horNum; ++i)
  {
    for (int j = 0; j < verNum; ++j)
    {
      float x = i * MyKunoji.Size + MyKunoji.Size / 2;
      float y = j * MyKunoji.Size + MyKunoji.Size / 2;
      g_kunojis.add(new MyKunoji(x, y));
    }
  }
}

void draw()
{
  if (g_counter++ % 5 == 0)
  {
    int i = int(random(g_kunojis.size()));
    g_kunojis.get(i).startRotation();
  }
  
  background(0);
  
  for (MyKunoji k : g_kunojis)
  {
    k.update();
    k.display();
  }
}
