# TCL (True Life Care) - Healthcare Management System

A comprehensive healthcare management system built using Java EE technologies for managing vaccination records, user registrations, and healthcare booth operations.

## 🌟 Features

- **User Management**
  - Secure user registration with detailed health information
  - User authentication and profile management
  - Birth certificate verification system
  - Personal health records management

- **Booth Management**
  - Dedicated booth login system
  - Booth registration and verification
  - Aadhar card verification for booth owners
  - Booth-specific operations management

- **Vaccination Records**
  - Comprehensive vaccination tracking
  - Multiple vaccine dose management
  - Vaccination history and scheduling
  - Digital record keeping

- **Contact & Support**
  - Query management system
  - User support interface
  - Contact form integration

## 🛠️ Technology Stack

- **Backend**
  - Java EE
  - Servlets
  - JSP (JavaServer Pages)
  - MySQL Database

- **Frontend**
  - HTML5
  - CSS3
  - JavaScript
  - Bootstrap 5
  - Font Awesome Icons

- **Server**
  - Apache Tomcat
  - XAMPP Server

## 📋 Prerequisites

- Java Development Kit (JDK) 8 or higher
- Apache Tomcat Server
- MySQL Database
- XAMPP (for local development)
- Maven (for dependency management)

## 🚀 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/TCL_Java_New.git
   ```

2. Set up the database:
   - Import the `user.sql` file into your MySQL database
   - Configure database connection in the application

3. Configure Tomcat:
   - Deploy the WAR file to your Tomcat server
   - Configure server settings in `web.xml`

4. Start the application:
   - Start XAMPP services (Apache and MySQL)
   - Deploy the application to Tomcat
   - Access the application at `http://localhost:8080/TCL_Java_New`

## 📁 Project Structure

```
TCL_Java_New/
├── WEB-INF/
│   ├── classes/
│   └── web.xml
├── com/
│   └── tcl/
│       ├── servlets/
│       └── models/
├── META-INF/
├── Booth-Adhar/
├── Birth-Certificate-Images/
└── JSP files
```

## 🔒 Security Features

- Secure password hashing
- Session management
- Input validation
- File upload security
- SQL injection prevention

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- Your Name - Initial work

## 🙏 Acknowledgments

- Bootstrap team for the amazing frontend framework
- Font Awesome for the icons
- All contributors who have helped in the development 