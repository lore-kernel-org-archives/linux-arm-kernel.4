Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB4606B57E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b86/gJgn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuS1RTt9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=; b=b86/gJgnE08S3k
	2SyxXFsoiVDOatvjmtYXyUnpvREDeVC4dn6ryT8DuBpidXO/XOcu1sen7CKju3B7h8mpzYI3UvOfD
	xpuNrLjL5moJhBrEJ9/zoxLbPptfHSeZ1lxrcCwEFn0Zs5aLFsKKKunJ7qrR7hpVF37LGvLizLEwK
	TKwJ3aSflGeW2qU5PJnc0nunCeCOSxDRjJMmiXuiejXMxJGfD+hagh+/WavxVuwcYNLh0WTVgQrKD
	hixYLZnqnUmrnOTaJBW0IVul+JWmvAPKSRxzZib2CmtH8j45y1Qv1WkQKBNE4TTGKgDohXJl/5ODZ
	pYBHtoPryLzZqZ6gJ7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrHJ-0000000CvVF-472b;
	Fri, 13 Nov 2026 13:25:17 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrGx-0000000CvHq-1M0p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:24:57 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c247f6687dcso241153666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576294; x=1795181094; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=;
        b=fuS1RTt9H51RaWpYaFdQfsVPGHbCn2nxYvsd9ZmvvKTX6aAvSj2epjFFNPB7toql2N
         OWIyrBS4euhzlFhwRRh9YaP3FBqUQwqbvYsCfsOrwuQHgHsnx5nsU+9qIrvhe3L1KoxD
         M2cVLg1F8y6bj1zxt00vpvz7S8YNBc7CgdBCCQ2oQGJsFxdpTVJJ8LxsvWIpEq4Ks1RW
         oM0npDXflS3H2EJaSTYoJZmY9ws3cGUdleSj37Mw9eJX40nc+ipH+EwyBq1PXhuncep2
         GdlloPvIfPFzKWpAeFOUiqtWqHmE0041qBH0aNs+Ob61izeI+z/4ARBxIHbk6PW8PMBX
         Ywvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576294; x=1795181094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=;
        b=xA/GIvLCEE6n/S1o6HtfT+bhb7MVvmbMgMDJKTlPg7Vh7XHxDkcRppFgJBs5sYJf+U
         cFAnCgB/dEdSMWHGWbSSonDzVEdQtTSuyt3ZCn2YQbChA1sk7k4dCLc2D8iIywfi/j0I
         MdnbiuFAfa+fGca8iSczlz74MojBfLln8VamrUbxcQFz1oPZzA+/K6pUmWXcqulzcW4N
         jV/xabfGbkk3cguE+D18KIrb6c9xCSyF+zSs0AoTV1TUQpH0VOWpwOS7o5tk7Naz7z+O
         Xg7sAruEnfchwxnItwd1ZYzbBAh8taAr9Rkr75p0W5Hj+cKCsb2Ifc6ol8f7LjH5CgIA
         gLXw==
X-Gm-Message-State: APuU4Z/0PtpuRXAVdpYAxlGZtfctnCxmfmnUdCALi/WVsvUp0RLT9jqf
	G0iqQ2bdMUpLLR07JX6KkJOr/KklnmeVvVWcnwJVeuFeyIQUHfraieN+rlQGd+WAvEp84Q==
X-Gm-Gg: AYBFou3B0TVer60fJEDr0ddWy/4g0OT13I68ofK1URZmJ8OlIZQSjV35KbJAmgaelKs
	QuxbgJJbWNg1TiVW8IlFirUj0yGJVbNTM4myafqluec1eTKoyP9ZLEJAPkwR/VXwEzYKxBpzp9r
	iNdhdsjS87o/BzEQDJ8hDoFL+lghtXQk8cnVI3SYlG8DbF6tUw2qYCfijfnFb+26LdKKDn9w+ui
	pXaFYjf7TkfuAZHvxBT3rOEbhZrsN/EnLxbKDUK2COM6pRwLzHk4QNbL1/dIfkYyi12qWuVAKfY
	Wlno5JC42xNZkle6iEL6U+CVxIDxnqe2RMg2k3I8ujCNZZ+vj/oUvqJGxulMwr+9GAtOyBLZhr9
	/Fpx5zmrsLTZY1qFJjIXJk38zZAjSBCvPCVeD2yIwIiDYL8AdHUZfX1fSwau76QhITzVVpk1Dkh
	UdzLSRYJN+tqeGfR0br/DqkIKQYeQPJhwCxyOhpnYJ7EoTwcb/OgWFodCGbwDZs7YPtGp28RGuV
	JMnuiCDaPQ6V41KwM6UpS2WJ3Cv9qhkRJ1fj3a5ARZ8C0SS6NUccl19U+xUYGoMvOvd4ygyxY3U
	CPVhBVXHKgXFDrUss2ufggL3KR5Rqfp8Fflh7GUY135PbortaGA38niN8ZQfDy7tq61w/nHba+J
	Ds4iFyng=
X-Received: by 2002:a17:907:72cf:b0:c46:5c4c:7f66 with SMTP id a640c23a62f3a-c5096398aedmr209183166b.14.1794576293494;
        Fri, 13 Nov 2026 05:24:53 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm4680211f8f.57.2026.11.13.05.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:53 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 17:24:40 +0400
Subject: [PATCH v7 1/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-vt8500-timer-updates-v7-1-a1dcc4031b12@gmail.com>
References: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
In-Reply-To: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
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
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR951+QUrd19pfLzkqLblypmLST4f6m2XmtfR+fux7w7
 Bdv+bGWt2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpjvFh+MPDJnIulv3pBWHtK8ytR5+9CszfKzTDNXR/zft/2S2+HE8YGSZs3/r
 BevexQ4oqh5pnVWZe/7HwSMEcp1/2rl3vO4TZjZkB
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052455_595772_E7B9C211 
X-CRM114-Status: GOOD (  17.25  )
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


