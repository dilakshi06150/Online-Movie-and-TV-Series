package Services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Controller.DBConnect;
import Model.QADeleteModel;
import Model.QAModel;
import Model.QAUpdateModel;


public class QAService {

	public void insertData(QAModel QAMod) {

		try {
			String QAID = QAMod.getQAID();
			String question = QAMod.getQuestion();
			String answer = QAMod.getAnswer();

			DBConnect db = new DBConnect();

			String sql = "INSERT INTO faq1 (id,que,ans) VALUES (?, ?, ?)";

			PreparedStatement pstmt = db.getConnection().prepareStatement(sql);

			pstmt.setString(1, QAID);
			pstmt.setString(2, question);
			pstmt.setString(3, answer);

			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<QAModel> showData() {
		List<QAModel> qaList = new ArrayList<>();
		try {
			DBConnect db = new DBConnect();
			String sql = "SELECT id, que, ans FROM faq1";
			PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("id");
				String question = rs.getString("que");
				String answer = rs.getString("ans");

				QAModel qa = new QAModel();
				qa.setQAID(id);
				qa.setQuestion(question);
				qa.setAnswer(answer);

				qaList.add(qa);
			}

			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qaList;
	}

	public void updateData(QAUpdateModel upMod) {
		try {
			String QAID = upMod.getQAID();
			String newquestion = upMod.getNewquestion();
			String newanswer = upMod.getNewanswer();

			DBConnect db = new DBConnect();
			String sql = "UPDATE faq1  SET que = ?, ans = ?  WHERE  id = ?";
			PreparedStatement pstmt = db.getConnection().prepareStatement(sql);

			pstmt.setString(1, newquestion);
			pstmt.setString(2, newanswer);
			pstmt.setString(3, QAID);

			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteData(QADeleteModel dMod) {
		try {
			String QAID = dMod.getQAID();

			DBConnect db = new DBConnect();

			String sql = "DELETE FROM faq1  WHERE id = ?";
			PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
			pstmt.setString(1, QAID);

			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
}
