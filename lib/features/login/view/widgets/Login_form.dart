part of '../login_view.dart';

class _LoginFormwidgets extends StatelessWidget {
  const _LoginFormwidgets();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formkey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Welcome To Ystore',
              style: GoogleFonts.lato(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'discover the best products',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            CustomTextFields(
              validator: (email) {
                if (email?.isEmpty ?? true) {
                  return 'Please enter your Email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(email!)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              controller: context.read<LoginCubit>().emailController,
              prefixIcon: const Icon(Icons.email),
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            CustomTextFields(
              validator: (password) {
                if (password?.isEmpty ?? true) {
                  return 'Please enter your Password';
                }
                if (password!.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              controller: context.read<LoginCubit>().passwordController,
              prefixIcon: const Icon(Icons.key),
              obscureText: true,
              label: 'Password',
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                text: 'Login',
                fontSize: 16.0,
                onTap: () {
                  context.read<LoginCubit>().login();
                },
                buttonWidth: 200,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignupView(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppColors.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
