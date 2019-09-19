class Clipboard implements Serializable {
  String name;
  String content;
   Clipboard() {
     this.name = JOptionPane.showInputDialog("Name of the clipboard");
     this.content = JOptionPane.showInputDialog("Content of the clipboard");
  }
  void wiew() {
   println(this.name);
   println("===================================================");
   println(this.content);
  }
  
public void saveArrayList() throws IOException {
FileOutputStream fout= new FileOutputStream ("Clipboard.clip");
ObjectOutputStream oos = new ObjectOutputStream(fout);
oos.writeObject(clipboards);
fout.close();
}
public void readArrayList() throws ClassNotFoundException, FileNotFoundException, IOException {
FileInputStream fin = new FileInputStream ("Clipboard.clip");
ObjectInputStream ois = new ObjectInputStream(fin);
clipboards = (ArrayList<Clipboards.Clipboard>)ois.readObject();
fin.close();
}
}
