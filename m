Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC6E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LSDGayH+;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=Okqn4bo2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iwJ2iNowiHeIyJMDUz4HB42+qE+NikCxYbeX04mfSWo=; b=LSDGayH+9QZpXtd8f24KSv4ouk
	1OKL/rf6W9ylRlNxrdneAV5pPOIeOvqYl5hpv9lfuWyMQ0XrdV8osP7Q1uS+kqWyhDdntqKlThiRF
	PiyMvaPy9QFAUCx6RdBFrohVJRAXa32aDVE5BtliYYoCjIp96Zr2xHmzNl6FvEqueDqEMUl46Lp4d
	EREsd1IRobi0SA01xOCKy6NwwT0ktoadxt22nn8XCdUlXD9xDbZJNq6ydkLTDxr81BEzUkcL11mzv
	nlmP4FLcdoBiej8r/LCKMzBFiiVJjuVsb0jnxic0eZfdyGt1+9scyomTgQ+lMBidqjynWQ9yD45c9
	4kJ7d2tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJuZ-00000000t2F-17o3;
	Sat, 28 Nov 2026 15:00:23 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJuW-00000000t1O-3L9W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 15:00:22 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jcD3k44LVzMm1N;
	Sat, 28 Nov 2026 16:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795878018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iwJ2iNowiHeIyJMDUz4HB42+qE+NikCxYbeX04mfSWo=;
	b=Okqn4bo2RBpL0XXjCxFI/doT/Kp7sfr0KRlqBrv2ayiC+rO3p80NiATL3Y8ftuZZMHk9KL
	lh1/RDxZc3FRhkkrZH/07wPcp7cXmR6YdZBjuyl9sqjBnDcLShDMXRlgrEVLZNLQ0T7oH4
	TCgUbE+giBcEH86YIpNL/42Hob7Ajwu6V36F2/KYV7A4RIeFn6USBzt8KtMVd9HusjEpo7
	SrqV/uAXhr4KHUlo5sMjL6eAu4E2zNwq5mt7wzIrC4+hR8DU+ZfetEyTNewa33j+EFNLP9
	y3D0IQljOijGUQUMGignZflJQDVWaNNNZEaZbc5+BDmn73RbMEHZrdbM5aGZ7Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 16:00:14 +0100
Subject: [PATCH] clk: samsung: exynos5250: Ignore trustzone clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-exynos5250-clk-tzpc-fix-v1-1-fb0d9ba7b2fa@timmermann.space>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwrCQBCE4auEXtuQaRkjXkVcJJNSW2USphPJg
 9zdUZdfQf0rGZLC6FSslPBW0y5muF1B4V7HG1jbbJJSDs7JkTHNsTMvvuTwevKw9IGvOnHjfVt
 XsgdQUX73CXn+lc+Xv21sHgjDN0fb9gFORFcgewAAAA==
X-Change-ID: 20261128-exynos5250-clk-tzpc-fix-b55da723eee7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <foss@timmermann.space>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcD3k44LVzMm1N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_070020_992239_721575EB 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add flags to keep the trustzone related clocks enabled on exynos5250
devices during suspend. This fixes a crash for manta boards when trying
to suspend to ram.

This fix is based on the exynos5433 clock driver.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 drivers/clk/samsung/clk-exynos5250.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 802300c945a9..3bf0876bbb2d 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -614,16 +614,26 @@ static const struct samsung_gate_clock exynos5250_gate_clks[] __initconst = {
 			GATE_IP_PERIS, 4, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_CMU_MEM, "cmu_mem", "div_aclk66",
 			GATE_IP_PERIS, 5, CLK_IGNORE_UNUSED, 0),
-	GATE(CLK_TZPC0, "tzpc0", "div_aclk66", GATE_IP_PERIS, 6, 0, 0),
-	GATE(CLK_TZPC1, "tzpc1", "div_aclk66", GATE_IP_PERIS, 7, 0, 0),
-	GATE(CLK_TZPC2, "tzpc2", "div_aclk66", GATE_IP_PERIS, 8, 0, 0),
-	GATE(CLK_TZPC3, "tzpc3", "div_aclk66", GATE_IP_PERIS, 9, 0, 0),
-	GATE(CLK_TZPC4, "tzpc4", "div_aclk66", GATE_IP_PERIS, 10, 0, 0),
-	GATE(CLK_TZPC5, "tzpc5", "div_aclk66", GATE_IP_PERIS, 11, 0, 0),
-	GATE(CLK_TZPC6, "tzpc6", "div_aclk66", GATE_IP_PERIS, 12, 0, 0),
-	GATE(CLK_TZPC7, "tzpc7", "div_aclk66", GATE_IP_PERIS, 13, 0, 0),
-	GATE(CLK_TZPC8, "tzpc8", "div_aclk66", GATE_IP_PERIS, 14, 0, 0),
-	GATE(CLK_TZPC9, "tzpc9", "div_aclk66", GATE_IP_PERIS, 15, 0, 0),
+	GATE(CLK_TZPC0, "tzpc0", "div_aclk66", GATE_IP_PERIS, 6,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC1, "tzpc1", "div_aclk66", GATE_IP_PERIS, 7,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC2, "tzpc2", "div_aclk66", GATE_IP_PERIS, 8,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC3, "tzpc3", "div_aclk66", GATE_IP_PERIS, 9,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC4, "tzpc4", "div_aclk66", GATE_IP_PERIS, 10,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC5, "tzpc5", "div_aclk66", GATE_IP_PERIS, 11,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC6, "tzpc6", "div_aclk66", GATE_IP_PERIS, 12,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC7, "tzpc7", "div_aclk66", GATE_IP_PERIS, 13,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC8, "tzpc8", "div_aclk66", GATE_IP_PERIS, 14,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC9, "tzpc9", "div_aclk66", GATE_IP_PERIS, 15,
+			CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_HDMI_CEC, "hdmi_cec", "div_aclk66", GATE_IP_PERIS, 16, 0, 0),
 	GATE(CLK_MCT, "mct", "div_aclk66", GATE_IP_PERIS, 18, 0, 0),
 	GATE(CLK_WDT, "wdt", "div_aclk66", GATE_IP_PERIS, 19, 0, 0),

---
base-commit: 7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046
change-id: 20261128-exynos5250-clk-tzpc-fix-b55da723eee7

Best regards,
--  
Lukas Timmermann <foss@timmermann.space>


