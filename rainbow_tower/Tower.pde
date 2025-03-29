class Tower
{
  ArrayList<Floor> _floors;
  
  Tower()
  {
    _floors = new ArrayList<Floor>();
    
    for (int i = 0; i < 13; ++i)
    {
      float w = 0, h = 0, x = 0, y = 0;
      
      if (i == 0)
      {
        w = width * 4 / 5;
        h = 40;
        x = (width - w) / 2;
        y = height - h;
      }
      else
      {
        Floor p = _floors.get(i - 1);
        w = p._w * 4 / 5;
        h = 40;
        x = (width - w) / 2;
        y = p._y - h;
      }
      
      _floors.add(new Floor(x, y, w, h));
    }
  }
  
  void draw()
  {
    for (Floor f : _floors)
    {
      f.draw();
    }
  }
}
