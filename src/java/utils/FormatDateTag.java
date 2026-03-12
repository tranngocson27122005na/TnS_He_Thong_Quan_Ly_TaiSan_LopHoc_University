package utils;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatDateTag extends SimpleTagSupport {
    private Date value;
    private String pattern = "dd/MM/yyyy HH:mm:ss";

    public void setValue(Date value) {
        this.value = value;
    }

    public void setPattern(String pattern) {
        if (pattern != null && !pattern.isEmpty()) {
            this.pattern = pattern;
        }
    }

    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        if (value != null) {
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            out.print(sdf.format(value));
        } else {
            out.print("N/A");
        }
    }
}
