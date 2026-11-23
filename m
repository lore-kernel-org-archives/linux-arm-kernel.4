Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52545606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rggH43WO;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=3GE/Ksqf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MeOL5WQuiPJrRNxkrcCwP2WQz32GfGwFwheiNLPGmRs=; b=rggH43WOx/KSrS
	QvoItPk0fAhNe9+aqRM0A+KrSZVflVI7qLmaz7NPNTUWlXYprHPAJVehmKwMf8nSn+XVgI46Xq9pL
	mKtC4NdzFvS5df1BgipBHhetDCDNZj/OeWdKw494pXX4xhkIdDBKrL6qLcAXgf44cv4PoLmMtj5Xl
	bned21pSW1B7hH9nz8v01avHk8DvpSsaMr04WdajZWkVWKW7kG+kS97m1j4anAnH+iSCDCL1M4zHd
	iOI988GiEp+Yvg+7p3hDzpprphU61gJwX6DmZQrW+UDi9tKSdfoyIMmbNMmQMMmaZiVsEmX+hZ0Qi
	0XGI8PR2OtNdZtZVeD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVajs-00000004rNQ-2ZY8;
	Mon, 23 Nov 2026 20:34:12 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaik-00000004qdj-2vLr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=MeOL5WQuiPJrRNxkrcCwP2WQz32GfGwFwheiNLPGmRs=; t=1795465982; x=1796675582; 
	b=3GE/KsqfC34qbBWNeQisC2s71GUQdYXRT0p/bZD4OEA5KJh2EH2ktClCvuTr9TU3f9BxbEkimcZ
	/GAFXHA5jpuMGqx3O5og2l2yMl60KQ6hPYn27B6uqOB0fFzdUBfWbeY0HOYz8a4oAcGuaZPGbtwQw
	B5IWJsHZbHc6koK4hS0RGcyOGqKH28rB2tTJZ0rLeJT7Ejy8E90WsuC0IT2+gXbJ3wE+hup2A7t1f
	fGK2Tz1x9OqdWmn1J4tAZ7hM1cFbO3rhb/rY0tqZo7mT8M8ajvQZqx0wgD/BrmWnmcp1IcoR7/NOp
	KNPEaJfPr/IPqyM/hTwsizjityf3Es2Wx+nA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 23 Nov 2026 21:31:20 +0100
Subject: [PATCH 2/3] timer-imx-gpt: Allow 32K clock to be used as a clock
 source
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx6-idlestop-v1-2-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
In-Reply-To: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
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
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=OMgusFlYnyHNaF3mFmXvpoVMfUD10qiEbL98nAnPX60=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKKx0JnQSzWfDoJjNNYZbebVRLqsRoHC87Iu/
 wxiPP28pJyJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSisQAKCRCEYUX6QCjc
 8V+MD/4tj/iELyGTEIUG5cntzZaNXrbq8ktvputcge1aQ5MfnhJxBlMc+3KmmaWjVqBP2VauODu
 8uKlX2wy0kytjdUeL7WmO6cZUVVF7fsGsHBb4cfEdcf8u5V/WFUvN936f88rVBlWRy7Z+WlgHuX
 JOtlXQpe6/qEt3994+vdGQhyjCO/XpPm7EIfB5PA87gA4t5hWUGdJWW1I8kBuAcrafriGH9PkV1
 vz6pPDjHmhwqAxDNY5fOoxL3+6eG7BNwd9aHhRHXVfOq/NLxjE+iysd56KG+ctfyRrNQdGrTOJ+
 PSeDinod5Tu/icJBA6opBY+L95V8cCed5iPL7x79vPdI/jku/1GRRb/p3136u9eM0ZwZVu3PJt6
 m7eNLb8fKs0n+Uwj/ebH9IusKaqZndywD7dlyXxgtoUQ7b/cP640Pc2nSE+JxNSDrhFpQrjL/X8
 DZ2aZpQ0QQDVv/BeizU9GD8aSegNcqqYXVA+tC4MeZdVKCJdQEFUMM5eIIuDyDtW9eR6k69XjyD
 JPnW1BjNvH/uUiNZhYczZr/1V43zi7zVzMeCQg0qgaBNhC1Vyyx/bxvJ89kLdPowhQh7O9zE5pQ
 Rtp+zf/s23N2boQLuCtgCaFeQL8dCFxNfsMX7Wmayf5mZUckpSvx/r18L04NueLBnplvfZfI/yI
 ZDVrCauXF9X/WFQ==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_123302_932242_D1B575C5 
X-CRM114-Status: GOOD (  12.87  )
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
 drivers/clocksource/timer-imx-gpt.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 8335bd7f8c6ce..3c023da565564 100644
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


