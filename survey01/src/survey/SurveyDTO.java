package survey;

public class SurveyDTO {
	private int num;
	private String foodName;
	private int countVote;
	
	public SurveyDTO() {}

	public SurveyDTO(int num, String foodName, int countVote) {
		super();
		this.num = num;
		this.foodName = foodName;
		this.countVote = countVote;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getCountVote() {
		return countVote;
	}

	public void setCountVote(int countVote) {
		this.countVote = countVote;
	}

	@Override
	public String toString() {
		return "SurveyDTO [num=" + num + ", foodName=" + foodName + ", count=" + countVote + "]";
	};
	
}
