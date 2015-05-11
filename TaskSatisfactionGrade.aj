/**
* 
* PROYECTO DE INVESTIGACIÓN
* USABILIDAD & AOP: DESARROLLO Y EVALUACIÓN DE UN FRAMEWORK DE DOMINIO.
* (2014-2015)
* CÓDIGO: 29/A315
* 
* MÁS INFORMACIÓN EN {@link https://sites.google.com/site/profeprog/proyecto5}
* 
*/
package ajmu;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import javax.swing.ButtonGroup;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;


public aspect TaskSatisfactionGrade {
	
	static String auxSat1, auxSat2, auxSat3;
	static int sat1, sat2, sat3;
	static double  avgSat, variance, stdDeviation, compositeSat;
    static int numButtons = 5;
    
    static ButtonGroup groupDifficult = new ButtonGroup();
    static ButtonGroup groupSatisfied = new ButtonGroup();
    static ButtonGroup groupTime = new ButtonGroup();
    
    static String difficultTaskSat1Command = "1";
    static String difficultTaskSat2Command = "2";
    static String difficultTaskSat3Command = "3";
    static String difficultTaskSat4Command = "4";
    static String difficultTaskSat5Command = "5";
    
    static String satisfiedTaskSat1Command = "1";
    static String satisfiedTaskSat2Command = "2";
    static String satisfiedTaskSat3Command = "3";
    static String satisfiedTaskSat4Command = "4";
    static String satisfiedTaskSat5Command = "5";
    
    static String timeTaskSat1Command = "1";
    static String timeTaskSat2Command = "2";
    static String timeTaskSat3Command = "3";
    static String timeTaskSat4Command = "4";
    static String timeTaskSat5Command = "5";   
	
	pointcut satisfaction(Task t):execution(void Task.finaliza(..))&&this(t);
	
	before(Task t): satisfaction(t){
		//ddifficult
	    JRadioButton[] radioButtonsDifficult = new JRadioButton[numButtons];
	    radioButtonsDifficult[0] = new JRadioButton("Very Difficult");
	    radioButtonsDifficult[0].setActionCommand(difficultTaskSat1Command);

	    radioButtonsDifficult[1] = new JRadioButton("Difficult");
	    radioButtonsDifficult[1].setActionCommand(difficultTaskSat2Command);

	    radioButtonsDifficult[2] = new JRadioButton("Neutral");
	    radioButtonsDifficult[2].setActionCommand(difficultTaskSat3Command);

	    radioButtonsDifficult[3] = new JRadioButton("Easy");
	    radioButtonsDifficult[3].setActionCommand(difficultTaskSat4Command);
	    
	    radioButtonsDifficult[4] = new JRadioButton("Very Easy");
	    radioButtonsDifficult[4].setActionCommand(difficultTaskSat5Command);
	    
	    for (int i = 0; i < numButtons; i++) {
	    	groupDifficult.add(radioButtonsDifficult[i]);
        }
	    radioButtonsDifficult[2].setSelected(true);   
        
        //satisfied
        JRadioButton[] radioButtonsSatisfied = new JRadioButton[numButtons];
        radioButtonsSatisfied[0] = new JRadioButton("Very Unsatisfied");
        radioButtonsSatisfied[0].setActionCommand(satisfiedTaskSat1Command);

        radioButtonsSatisfied[1] = new JRadioButton("Unsatisfied");
        radioButtonsSatisfied[1].setActionCommand(satisfiedTaskSat2Command);

        radioButtonsSatisfied[2] = new JRadioButton("Neutral");
        radioButtonsSatisfied[2].setActionCommand(satisfiedTaskSat3Command);

        radioButtonsSatisfied[3] = new JRadioButton("Satisfied");
        radioButtonsSatisfied[3].setActionCommand(satisfiedTaskSat4Command);
	    
        radioButtonsSatisfied[4] = new JRadioButton("Very Satisfied");
        radioButtonsSatisfied[4].setActionCommand(satisfiedTaskSat5Command);
	    
	    for (int i = 0; i < numButtons; i++) {
	    	groupSatisfied.add(radioButtonsSatisfied[i]);
        }
	    radioButtonsSatisfied[2].setSelected(true);   
	    
	    //time complete
	    JRadioButton[] radioButtonsTime = new JRadioButton[numButtons];
	    radioButtonsTime[0] = new JRadioButton("To much Time");
	    radioButtonsTime[0].setActionCommand(timeTaskSat1Command);

	    radioButtonsTime[1] = new JRadioButton("Much Time");
	    radioButtonsTime[1].setActionCommand(timeTaskSat2Command);

	    radioButtonsTime[2] = new JRadioButton("Neutral");
	    radioButtonsTime[2].setActionCommand(timeTaskSat3Command);

	    radioButtonsTime[3] = new JRadioButton("Little Time");
	    radioButtonsTime[3].setActionCommand(timeTaskSat4Command);
	    
	    radioButtonsTime[4] = new JRadioButton("Very Little Time");
	    radioButtonsTime[4].setActionCommand(timeTaskSat5Command);
	    
	    for (int i = 0; i < numButtons; i++) {
	    	groupTime.add(radioButtonsTime[i]);
        }
	    radioButtonsTime[2].setSelected(true);   
                        
	      JPanel myPanel = new JPanel(new GridBagLayout());
	      GridBagConstraints c	= new GridBagConstraints();
	      c.fill	=	GridBagConstraints.HORIZONTAL;
	      c.gridx	=	0;
	      c.gridy	=	0;
	      c.gridwidth	= 5;
	      myPanel.add(new JLabel("How would you describe how difficult or easy it was to complete this task?"),c);
	      
	      for (int i = 0; i < numButtons; i++) {
	    	  	c.fill	=	GridBagConstraints.HORIZONTAL;
	    	  	c.gridx	=	0;
	    	  	c.gridy	=	i+1;
	            myPanel.add(radioButtonsDifficult[i],c);
	       }
	      
	      
	      c.fill	=	GridBagConstraints.HORIZONTAL;
	      c.gridx	=	0;
	      c.gridy	=	6;
	      c.gridwidth	= 5;
	      myPanel.add(new JLabel("How satisfied are you with using this application to complete this task?"),c);
	      for (int i = 0; i < numButtons; i++) {
	    	  	c.fill	=	GridBagConstraints.HORIZONTAL;
	    	  	c.gridx	=	0;
	    	  	c.gridy	=	i+7;
	            myPanel.add(radioButtonsSatisfied[i],c);
	        }
	      
	      c.fill	=	GridBagConstraints.HORIZONTAL;
	      c.gridx	=	0;
	      c.gridy	=	12;
	      c.gridwidth	= 5;
	      myPanel.add(new JLabel("How would you rate the amount of time it took to complete this task?"),c);
	      for (int i = 0; i < numButtons; i++) {
	    	  c.fill	=	GridBagConstraints.HORIZONTAL;
	    	  	c.gridx	=	0;
	    	  	c.gridy	=	i+14;
	            myPanel.add(radioButtonsTime[i],c);
	        }
	      
	      JOptionPane.showMessageDialog(null, myPanel, "Usability Metrics", JOptionPane.PLAIN_MESSAGE);
	      
	      auxSat1	= (String)groupDifficult.getSelection().getActionCommand();
	      auxSat2	= (String)groupSatisfied.getSelection().getActionCommand();
	      auxSat3	= (String)groupTime.getSelection().getActionCommand();
	      
	      sat1	=	Integer.parseInt(auxSat1);
	      sat2	= 	Integer.parseInt(auxSat2);
	      sat3	= 	Integer.parseInt(auxSat3);
	      avgSat = (sat1 + sat2 + sat3)/3;
	      variance = (Math.pow(sat1-avgSat, 2) + Math.pow(sat2-avgSat, 2) + Math.pow(sat3-avgSat, 2) )/3;
	      stdDeviation	= Math.sqrt(variance);
	      compositeSat	= (4-avgSat)/stdDeviation;
	      
	      t.setSat1(sat1);
	      t.setSat2(sat2);
	      t.setSat3(sat3);
	      t.setCompositeSat(compositeSat);
		
	}
	
}
