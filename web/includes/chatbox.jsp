<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- Chat Launcher Button -->
    <div class="chat-launcher" onclick="toggleChat()">
        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.5"
            stroke-linecap="round" stroke-linejoin="round">
            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
        </svg>
    </div>

    <!-- Chat Window -->
    <div class="chat-window" id="chatWindow">
        <div class="chat-header">
            <div class="chat-header-info">
                <div style="width: 10px; height: 10px; background: #10b981; border-radius: 50%;"></div>
                <strong style="font-size: 1.125rem;">Trợ lý thông minh</strong>
            </div>
            <button onclick="toggleChat()" style="background: none; border: none; color: white; cursor: pointer;">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                    stroke-linecap="round" stroke-linejoin="round">
                    <line x1="18" y1="6" x2="6" y2="18"></line>
                    <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
            </button>
        </div>

        <div class="chat-body" id="chatBody">
            <div class="msg msg-bot">
                Chào ${not empty sessionScope.account ? sessionScope.account.hoTen : 'bạn'}, tôi có thể giúp gì cho bạn
                về việc quản lý tài sản không?
            </div>
        </div>

        <div class="chat-footer">
            <input type="text" id="chatMsg" class="chat-input" placeholder="Nhập câu hỏi..."
                onkeypress="if(event.key === 'Enter') sendMessage()">
            <button onclick="sendMessage()"
                style="background: var(--primary); color: white; border: none; padding: 10px; border-radius: 12px; cursor: pointer; display: flex; align-items: center; justify-content: center;">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"
                    stroke-linecap="round" stroke-linejoin="round">
                    <line x1="22" y1="2" x2="11" y2="13"></line>
                    <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                </svg>
            </button>
        </div>
    </div>

    <script>
        const chatWindow = document.getElementById('chatWindow');
        const chatBody = document.getElementById('chatBody');
        const chatInput = document.getElementById('chatMsg');

        function toggleChat() {
            const isVisible = chatWindow.style.display === 'flex';
            chatWindow.style.display = isVisible ? 'none' : 'flex';
            if (!isVisible) {
                chatWindow.style.animation = 'slideUp 0.4s cubic-bezier(0.18, 0.89, 0.32, 1.28)';
                chatInput.focus();
            }
        }

        function addMessage(text, type) {
            const div = document.createElement('div');
            div.className = `msg msg-${type}`;
            div.textContent = text;
            chatBody.appendChild(div);
            chatBody.scrollTop = chatBody.scrollHeight;
        }

        function sendMessage() {
            const msg = chatInput.value.trim();
            if (!msg) return;

            addMessage(msg, 'user');
            chatInput.value = '';

            // Simulate Bot response
            setTimeout(() => {
                let response = "Xin lỗi, tôi chưa hiểu ý bạn. Bạn có thể hỏi về: 'danh sách tài sản', 'thêm tài sản', hoặc 'báo cáo'.";
                const lowerMsg = msg.toLowerCase();

                if (lowerMsg.includes('danh sách') || lowerMsg.includes('tài sản')) {
                    response = "Bạn có thể xem đầy đủ danh sách tại mục 'Phòng học & Tài sản' ở thanh điều hướng bên trái nhé!";
                } else if (lowerMsg.includes('thêm')) {
                    response = "Để thêm tài sản mới, hãy nhấn nút 'Thêm tài sản mới' trong trang Quản lý tài sản.";
                } else if (lowerMsg.includes('chào') || lowerMsg.includes('hello')) {
                    response = "Chào bạn! Chúc bạn một ngày làm việc hiệu quả!";
                } else if (lowerMsg.includes('phòng')) {
                    response = "Hệ thống hiện quản lý 48 phòng học với đầy đủ trang thiết bị.";
                }

                addMessage(response, 'bot');
            }, 800);
        }
    </script>

    <style>
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px) scale(0.9);
            }

            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }
    </style>