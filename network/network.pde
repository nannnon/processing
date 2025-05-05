ArrayList<Node> g_nodes = new ArrayList<Node>();
ArrayList<Edge> g_edges = new ArrayList<Edge>();
ArrayList<Ray> g_rays = new ArrayList<Ray>();

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  // ノードをばらまく
  for (int i = 0; i < 400; ++i)
  {
    g_nodes.add(new Node(random(width), random(height)));
  }
  
  // 隣接したノードを関連付ける
  for (Node n : g_nodes)
  {
    n.addAdjacentNodes(g_nodes, 80);
  }
  
  // 光を放つ
  for (int i = 0; i < 10; ++i)
  {
    int n = int(random(g_nodes.size()));
    g_rays.add(new Ray(g_nodes.get(n)));
  }
}

void draw()
{
  background(0);
  
  for (Edge e : g_edges)
  {
    e.display();
  }
  
  for (Node n : g_nodes)
  {
    n.display();
  }
  
  for (Ray r : g_rays)
  {
    r.update();
    r.display();
  }
  
  //saveFrame("frames/######.png");
}
