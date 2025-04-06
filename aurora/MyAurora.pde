class MyAurora
{
  final float _x;
  final float _y;
  final int _width;
  final int _height;
  final float _hue;
  float _bump;
  FloatList _alphas;
  float _deltaWidth0;
  float _deltaWidth1;
  float _deltaHeight0;
  float _deltaHeight1;
  
  MyAurora(float x, float y, int w, int h, float hue)
  {
    _x = x;
    _y = y;
    _width = w;
    _height = h;
    _hue = hue;
    _bump = 128;
    
    _alphas = new FloatList();
    float alpha = 1;
    _alphas.append(alpha);
    for (int i = 1; i < _height; ++i)
    {
      alpha += random(-0.05, 0.05);
      alpha = max(alpha, 0);
      alpha = min(alpha, 1);
      _alphas.append(alpha);
    }
    
    _deltaWidth0 = 0;
    _deltaWidth1 = 0;
    _deltaHeight0 = 0;
    _deltaHeight1 = 0;
  }
  
  void update(int counter)
  {
    // 上から下にアルファ値が移る
    for (int i = _height - 1; i > 0; --i)
    {
      _alphas.set(i, _alphas.get(i - 1));
    }
    {
      float alpha = _alphas.get(0);
      alpha += random(-0.01, 0.01);
      alpha = max(alpha, 0);
      alpha = min(alpha, 1);
      _alphas.set(0, alpha);
    }
    
    // ノイズをのせる
    for (int i = 0; i < _height; ++i)
    {
      float alpha = _alphas.get(i);
      alpha += random(-0.1, 0.1);
      alpha = max(alpha, 0);
      alpha = min(alpha, 1);
      _alphas.set(i, alpha);
    }
    
    if (counter % 10 == 0)
    {
      _deltaWidth0 += random(-5, 5);
      _deltaWidth1 += random(-5, 5);
      _deltaHeight0 += random(-5, 5);
      _deltaHeight1 += random(-5, 5);
      _bump += random(-5, 5);
    }
  }
  
  void display()
  {
    float anchor_x1 = _x - _deltaWidth0;
    float anchor_y1 = _y - _deltaHeight0;
    float control_x2 = _x + _width;
    float control_y2 = _y;
    float control_x3 = _x;
    float control_y3 = _y + _bump;
    float anchor_x4 = _x + _width + _deltaWidth1;
    float anchor_y4 = _y + _bump + _deltaHeight1;
    
    for (int i = 0; i < _height; ++i)
    {
      float x1 = anchor_x1;
      float y1 = anchor_y1 + i;
      float x2 = control_x2;
      float y2 = control_y2 + i;
      float x3 = control_x3;
      float y3 = control_y3 + i;
      float x4 = anchor_x4;
      float y4 = anchor_y4 + i;
      float alpha = _alphas.get(i);
      stroke(_hue, 1, 1, alpha);
      noFill();
      bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    }
  }
}
