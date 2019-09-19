void addClipboard() {
  clipboards.add(new Clipboard());
}



void wiewClipboard() {
  String names = "";
  String name = "";
  for (Clipboard n : clipboards) {
    names = names.concat(n.name.concat(", "));
  }
  JOptionPane.showMessageDialog(null,"Here are the names of the clipboards you have:\n" + names);
  name = JOptionPane.showInputDialog("Type the name of the clipboard you wanna see");
  
  for (Clipboard c : clipboards) {
    if (c.name.equals(name)) {
      JOptionPane.showMessageDialog(null,"The content is: " + c.content);
    }
  }
}



void deleteClipboards() {
  clipboards = new ArrayList<Clipboard>();
}



void credits() {
  link("http://adryyyy.github.io");
}
