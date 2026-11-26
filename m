Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ADB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qYWB1vbp;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=9k+i9xfd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9IdHMMbuye28MG1N1+EIFoZNhCivuWQFrrAdjyqCNjo=; b=qYWB1vbpdivcWn
	HsUBh+NO5I8hEltdEl+JmAOlqYtZYSMG4+/gKCJkvQxuQoww+hTIOuR+C/XkQ+SIrFt5aC3fOsBNJ
	a9hH/rTFG4g6lJIOudaDf+AOsPgjQA0n8IwRZfyCX/sDO3NICY15UPfbzZrcwT/Me5dLUTXPITGch
	BwLsjtmCPgApcqBlLfMGJbvb2cAiytkmm1uYXC5VYq7yYvWhoxupaSO64HtNv4T/IPfCiAhmMfNSw
	k5dFji+W8NvI9KgzAHOyVjRveVh8b0dUSDTK1CyqI1wdPW9vDbLrx6Yfo+D4EiJghuMKDtIMexXQc
	zq2kLhpctvEGDA7QR1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXFg-0000000CnaX-47fu;
	Thu, 26 Nov 2026 11:02:56 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXFd-0000000CnYf-3var
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=9IdHMMbuye28MG1N1+EIFoZNhCivuWQFrrAdjyqCNjo=; t=1795690973; x=1796900573; 
	b=9k+i9xfdNnynQasMAh6d6RogYMnWWxBJ/s9OZJYXfuwMJP6cUP54Di/RPRzfRBrUwCJiHqP+J9c
	vi7XAebHTdTWGi8x+aegEUZievRtI+jY7BRwBSJX70dYnPWWHO9MvDRjayNDalCIOEZgVsAOtNuYg
	AMEafJa5ZRrSf5D06QKhoJpy9Hdn3tnzJ3VMh+xVIdsKtBwGyifgdlEL0X83YlwbkmYZYDAR3XXpG
	sQHF24yPNi9DTtzXSiayGWAYCGgapPl8USXZbwhZ/gkZdL53fDHghjTXhMNCAP3Z9Y2Hp3CGFz9PB
	5SA5WSoqKUr0mjxDBch/flcFDVlKxolDSJQg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 26 Nov 2026 12:00:55 +0100
Subject: [PATCH v2 2/3] timer-imx-gpt: Allow 32K clock to be used as a
 clock source
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=2586; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=0tK0It/89Mk1v8dt4LN/eij+sq22nwXBnCv/qcnypmA=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBG8ghAnJK74UD2DhFiwPDN8rbNLchU+k8vxF
 8E8guv9xTKJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRvAAKCRCEYUX6QCjc
 8Y1lD/4kc436aFhE40SpSwZ0oxIDQ0Au2qpEokCgreptv67OD//tKduETpSG5Sa+/BDEKZEHJrU
 0Iniv5C4fhe0D0B/Kzwv2pqSuBNIPVKL4kPxcgUq6C85FhcVQ0r0ZTNF3YG0uPY821DjqOHRp0P
 Jr+xIpC86nIeK5GZiuEorldh3rhtrmXZkjZBHZdrz8Mt2HVyqDQxLhk+fE2QAwGy93F/WhoKgRm
 /1Bo9YIWjCND6t5UiE/GN5Ewr39TwxL1v4AVc9s7QV0NSTQGQV/Wbp8FvaO+Szq53TrYlXm+DZa
 gHXDgrcFLOHDMVjG9ZI+mgfkyzEqRVPE5X7Ofuc4yapfhvp264ertoOeyyaXhZa9gAWze85BVpx
 E2SkKHDmtoYNz8h6zzCyHhhiiYdJ9V5/vpgUwQMrobMG8bIfsW2rdm7zVtq/90cCyAt02OE4JwR
 bzh9SyTR/rP61eacPnqXrgCPz8Me8vmeTCCQsQl09QAxZ4uNUp1ARuexIJk+bDrpc7sMCMUeQEk
 lFIJdDkw5zM4mUAeCSVK496y8Py+TaVGVnNMrm/HTJ40y7o2BT4CNCplyfQ3Ho21ANF5KfYIRBL
 tKv+gSz5VwRk4waAahFKsjZsNovdMijRK2eObPxQhfltC3vtH9HRLTcgXmSMvgnI4KlhqCXnGcg
 vJFfRFhBa0qvVvg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030253_981690_5AFCEC2E 
X-CRM114-Status: GOOD (  14.38  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To avoid depending on PLL infrastructure for timekeeping, prepare for
using the 32K clock by configuring the clock source accordingly.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/clocksource/timer-imx-gpt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 8335bd7f8c6ce..85fd36fe1c760 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -50,8 +50,10 @@ enum imx_gpt_type {
 
 /* MX31, MX35, MX25, MX5, MX6 */
 #define V2_TCTL_WAITEN		(1 << 3) /* Wait enable mode */
+#define V2_TCTL_STOPEN		(1 << 5) /* Stop enable mode */
 #define V2_TCTL_CLK_IPG		(1 << 6)
 #define V2_TCTL_CLK_PER		(2 << 6)
+#define V2_TCTL_CLK_32K		(4 << 6)
 #define V2_TCTL_CLK_OSC_DIV8	(5 << 6)
 #define V2_TCTL_FRR		(1 << 9)
 #define V2_TCTL_24MEN		(1 << 10)
@@ -271,6 +273,7 @@ static irqreturn_t mxc_timer_interrupt(int irq, void *dev_id)
 static int __init mxc_clockevent_init(struct imx_timer *imxtm)
 {
 	struct clock_event_device *ced = &imxtm->ced;
+	unsigned long rate = clk_get_rate(imxtm->clk_per);
 
 	ced->name = "mxc_timer1";
 	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ;
@@ -281,8 +284,7 @@ static int __init mxc_clockevent_init(struct imx_timer *imxtm)
 	ced->rating = 200;
 	ced->cpumask = cpumask_of(0);
 	ced->irq = imxtm->irq;
-	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
-					0xff, 0xfffffffe);
+	clockevents_config_and_register(ced, rate, rate == 32768 ? 3 : 0xff, 0xfffffffe);
 
 	return request_irq(imxtm->irq, mxc_timer_interrupt,
 			   IRQF_TIMER | IRQF_IRQPOLL, "i.MX Timer Tick", ced);
@@ -314,14 +316,19 @@ static void imx6dl_gpt_setup_tctl(struct imx_timer *imxtm)
 	u32 tctl_val;
 
 	tctl_val = V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
-	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8) {
+	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8)  {
 		tctl_val |= V2_TCTL_CLK_OSC_DIV8;
 		/* 24 / 8 = 3 MHz */
 		writel_relaxed(7 << V2_TPRER_PRE24M, imxtm->base + MXC_TPRER);
 		tctl_val |= V2_TCTL_24MEN;
-	} else {
+	} else if (clk_get_rate(imxtm->clk_per) == 32768)
+		/*
+		 * if powered by that always on clock, it is feasible to let
+		 * it run in stop mode, too, allowing lower idle states
+		 */
+		tctl_val |= V2_TCTL_CLK_32K | V2_TCTL_STOPEN;
+	else
 		tctl_val |= V2_TCTL_CLK_PER;
-	}
 
 	writel_relaxed(tctl_val, imxtm->base + MXC_TCTL);
 }

-- 
2.47.3


