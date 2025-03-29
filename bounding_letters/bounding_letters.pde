ArrayList<BL> bls;

void setup()
{
  size(1024, 512);
  
  //printArray(PFont.list());
  PFont font = createFont("HiraginoSans-W0", 50);
  textFont(font);
  
  bls = new ArrayList<BL>();
  addLetters("明日は会社", 50, color(255, 0, 0), 0, 50);
  addLetters("休みは終わり", 40, color(255, 0, 255), 30, 150);
  addLetters("だるい", 60, color(200, 200, 0), 50, 300);
  addLetters("仕事が始まる", 30, color(200, 30, 200), 30, 350);
  
  int div = width / 2;
  addLetters("友情努力熱血", 50, color(0, 0, 255), div + 20, 50);
  addLetters("明日は休み", 40, color(0, 255, 0), div + 50, 100);
  addLetters("ボーナス", 40, color(0, 255, 255), div + 100, 140);
  addLetters("人生最高", 50, color(random(256), random(256), random(256)), div + 30, 180);
  addLetters("今日もいい日", 30, color(random(256), random(256), random(256)), div + 80, 230);
  addLetters("生きていることに感謝", 20, color(random(256), random(256), random(256)), div + 120, 260);
  addLetters("ワクワクする", 50, color(random(256), random(256), random(256)), div + 140, 280);
  addLetters("圧倒的感謝", 50, color(random(256), random(256), random(256)), div + 240, 330);
  addLetters("素晴らしい", 50, color(random(256), random(256), random(256)), div + 200, 400);
  
  fill(0, 0, 0);
  rect(0, 0, width / 2, height);
  fill(255, 255, 255);
  rect(width / 2, 0, width / 2, height);
}

void addLetters(String letters, float ls, color lc, float x, float y)
{
  for (int i = 0; i < letters.length(); ++i)
  {
    char l = letters.charAt(i);
    bls.add(new BL(l, ls, lc, x + i * (ls + 10), y, random(-2, 2), random(-1, 1)));
  }
}

void draw()
{
  final float a = 80;
  fill(0, 0, 0, a);
  rect(0, 0, width / 2, height);
  fill(255, 255, 255, a);
  rect(width / 2, 0, width / 2, height);
  
  for (BL bl : bls)
  {
    bl.update();
    bl.display();
  }
  
  //saveFrame("######.png");
}
