resource "aws_iam_user" "aws_admin_IAMuser" {
    name = "sxsunny"
}

resource "aws_iam_group" "aws_admin_IAMgroup" {
  name = "aws_admin"
}

resource "aws_iam_group_membership" "user_member_admin" {
  name = aws_iam_user.aws_admin_IAMuser.name
  users = [aws_iam_user.aws_admin_IAMuser.name]
  group = aws_iam_group.aws_admin_IAMgroup.name
}

resource "aws_iam_group_policy_attachment" "administrator-attach" {
    group = "${aws_iam_group.aws_admin_IAMgroup.name}"
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy" "adminaccess_policy_iamuser" {
   arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}