/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir;

import com.mongodb.gridfs.GridFSDBFile;
import java.io.IOException;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsOperations;

/**
 *
 * @author Asus PC
 */
public class TestApp {

    public static void main(String[] args) {
//        List<Profile> objectList = new ArrayList<>();
//        Profile profile = new Profile();
//
//        profile.setId("0004");
//        objectList.add(profile);
//        profile = new Profile();
//        profile.setId("0005");
//        objectList.add(profile);
//        profile = new Profile();
//        profile.setId("0007");
//        objectList.add(profile);
//
//        for (Profile profileItem : objectList) {
//            System.out.println(profileItem.toString());
//            System.out.println(profileItem.getId());
//        }
//ApplicationContext ctx =
//              new GenericXmlApplicationContext("main-servlet.xml");
//	GridFsOperations gridOperations =
//              (GridFsOperations) ctx.getBean("gridFsTemplate");
//
//	List<GridFSDBFile> result = gridOperations.find(
//               new Query().addCriteria(Criteria.where("filename").is("testing.png")));
//
//	for (GridFSDBFile file : result) {
//		try {
//			System.out.println(file.getFilename());
//			System.out.println(file.getContentType());
//
//			//save as another image
//			file.writeTo("/Users/mkyong/Downloads/new-testing.png");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	System.out.println("Done");
    }
}
