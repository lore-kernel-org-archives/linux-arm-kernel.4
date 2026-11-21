Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C553D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=puczxKG/;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=pElU/YCg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jK2zYQmh64qPZi1PcNYWIZ+ueibLnSi2h0M89dZtMcg=; b=puczxKG/NtAjDA8u9bngDtq1Tl
	gYkIqbMwAz3qrGQ/MiQG5xV8OtZFMfW+SxsgHKwY716n4QU6SBMowK8pWzKVN15eAtKbZ1hiLxKu9
	bIqxyuwyfUvXooddrEDvZfyvVfErm5l3TMP4ffpgFk5RpE7I6vxdZgWWL1GI2gMtwHK9h/gpoEqJE
	KbDDhUjIKhW5nAceTsDdYKM4aHYi2JCz7vwlSViwsEiE8I+CBZdAO+2bnqrd2NWcfEse7DvN3L1Cf
	yGRSp9pbrp0FyRp7njUHuSdoOY0jhEi0HWHoDAxXhTVy8B10TBOIrw4aSiYwTduowJWiXnu7DFRD1
	4xk0jt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUf4g-0000000GowR-4AsP;
	Sat, 21 Nov 2026 06:59:51 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUf4d-0000000Govj-3q6v;
	Sat, 21 Nov 2026 06:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795244382; bh=jK2zYQmh64qPZi1PcNYWIZ+ueibLnSi2h0M89dZtMcg=;
	h=From:To:Cc:Subject:Date;
	b=pElU/YCguCeDHzYXiYZAXUWSu5OfRdfp7/zbiybcDOhKx5azB2T2jpb+9bNDBA4za
	 VnUdqYjCWEiVCuU0MJ9cRH2F/36K/fzlq5u5YEtx9nkPZ37wC4Q70bE8/dlEtpHBUt
	 HQT874azzwFBb5MmZy7AGV/OiYG9HVnWsVXZUTRE=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id EE72042D; Sat, 21 Nov 2026 14:59:39 +0800
X-QQ-mid: xmsmtpt1795244379t6zcn6lw1
Message-ID: <tencent_27C5A1EA3CF33BA5221F7F01A066E92BCC07@qq.com>
X-QQ-XMAILINFO: Mpt5V4XGwnFy4a/nabu402ZCgr4HCjbav7E+2nIRO5S+M9bW9j16AgO0eYZNxO
	 Z/QSlGGFAV96WP9hht/6bqcxhLGoaztLNOYmXxy/3oIqdNhSwMoL0N1Ay1ELmbXRBQB0XM0Gix8k
	 mYFlVQIRKhdEe4hRWIF8JqVcmuj7xapfA/4+QJsSm+sUFi59otfV2fHOjSYlN4PJBoMgoJcuJoWb
	 MgnjNVsIuIQ3XUaWbe6YP+L2+bf7wN0F27uxwmrxnM+WVNdaFdRco3IyTplKdplG317qZH8NX0SS
	 fQll/9vJGL9uB1sxzfDRZTgD3I0bVuc5IcdSD9C7ZVW2cWNovWUHKlTocpuBAglOB6cbAPtMmTKR
	 xqHGMKZc1nE5DtCnAzRyejjiQNQ6FVhIMEKjmOYCtUH6GRR0CAig/F+7aKDfDdKRe7oht/UiTrAU
	 WP/Rb6vHcoClZL3Aw4Umaqiwl1wNaZiYcrKMU+bjXE8XLm2Zoclzh7aJ/ZUpHcSNJ+B+3CYM1P51
	 Hd8TRKzz2ixnJqXD2CY/sYrcpD62cPLyTHDoBajmBgJBlutHGYXURVuvB1An6jAZJrUyAjOi0y2k
	 hCYY3rbXwJDbk320sclhaLTK2aHDWlHfhR436O96XHRRqwruVVEo++iNvUJhA57qlUHdC29cBU/Q
	 YBbPVi828deqwxn4CbmVAsIFyn8G3yThlhF5nzHmt4gIOyWJc9DUfLjWKX+LYqhDfDNLTW6tu8zM
	 /MdCVpvtjYnDl4EUOZiIW0Mjckp1ASLOe/0uGvMpRuD+QUNtZRK7DzbKD4E9BClSMaQk5eqq7QmN
	 NGB3C6VeuWiHE5tHLuIda/9k/XhOVG+bLomj1Uj/MUNBAlXNg3O45aTH0wrIM/hgesw0WxzL73Hd
	 490qOg6sbyb39XeFCm7U9FKmLkBwzvQAnTwF3W1sTkiHFI8DXGCi6/ZWhZdL726oRk8xACoGo2c8
	 jmqahsEIWIZ62rvzD9ugzWGn95WB8pPX8/XnOHmnfZLvXrcquQm3LvirycHSy/Uwp6BmQu0qwLAE
	 YCmGaDvNCLuVxs2bqEH8didhEX23RFne4vGPymTz9S5RLy/5WBrlHL83MISIyPGeyFThp8fKPfAU
	 osIy+e+vo/BXm0oDttX02Dq6h4dG0Q52/rGx2DUUVOGYxqj1k=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: ZhuXiangyu <1194781887@qq.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 1/2] pwm: rockchip: add PWM v4 support
Date: Sat, 21 Nov 2026 14:59:35 +0800
X-OQ-MSGID: <20261121065936.1125919-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_225948_408071_2B424DC0 
X-CRM114-Status: GOOD (  21.58  )
X-Spam-Score: -1.9 (-)
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

Add basic support for the Rockchip PWM v4 controller found on the
RK3506 and RK3576 SoCs. Compared to the earlier versions, v4 moves the
enable bits into a separate register, uses hiword write masks for the
control fields and latches a new configuration with a control-update
bit.

Only continuous output mode is supported for now.

Tested on an RK3506 board with a 100 kHz output at 40% duty cycle,
including enable/disable, verified on an oscilloscope.

Tested-by: ZhuXiangyu <1194781887@qq.com>
Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 drivers/pwm/pwm-rockchip.c | 146 +++++++++++++++++++++++++++++++++----
 1 file changed, 130 insertions(+), 16 deletions(-)

diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
index 050ca8aa..aa89f23d 100644
--- a/drivers/pwm/pwm-rockchip.c
+++ b/drivers/pwm/pwm-rockchip.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/math64.h>
@@ -31,6 +32,27 @@
 #define PWM_LOCK_EN		(1 << 6)
 #define PWM_LP_DISABLE		(0 << 8)
 
+/*
+ * Register layout for PWM v4
+ */
+#define PWM_V4_HIWORD_UPDATE(v, l, h) \
+	((((v) << (l)) & GENMASK((h), (l))) | (GENMASK((h), (l)) << 16))
+
+#define PWM_V4_ENABLE_MASK		GENMASK(1, 0)
+#define PWM_V4_CLK_EN(v)		PWM_V4_HIWORD_UPDATE(v, 0, 0)
+#define PWM_V4_EN(v)			PWM_V4_HIWORD_UPDATE(v, 1, 1)
+#define PWM_V4_CTRL_UPDATE_EN(v)	PWM_V4_HIWORD_UPDATE(v, 2, 2)
+
+#define PWM_V4_MODE(v)			PWM_V4_HIWORD_UPDATE(v, 0, 1)
+#define PWM_V4_CONTINUOUS		1
+#define PWM_V4_POLARITY(v)		PWM_V4_HIWORD_UPDATE(v, 2, 3)
+#define PWM_V4_DUTY_NEGATIVE		(0 << 0)
+#define PWM_V4_DUTY_POSITIVE		BIT(0)
+#define PWM_V4_INACTIVE_NEGATIVE	(0 << 1)
+#define PWM_V4_INACTIVE_POSITIVE	BIT(1)
+#define PWM_V4_CTRL_DUTY_POSITIVE	BIT(2)
+#define PWM_V4_ALIGNED_INVALID(v)	PWM_V4_HIWORD_UPDATE(v, 5, 5)
+
 struct rockchip_pwm_chip {
 	struct clk *clk;
 	struct clk *pclk;
@@ -43,6 +65,7 @@ struct rockchip_pwm_regs {
 	unsigned long period;
 	unsigned long cntr;
 	unsigned long ctrl;
+	unsigned long enable;
 };
 
 struct rockchip_pwm_data {
@@ -88,13 +111,25 @@ static int rockchip_pwm_get_state(struct pwm_chip *chip,
 	tmp *= prescaled_ns;
 	state->duty_cycle =  DIV_U64_ROUND_UP(tmp, clk_rate);
 
-	val = readl_relaxed(pc->base + pc->data->regs.ctrl);
-	state->enabled = (val & enable_conf) == enable_conf;
+	if (pc->data->regs.enable) {
+		val = readl_relaxed(pc->base + pc->data->regs.enable);
+		state->enabled = (val & enable_conf) == enable_conf;
 
-	if (pc->data->supports_polarity && !(val & PWM_DUTY_POSITIVE))
-		state->polarity = PWM_POLARITY_INVERSED;
-	else
-		state->polarity = PWM_POLARITY_NORMAL;
+		val = readl_relaxed(pc->base + pc->data->regs.ctrl);
+		if (pc->data->supports_polarity &&
+		    !(val & PWM_V4_CTRL_DUTY_POSITIVE))
+			state->polarity = PWM_POLARITY_INVERSED;
+		else
+			state->polarity = PWM_POLARITY_NORMAL;
+	} else {
+		val = readl_relaxed(pc->base + pc->data->regs.ctrl);
+		state->enabled = (val & enable_conf) == enable_conf;
+
+		if (pc->data->supports_polarity && !(val & PWM_DUTY_POSITIVE))
+			state->polarity = PWM_POLARITY_INVERSED;
+		else
+			state->polarity = PWM_POLARITY_NORMAL;
+	}
 
 	clk_disable(pc->clk);
 	clk_disable(pc->pclk);
@@ -102,6 +137,47 @@ static int rockchip_pwm_get_state(struct pwm_chip *chip,
 	return 0;
 }
 
+static void rockchip_pwm_config_v4(struct pwm_chip *chip, struct pwm_device *pwm,
+				   const struct pwm_state *state)
+{
+	struct rockchip_pwm_chip *pc = to_rockchip_pwm_chip(chip);
+	u64 prescaled_ns = (u64)pc->data->prescaler * NSEC_PER_SEC;
+	u64 clk_rate, tmp;
+	u32 period_ticks, duty_ticks;
+
+	clk_rate = clk_get_rate(pc->clk);
+
+	tmp = mul_u64_u64_div_u64(clk_rate, state->period, prescaled_ns);
+	if (tmp > U32_MAX)
+		tmp = U32_MAX;
+	period_ticks = tmp;
+
+	tmp = mul_u64_u64_div_u64(clk_rate, state->duty_cycle, prescaled_ns);
+	if (tmp > U32_MAX)
+		tmp = U32_MAX;
+	duty_ticks = tmp;
+
+	writel_relaxed(period_ticks, pc->base + pc->data->regs.period);
+	writel_relaxed(duty_ticks, pc->base + pc->data->regs.duty);
+
+	if (pc->data->supports_polarity) {
+		if (state->polarity == PWM_POLARITY_INVERSED)
+			writel_relaxed(PWM_V4_POLARITY(PWM_V4_DUTY_NEGATIVE |
+						       PWM_V4_INACTIVE_POSITIVE),
+				       pc->base + pc->data->regs.ctrl);
+		else
+			writel_relaxed(PWM_V4_POLARITY(PWM_V4_DUTY_POSITIVE |
+						       PWM_V4_INACTIVE_NEGATIVE),
+				       pc->base + pc->data->regs.ctrl);
+	}
+
+	writel_relaxed(PWM_V4_MODE(PWM_V4_CONTINUOUS) |
+		       PWM_V4_ALIGNED_INVALID(false),
+		       pc->base + pc->data->regs.ctrl);
+	writel_relaxed(PWM_V4_CTRL_UPDATE_EN(true),
+		       pc->base + pc->data->regs.enable);
+}
+
 static void rockchip_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			       const struct pwm_state *state)
 {
@@ -175,14 +251,31 @@ static int rockchip_pwm_enable(struct pwm_chip *chip,
 			return ret;
 	}
 
-	val = readl_relaxed(pc->base + pc->data->regs.ctrl);
-
-	if (enable)
-		val |= enable_conf;
-	else
-		val &= ~enable_conf;
+	if (pc->data->regs.enable) {
+		writel_relaxed(PWM_V4_EN(enable) | PWM_V4_CLK_EN(enable),
+			       pc->base + pc->data->regs.enable);
+
+		if (!enable) {
+			struct pwm_state curstate;
+
+			/*
+			 * In continuous mode the disable takes effect at the end
+			 * of the current period, so keep the clock running for
+			 * one more period.
+			 */
+			pwm_get_state(pwm, &curstate);
+			fsleep(DIV_ROUND_UP_ULL(curstate.period, NSEC_PER_USEC));
+		}
+	} else {
+		val = readl_relaxed(pc->base + pc->data->regs.ctrl);
+
+		if (enable)
+			val |= enable_conf;
+		else
+			val &= ~enable_conf;
 
-	writel_relaxed(val, pc->base + pc->data->regs.ctrl);
+		writel_relaxed(val, pc->base + pc->data->regs.ctrl);
+	}
 
 	if (!enable)
 		clk_disable(pc->clk);
@@ -217,7 +310,10 @@ static int rockchip_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		enabled = false;
 	}
 
-	rockchip_pwm_config(chip, pwm, state);
+	if (pc->data->regs.enable)
+		rockchip_pwm_config_v4(chip, pwm, state);
+	else
+		rockchip_pwm_config(chip, pwm, state);
 	if (state->enabled != enabled) {
 		ret = rockchip_pwm_enable(chip, pwm, state->enabled);
 		if (ret)
@@ -291,11 +387,26 @@ static const struct rockchip_pwm_data pwm_data_v3 = {
 		       PWM_CONTINUOUS,
 };
 
+static const struct rockchip_pwm_data pwm_data_v4 = {
+	.regs = {
+		.duty = 0x14,
+		.period = 0x10,
+		.ctrl = 0xc,
+		.enable = 0x4,
+	},
+	.prescaler = 1,
+	.supports_polarity = true,
+	.supports_lock = true,
+	.enable_conf = PWM_V4_ENABLE_MASK,
+};
+
 static const struct of_device_id rockchip_pwm_dt_ids[] = {
 	{ .compatible = "rockchip,rk2928-pwm", .data = &pwm_data_v1 },
 	{ .compatible = "rockchip,rk3288-pwm", .data = &pwm_data_v2 },
 	{ .compatible = "rockchip,vop-pwm", .data = &pwm_data_vop },
 	{ .compatible = "rockchip,rk3328-pwm", .data = &pwm_data_v3 },
+	{ .compatible = "rockchip,rk3506-pwm", .data = &pwm_data_v4 },
+	{ .compatible = "rockchip,rk3576-pwm", .data = &pwm_data_v4 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rockchip_pwm_dt_ids);
@@ -327,7 +438,7 @@ static int rockchip_pwm_probe(struct platform_device *pdev)
 
 	count = of_count_phandle_with_args(pdev->dev.of_node,
 					   "clocks", "#clock-cells");
-	if (count == 2)
+	if (count >= 2)
 		pc->pclk = devm_clk_get(&pdev->dev, "pclk");
 	else
 		pc->pclk = pc->clk;
@@ -351,7 +462,10 @@ static int rockchip_pwm_probe(struct platform_device *pdev)
 	chip->ops = &rockchip_pwm_ops;
 
 	enable_conf = pc->data->enable_conf;
-	ctrl = readl_relaxed(pc->base + pc->data->regs.ctrl);
+	if (pc->data->regs.enable)
+		ctrl = readl_relaxed(pc->base + pc->data->regs.enable);
+	else
+		ctrl = readl_relaxed(pc->base + pc->data->regs.ctrl);
 	enabled = (ctrl & enable_conf) == enable_conf;
 
 	ret = pwmchip_add(chip);
-- 
2.47.3


