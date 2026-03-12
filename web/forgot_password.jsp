<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quên Mật Khẩu - ASSET ERP</title>
        <style>
            :root {
                --primary: #6366f1;
                --primary-hover: #4f46e5;
                --bg: #0f172a;
                --white: #ffffff;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Inter', sans-serif;
            }

            body {
                background: radial-gradient(circle at top right, #312e81, #0f172a 50%);
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                overflow: hidden;
            }

            .login-card {
                background: rgba(255, 255, 255, 0.03);
                backdrop-filter: blur(24px);
                padding: 56px;
                border-radius: 32px;
                width: 100%;
                max-width: 480px;
                border: 1px solid rgba(255, 255, 255, 0.08);
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                animation: fadeIn 0.8s ease-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .header {
                text-align: center;
                margin-bottom: 40px;
            }

            .logo {
                width: 64px;
                height: 64px;
                background: linear-gradient(135deg, #818cf8 0%, #4f46e5 100%);
                border-radius: 16px;
                margin: 0 auto 24px;
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.4);
            }

            .form-group {
                margin-bottom: 24px;
            }

            label {
                display: block;
                font-size: 0.875rem;
                margin-bottom: 10px;
                color: #94a3b8;
                font-weight: 600;
                text-transform: uppercase;
            }

            input {
                width: 100%;
                padding: 16px;
                background: rgba(255, 255, 255, 0.05);
                border: 2px solid rgba(255, 255, 255, 0.05);
                border-radius: 14px;
                color: white;
                outline: none;
                font-size: 1rem;
                transition: all 0.3s;
            }

            input:focus {
                border-color: var(--primary);
                background: rgba(255, 255, 255, 0.08);
                box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            }

            .btn-login {
                width: 100%;
                padding: 16px;
                background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
                color: white;
                border: none;
                border-radius: 14px;
                font-weight: 700;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s;
            }

            .btn-login:hover {
                transform: translateY(-2px);
                box-shadow: 0 15px 25px -5px rgba(79, 70, 229, 0.4);
            }

            .error {
                background: rgba(239, 68, 68, 0.1);
                color: #f87171;
                padding: 12px;
                border-radius: 12px;
                text-align: center;
                margin-bottom: 24px;
                font-size: 0.875rem;
                border: 1px solid rgba(239, 68, 68, 0.2);
            }

            .back-link {
                display: block;
                text-align: center;
                margin-top: 24px;
                color: #94a3b8;
                text-decoration: none;
                font-size: 0.875rem;
                transition: color 0.3s;
            }

            .back-link:hover {
                color: white;
            }
        </style>
    </head>

    <body>
        <div class="login-card">
            <div class="header">
                <div class="logo">
                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.5">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                </div>
                <h2 style="font-size: 1.75rem; font-weight: 800;">Quên Mật Khẩu</h2>
                <p style="color: #64748b; margin-top: 10px; font-weight: 500;">Nhập email của bạn để nhận mã OTP</p>
            </div>

            <% String error=(String) request.getAttribute("error"); %>
                <% if (error !=null) { %>
                    <div class="error">
                        <%= error %>
                    </div>
                    <% } %>

                        <form action="forgot-password" method="post">
                            <input type="hidden" name="action" value="requestOTP">
                            <div class="form-group">
                                <label>Email đăng ký</label>
                                <input type="email" name="email" placeholder="Nhập địa chỉ email của bạn..." required>
                            </div>
                            <button type="submit" class="btn-login">Nhận mã OTP</button>
                        </form>

                        <a href="login" class="back-link">Quay lại đăng nhập</a>
        </div>
    </body>

    </html>