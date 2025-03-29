class Tower
{
  ArrayList<Floor> _floors;
  
  Tower()
  {
    _floors = new ArrayList<Floor>();
    
    for (int i = 0; i < 15; ++i)
    {
      float r = 0, y = 0;
      
      if (i == 0)
      {
        r = 256;
        y = 0;
      }
      else
      {
        Floor f = _floors.get(i - 1);
        r = f._radius * 4 / 5;
        y = f._y - Floor.boxHeight - Floor.pillarHeight;
      }
      
      _floors.add(new Floor(r, y));
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
