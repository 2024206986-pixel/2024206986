package bean;

public class ProfileBean {
    private String studentId;
    private String name;
    private String program;
    private String email;
    private String hobbies;
    private String intro;

    public ProfileBean() {}

    public ProfileBean(String studentId, String name, String program,
                        String email, String hobbies, String intro) {
        this.studentId = studentId;
        this.name = name;
        this.program = program;
        this.email = email;
        this.hobbies = hobbies;
        this.intro = intro;
    }

    public String getStudentID() { return studentId; }
    public void setStudentID(String studentId) { this.studentId = studentId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getProgram() { return program; }
    public void setProgram(String program) { this.program = program; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getHobbies() { return hobbies; }
    public void setHobbies(String hobbies) { this.hobbies = hobbies; }
    public String getIntro() { return intro; }
    public void setIntro(String intro) { this.intro = intro; }
}