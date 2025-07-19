package net.offersmanagement.dao;

public class Offer {
	
	protected int id;
	protected String name;
	protected String email;
	protected String type;
	protected String range; 
	protected String code;
	
    public Offer() {
    	
    }

	public Offer(String name, String email, String type, String range, String code) {
		super();
		this.name = name;
		this.email = email;
		this.type = type;
		this.range = range;
		this.code = code;
	}

	public Offer(int id, String name, String email, String type, String range, String code) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.type = type;
		this.range = range;
		this.code = code;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

    
}
