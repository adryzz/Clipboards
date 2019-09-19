import java.io.FileNotFoundException;
import java.io.ObjectInputStream;
import java.io.FileInputStream;
import java.io.ObjectOutputStream;
import java.io.FileOutputStream;
import java.io.Serializable;
import g4p_controls.*;
import java.awt.*;
import java.awt.TrayIcon.MessageType;
import processing.awt.PSurfaceAWT.SmoothCanvas;
import com.sun.awt.AWTUtilities;
import javax.swing.JRootPane;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Frame;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JOptionPane;

JFrame jframe;
String wiew;
ArrayList<Clipboard> clipboards = new ArrayList<Clipboard>();
static final JFrame getJFrame(final PSurface surf) {
  return (JFrame) ((SmoothCanvas) surf.getNative()).getFrame();
}

void setup() {
  size(640, 360);
  init();
  jframe = getJFrame(getSurface());
  surface.setTitle("Clipboards");
  createGUI();
  this.jframe.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
  this.jframe.getRootPane().setWindowDecorationStyle(JRootPane.NONE);
  //readArrayList();
}
void init() {
  if (SystemTray.isSupported()) {
  } else {
    System.err.println("System tray not supported!");
  }
}
void draw() {
  background(255);
}
public void notificationTray() {
  try {
    //Obtain only one instance of the SystemTray object
    SystemTray tray = SystemTray.getSystemTray();

    //If the icon is a file
    Image image = Toolkit.getDefaultToolkit().createImage("icon.png");
    //Alternative (if the icon is on the classpath):
    //Image image = Toolkit.getDefaultToolkit().createImage(getClass().getResource("icon.png"));

    TrayIcon trayIcon = new TrayIcon(image, "Tray Demo");
    //Let the system resize the image if needed
    trayIcon.setImageAutoSize(true);
    //Set tooltip text for the tray icon
    trayIcon.setToolTip("Saving...");
    tray.add(trayIcon);

    trayIcon.displayMessage("Clipboards", "Saving clipboards...", MessageType.INFO);
  } 
  catch (AWTException ex) {
    println("system tray not supported" + ex);
  }
}
void exit() {
  println("Not exiting");
  notificationTray();
  //saveArrayList();
  delay(5000);
  super.exit();
}
