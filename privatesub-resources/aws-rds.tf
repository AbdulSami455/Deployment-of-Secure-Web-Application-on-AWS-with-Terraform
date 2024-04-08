resource "aws_db_instance" "default" {
  allocated_storage    = 10    // SToarge Options  
  db_name              = "mydb"    // Database Name
  engine               = "mysql"    // Database Engine
  engine_version       = "5.7"      // Engine Version
  instance_class       = "db.t3.micro"   //CLasses of DB instance
  username             = "foo"               //Username 
  password             = "foobarbaz"        // Password
  parameter_group_name = "default.mysql5.7"      
  skip_final_snapshot  = true
}