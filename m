Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CAA6070F53
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtFBfpSH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vh73mWMb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=; b=NtFBfpSH/ZSIth
	INS4ZnhWNxe8WqyLLomQPgVdYW7V+gbw+yGY6VduY1yG6nrl75O1KpCsluwRvD4OXthOOTTnglagb
	xqATmwXgFVdB/f9qKXtU2+vv7jK8bKAmnRMw/uCXTJyKUIQV8uCrASPy/xfovLZKUfBu6k1LUNI/E
	PpsDq0Ylf8eVv0cIDEqMiW0a92/mm7a90jKffq0CNz1pQm9/zh5YPizOsR5rWOoNZN/7D5CKPE4Ao
	lJDL6Kt6J26XFFcTNbIH6qo9NZrVT72u3v+BtjvDH7UFauFfNecVhvAzbzg+DD5ZRQRk+IwZuiw/4
	wb2lkACy1OlBrWYWOptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZxV-0000000Atnq-1VC1;
	Thu, 12 Nov 2026 18:55:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZxE-0000000AtjQ-3mnW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:55:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1415435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509723; x=1795114523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=;
        b=vh73mWMbzKXlpXe9ggtA8THFuoXX2jXbwpJ617mVG52GCVbodXqY90AhJXAosMmKMF
         JXcmJhL3Dzu0LCvDkNvkZYBh/SxwG13H4eFQoCwwnOzwCrGZqQowAMeOE3z0YgNuEyZf
         Q/bDygJge3iCjUaDPTTzed4tbEoPm8WoyIPDjbiJw94hKsHfE/Ilq1ebaMCmjSBvajIZ
         uM3nOzbTHQEOjpPmD+cGN/PwqWj9NssLmcIYb9bCoC/9sKo7v1zn8y3w2sWOCdW6b63q
         bedHbn2DYeHrFZvVqQKBXTDL8C+GKedhKQBErf32hpBNLopi6/ErTbwqT8ArJZI8Vfy+
         /vBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509723; x=1795114523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=;
        b=gxp5pYKY/shS66A0Hd+PhUru0b8vFNqmO92IN7z9auZ/t9BKko6g2FV2u0WlCAMKxe
         u263yg79YIXo6u1m54VJMtbBkcZa8rDE0HuINnIuMexO0gOyuQJfVVF/cL53mLOCLRU3
         XU3LLqnwaMIxTlPtCsYfvDNsmGcITUB90uUD9qwgR6uQbNLleqjVwlVNw/0hpwJ9wKm/
         /rUoJPsLVeivCodTJm6hUCL2+zH6RS8cANubI9QqFDQU1AGTNh+o8EBYMaA7wJyjtjiR
         +UmAdh0kzziNhZd3/hnxvM5B55dQzEHxBqqRqBF9Yvgw6Qsk5UfuUVy7twonq1nDIPpu
         43Ow==
X-Gm-Message-State: APuU4Z9zwPYiwaSPKsmBEWUXFMKP202au1aej6IBppLwmgcjp4x903g2
	qBTqHJUc0ucgB69tjomQMC9NISTddkZSFrhdrRN2IAG9zoK/T3wkHcJF
X-Gm-Gg: AYBFou0Gsnt4RljbPOGTP3PWvBz5tfTH8ayurUAg3HYhUD4IiKvREwEuw76n8R5SaE5
	RdDPe/ideypwraFsA0YTh0Oi+PZf+QVxWB0k9BYnxVF8uiEr3Lxcx68HKJ3dFbqo0YdbedxsJeP
	oLCOGDFrgPvR9MndMovRk+wE5XUZsZ8sEjRJ6meCSUCL8ZV6XLtYN0ttrQ15rdw4Dd7blrkc1ia
	wWqcRrpDGI7t4nnOhRMq3d6J83YfDvw09+H30X1jHzBcjXjQfGyXvs+12aT0urzWXDwI5oYQGPL
	epvrV0YZnK+6hAtmn+ZN9Jdp/rQeWCB+Q0t9kpkHuufInLoTW9W1s0WWOAZl0YWa67T+1haAmSa
	osTs4xGPY6i4GMGE4gd+1Fvbyus3LacuvZhaii3oKoLLhfWJVt2COFtYokTCDHKIzcxGsoI+FiA
	SM2X1yZxypg/gwpStc48NMNhpHM1EuuR5VtJfa4kesdsYFRTCerI7JBYiR4tYM16JfCZVyiIYhb
	ouhNxZYi9t3P/3DOsUzC2yeHbiu4xwq1GtjKgFcwc0VRjrOkwJFy4e0pRtrH2YNkhIebe7RQ0j9
	C2GovqbXRkmA9yA/x9cxrqVyvmOTUTBHyFpwrtvV+Xv0sZvrXTnHH2eqcAGh+qUe85LXlxsyVRY
	JLOP7vy0=
X-Received: by 2002:a05:600c:354a:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb55a61152mr3023845e9.5.1794509722810;
        Thu, 12 Nov 2026 10:55:22 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:22 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 22:55:08 +0400
Subject: [PATCH v6 1/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-timer-updates-v6-1-fd1cea645d1f@gmail.com>
References: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
In-Reply-To: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4597; i=alchark@gmail.com;
 h=from:subject:message-id; bh=EnyVwDXCZhJWH17WUOtGzbF79lP3UqVzlI+QeOXtwgE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR94566fN/rX09CX+SE+N1+sltrHncie1l+zM+0u0c3B
 gve23Gkp2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpvsvI8D923c+Yj1skqsW9U1b5zJ9wOOksR5e1QdGZJdV27QlPtC8wMnQvPrM
 m5HQX640vBQ9Kdz+TeG45xdhw/fmr50XuLGte8osTAA==
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105526_826588_8F24A0C1 
X-CRM114-Status: GOOD (  17.55  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add defines for the timer registers and their bits to make the code more
self-explanatory. While at that, replace _VAL suffixes with more
intuitive _REG suffixes on register offsets.

No functional changes.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/timer-vt8500.c | 62 ++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index a469b1b5f972..c4694cf8bea6 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -24,15 +24,28 @@
 
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
-#define TIMER_MATCH_VAL		0x0000
-#define TIMER_COUNT_VAL		0x0010
-#define TIMER_STATUS_VAL	0x0014
-#define TIMER_IER_VAL		0x001c		/* interrupt enable */
-#define TIMER_CTRL_VAL		0x0020
-#define TIMER_AS_VAL		0x0024		/* access status */
-#define TIMER_COUNT_R_ACTIVE	(1 << 5)	/* not ready for read */
-#define TIMER_COUNT_W_ACTIVE	(1 << 4)	/* not ready for write */
-#define TIMER_MATCH_W_ACTIVE	(1 << 0)	/* not ready for write */
+
+#define TIMER_MATCH_REG(x)	(4 * (x))
+#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
+
+#define TIMER_STATUS_REG	0x0014
+#define TIMER_STATUS_MATCH(x)	BIT((x))
+#define TIMER_STATUS_CLEARALL	(TIMER_STATUS_MATCH(0) | \
+				 TIMER_STATUS_MATCH(1) | \
+				 TIMER_STATUS_MATCH(2) | \
+				 TIMER_STATUS_MATCH(3))
+
+#define TIMER_INT_EN_REG	0x001c	 /* interrupt enable */
+#define TIMER_INT_EN_MATCH(x)	BIT((x))
+
+#define TIMER_CTRL_REG		0x0020
+#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
+#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
+
+#define TIMER_ACC_STS_REG	0x0024	 /* access status */
+#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
+#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
+#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
 
 #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
 
@@ -43,11 +56,12 @@ static void __iomem *regbase;
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
 	int loops = msecs_to_loops(10);
-	writel(3, regbase + TIMER_CTRL_VAL);
-	while ((readl((regbase + TIMER_AS_VAL)) & TIMER_COUNT_R_ACTIVE)
-						&& --loops)
+
+	writel(TIMER_CTRL_ENABLE | TIMER_CTRL_RD_REQ, regbase + TIMER_CTRL_REG);
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_RD_COUNTER &&
+	       --loops)
 		cpu_relax();
-	return readl(regbase + TIMER_COUNT_VAL);
+	return readl(regbase + TIMER_COUNT_REG);
 }
 
 static struct clocksource clocksource = {
@@ -63,23 +77,25 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 {
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
-	while ((readl(regbase + TIMER_AS_VAL) & TIMER_MATCH_W_ACTIVE)
-						&& --loops)
+
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0) &&
+	       --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_VAL);
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(1, regbase + TIMER_IER_VAL);
+	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
 
 static int vt8500_shutdown(struct clock_event_device *evt)
 {
-	writel(readl(regbase + TIMER_CTRL_VAL) | 1, regbase + TIMER_CTRL_VAL);
-	writel(0, regbase + TIMER_IER_VAL);
+	writel(readl(regbase + TIMER_CTRL_REG) | TIMER_CTRL_ENABLE,
+	       regbase + TIMER_CTRL_REG);
+	writel(0, regbase + TIMER_INT_EN_REG);
 	return 0;
 }
 
@@ -95,7 +111,7 @@ static struct clock_event_device clockevent = {
 static irqreturn_t vt8500_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evt = dev_id;
-	writel(0xf, regbase + TIMER_STATUS_VAL);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
 	evt->event_handler(evt);
 
 	return IRQ_HANDLED;
@@ -119,9 +135,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -EINVAL;
 	}
 
-	writel(1, regbase + TIMER_CTRL_VAL);
-	writel(0xf, regbase + TIMER_STATUS_VAL);
-	writel(~0, regbase + TIMER_MATCH_VAL);
+	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
+	writel(~0, regbase + TIMER_MATCH_REG(0));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {

-- 
2.56.0


