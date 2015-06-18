/**
* 
* PROYECTO DE INVESTIGACIÓN
* USABILIDAD & AOP: DESARROLLO Y EVALUACIÓN DE UN FRAMEWORK DE DOMINIO.
* (2014-2015)
* CÃ“DIGO: 29/A315
* 
* MÁS INFORMACIÓN EN {@link https://sites.google.com/site/profeprog/proyecto5}
* 
*/
package ajmu;

import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import java.util.List;
import java.util.ArrayList;

abstract aspect TaskUserProfile implements ActionListener{
	
	
	static int ageUser = 0;
	static String sexUser = "s/d"; 
	static String femaleString = "Female";
    static String maleString = "Male";
    static String otherString = "Other"; 
	
    abstract InterfaceTaskLog logProfile();
    
	pointcut initUserSession():execution(void net.jforum.view.forum.UserAction.buildSucessfulLoginRedirect());
	
	//void around(): initUserSession(){
	before():initUserSession() {	
		
		JRadioButton btnFemale	= new JRadioButton(femaleString, true);
		JRadioButton btnMale	= new JRadioButton(maleString);
		JRadioButton btnOther	= new JRadioButton(otherString);
		
		ButtonGroup groupSex	= 	new ButtonGroup();
		groupSex.add(btnFemale);
		groupSex.add(btnMale);
		groupSex.add(btnOther);
		
		btnFemale.addActionListener(this);
		btnMale.addActionListener(this);
		btnOther.addActionListener(this);
		
		List<Integer> age = new ArrayList<Integer>();
		Integer i = 0;
		for (i = 1; i <= 100; ++i) {
		    age.add(i);
		}
		JComboBox ageComboBox = new JComboBox(age.toArray());
		
	      JPanel myPanel = new JPanel(new GridLayout(6, 1));
	      myPanel.add(new JLabel("User Sex:"));
	      myPanel.add(btnFemale);
	      myPanel.add(btnMale);
	      myPanel.add(btnOther);
	      //myPanel.add(Box.createHorizontalStrut(15)); // a spacer
	      myPanel.add(new JLabel("User Age:"));
	      myPanel.add(ageComboBox);
	      myPanel.setSize(300, 400);
	      int result = JOptionPane.showConfirmDialog(null, myPanel, 
	               "Usability Metrics", JOptionPane.PLAIN_MESSAGE);
	      //if (result == JOptionPane.OK_OPTION) {
	         ageUser	= (Integer)ageComboBox.getSelectedItem();
	         //proceed();
	         
	      //}
	      logProfile().addSession(TaskUserProfile.ageUser, TaskUserProfile.sexUser);
	      //System.exit(0);
	      
	}
	
	public void actionPerformed(ActionEvent e) {
        sexUser	= e.getActionCommand() ;
    }
}
