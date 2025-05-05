class Ray
{
  final int MaxCounter = 1;
  
  private Node _from;
  private Node _to;
  private int _counter;
  private PVector[] _locus;
  
  Ray(Node from)
  {
    final int LocusPointsNum = 5;
    _locus = new PVector[LocusPointsNum];
    for (int i = 0; i < _locus.length; ++i)
    {
      _locus[i] = new PVector(from._x, from._y);
    }
    
    setNext(from);
  }
  
  void setNext(Node from)
  {
    _from = from;
    _to = from.getRandomAdjacentNode();
    _counter = 0;
  }
  
  void update()
  {
    // 軌跡をずらす
    for (int i = _locus.length - 1; i > 0; --i)
    {
      _locus[i].set(_locus[i - 1]);
    }
    
    // 最新の軌跡
    float factor = float(_counter) / MaxCounter;
    _locus[0].x = factor * _to._x + (1 - factor) * _from._x;
    _locus[0].y = factor * _to._y + (1 - factor) * _from._y;
    
    if (_counter == MaxCounter)
    {
      setNext(_to);
    }
    else
    {
      ++_counter;
    }
  }
  
  void display()
  {
    for (int i = 1; i < _locus.length; ++i)
    {
      noFill();
      stroke(255, 212, 0);
      strokeWeight(3);
      line(_locus[i - 1].x, _locus[i - 1].y, _locus[i].x, _locus[i].y);
    }
  }
}
