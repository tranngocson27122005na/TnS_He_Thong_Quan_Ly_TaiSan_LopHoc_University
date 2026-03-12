<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt Lại Mật Khẩu - ASSET ERP</title>
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
        </style>
    </head>

    <body>
        <div class="login-card">
            <div class="header">
                <div class="logo">
                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.5">
                        <path
                            d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4">
                        </path>
                    </svg>
                </div>
                <h2 style="font-size: 1.75rem; font-weight: 800;">Đặt Lại Mật Khẩu</h2>
                <p style="color: #64748b; margin-top: 10px; font-weight: 500;">Nhập mật khẩu mới của bạn</p>
            </div>

            <% String error=(String) request.getAttribute("error"); %>
                <% if (error !=null) { %>
                    <div class="error">
                        <%= error %>
                    </div>
                    <% } %>

                        <form action="forgot-password" method="post">
                            <input type="hidden" name="action" value="resetPassword">
                            <div class="form-group">
                                <label>Mật khẩu mới</label>
                                <input type="password" name="newPassword" placeholder="••••••••" required>
                            </div>
                            <div class="form-group">
                                <label>Xác nhận mật khẩu</label>
                                <input type="password" name="confirmPassword" placeholder="••••••••" required>
                            </div>
                            <button type="submit" class="btn-login">Cập Nhật Mật Khẩu</button>
                        </form>
        </div>
    </body>

    </html>