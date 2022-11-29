class Edge {
  int weight;
  String first;
  String second;

  Edge(this.weight, this.first, this.second);

  @override
  String toString() {
    return "W-> $weight, ($first, $second)";
  }
}

class KruskalAlgorithm {
  List<Edge> inputEdges;
  List<String> inputVertices;
  Map<String, int> setsOfComparison = {};
  List<Edge>? answer;
  List<List<String>> _sets = [];
  KruskalAlgorithm(this.inputEdges, this.inputVertices);

  List<Edge> execute() {
    inputEdges.sort((Edge e1, Edge e2) => e1.weight.compareTo(e2.weight),);
    answer = [];
    setsOfComparison = initSetsOfComparison();
    for (int i = 0; i < inputEdges.length; i++) {
      Edge currentEdge = inputEdges[i];
      if (!isTwoSetsEqual(inputEdges[i])) {
        answer!.add(inputEdges[i]);
        unionLists(inputEdges[i]);
      }
    }
    return answer!;
  }

  int getCost() {
    int cost = 0;
    for (int i = 0; i < answer!.length; i++) {
      cost += answer![i].weight;
    }
    return cost;
  }

  void unionLists(Edge edge) {
    List<String> result = _sets[setsOfComparison[edge.first]!] + _sets[setsOfComparison[edge.second]!];
    _sets[setsOfComparison[edge.first]!] = result;
    setsOfComparison[edge.first] = setsOfComparison[edge.second]!;
  }

  Map<String, int> initSetsOfComparison() {
    Map<String, int> setsOfComparison = {};
    for (int i = 0; i < inputVertices.length; i++) {
      _sets.add([inputVertices[i]]);
      setsOfComparison[inputVertices[i]] = _sets.length-1;
    }
    return setsOfComparison;
  }

  bool isTwoSetsEqual(Edge edge) {
    return setsOfComparison[edge.first]! == setsOfComparison[edge.second]!;
  }
}
