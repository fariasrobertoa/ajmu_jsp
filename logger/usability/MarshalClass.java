package ajmu.logger.usability;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
 
public class MarshalClass {
 
    public void generateXML (String nameFile) {
 
        try {
            File file = new File (nameFile);
            JAXBContext jc = JAXBContext.newInstance(this.getClass());
            Marshaller jaxbMarshaller = jc.createMarshaller();
 
            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
 
            jaxbMarshaller.marshal(this, new FileWriter(nameFile, false));
 
        } catch (JAXBException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}