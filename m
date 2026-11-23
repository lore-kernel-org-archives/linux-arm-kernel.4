Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50440606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sBa0AZyj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOYfqiaH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1kgjCZJ8nKKX16FqAvd18yEVyO1lfwN7tM9UW2vB/JI=; b=sBa0AZyjZJodHv
	yu3i8DH5OpbvBE87Ldxnn8buUWR/WTbS4PxYYD07AlDMyATLF/dp8142NcGUj01rKTUb/dOJ0FMzq
	nBhWTsUrhtFfONIW1Cex/G1rUVFE4eLVZWYirA+CxyfhG8v23qqca+8JvsVTgdLkaKGFoWgl6XpWp
	0QUV0eIbDN2tQZE/j7F2Z7GbyGPndnwKS9jRiYu1F43B+2nUE9dnH1tfdD6PnyjUyLFFXa71ycCgj
	KbrW4gsSY8IK+CFKx/d1S5UkF0ii/RbRk+uiJ1Lw+VrlM3TK4sY2Ezmyr9wjnRv/lBVZF8xL+x2Ti
	VdzufIG5bYQG8wJLC3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOtG-00000002VJ4-1UBZ;
	Mon, 23 Nov 2026 07:55:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOro-00000002V4A-0aR4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E03894181F;
	Mon, 23 Nov 2026 07:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04BE1F000EB;
	Mon, 23 Nov 2026 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420415;
	bh=1kgjCZJ8nKKX16FqAvd18yEVyO1lfwN7tM9UW2vB/JI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cOYfqiaHCqKz5KHb6ipksV+yDpdHw/eu3V3jjSWiWX/g+UlIlVu72IEHo9UqiD2Sm
	 9W6FIvamutDPvxfM/68kZo+125IP9JX7Pc5aMwNtw1CVFg+yHKlTVPyNprCZqHiSHG
	 iTCQ2f5UZeKCTY9KzMnwi1AlwCIwD55yRRZlBtEOnw3ZW2qZO83oZrjTyuiiHUQDeS
	 lwVNnuTcZfJ5hf4ES9HEMdWRuOzCtzZgPFCBFK5Jj0976i7FS3YBBqfLbCAp8grlBv
	 qspDCks6NNr1/JrXPgzPdANK9F0U0dgZFlCsF7AdqnEGZf1+M0w0rnmHb0haMbS86r
	 KiyIm1RRIgR+g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chen Wang <chen.wang@linux.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 1/5] pwm: mxs: Return early when disabling and fix error-path clock leak
Date: Mon, 23 Nov 2026 07:52:51 +0000
Message-ID: <20261123075320.379664-2-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123075320.379664-1-lee@kernel.org>
References: <20261123075320.379664-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When disabling a PWM channel (!state->enabled), the PWM core permits
state->period to be zero.  mxs_pwm_apply() currently falls through into
the period and duty-cycle calculations even when !state->enabled,
causing do_div(c, state->period) to divide by zero when state->period is
zero.  In addition, if the requested period exceeds the maximum divider
(div >= PERIOD_CDIV_MAX) while the PWM channel is currently disabled,
mxs_pwm_apply() returns -EINVAL without disabling and unpreparing
mxs->clk.

Handle the !state->enabled path upfront and return early, balance
clk_prepare_enable() on the -EINVAL error path, and check
pwm->state.enabled directly rather than calling the consumer helper
pwm_is_enabled().

Fixes: bf29c2ff82fd ("pwm: mxs: Implement ->apply()")
Closes: https://sashiko.dev/#/bug/linux-710f863f-6964-4e4f-990a-e5043dbc1a87
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - Check pwm->state.enabled directly instead of calling the consumer
   helper pwm_is_enabled() (Uwe)
 - Drop Frank Li's Reviewed-by due to code changes

 drivers/pwm/pwm-mxs.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/pwm-mxs.c b/drivers/pwm/pwm-mxs.c
index e1a3df6549fc..768401b23dbb 100644
--- a/drivers/pwm/pwm-mxs.c
+++ b/drivers/pwm/pwm-mxs.c
@@ -56,20 +56,25 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long c;
 	unsigned int pol_bits;
 
+	if (!state->enabled) {
+		if (pwm->state.enabled) {
+			writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + CLR);
+			clk_disable_unprepare(mxs->clk);
+		}
+		return 0;
+	}
+
 	/*
 	 * If the PWM channel is disabled, make sure to turn on the
 	 * clock before calling clk_get_rate() and writing to the
 	 * registers. Otherwise, just keep it enabled.
 	 */
-	if (!pwm_is_enabled(pwm)) {
+	if (!pwm->state.enabled) {
 		ret = clk_prepare_enable(mxs->clk);
 		if (ret)
 			return ret;
 	}
 
-	if (!state->enabled && pwm_is_enabled(pwm))
-		writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + CLR);
-
 	rate = clk_get_rate(mxs->clk);
 	while (1) {
 		c = rate >> cdiv_shift[div];
@@ -78,8 +83,11 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (c < PERIOD_PERIOD_MAX)
 			break;
 		div++;
-		if (div >= PERIOD_CDIV_MAX)
+		if (div >= PERIOD_CDIV_MAX) {
+			if (!pwm->state.enabled)
+				clk_disable_unprepare(mxs->clk);
 			return -EINVAL;
+		}
 	}
 
 	period_cycles = c;
@@ -101,16 +109,12 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	writel(PERIOD_PERIOD(period_cycles) | pol_bits | PERIOD_CDIV(div),
 	       mxs->base + PWM_PERIOD0 + pwm->hwpwm * 0x20);
 
-	if (state->enabled) {
-		if (!pwm_is_enabled(pwm)) {
-			/*
-			 * The clock was enabled above. Just enable
-			 * the channel in the control register.
-			 */
-			writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + SET);
-		}
-	} else {
-		clk_disable_unprepare(mxs->clk);
+	if (!pwm->state.enabled) {
+		/*
+		 * The clock was enabled above. Just enable
+		 * the channel in the control register.
+		 */
+		writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + SET);
 	}
 	return 0;
 }
-- 
2.56.1.750.gf70dc682cf-goog


