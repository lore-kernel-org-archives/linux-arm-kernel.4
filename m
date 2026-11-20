Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7B0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1b50LhzA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TsTPgFpf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r0MrQSsfFF+8NFuoWmPZr5CuzJzWwIyM3EAzHjJs0u0=; b=1b50LhzA2J0LZdgrS4W87US5mc
	FrGGqIty5LyexUfEEy3gTcDmb224ISGo+7UEJ5jpj3ufiND+qACkw5yHkzD4NdrCrgeLgwvqmUYgx
	nDubRnnYBHnb1moynUrINljQ4d+vJTCLH4NuBZIu2bVhUzvx4X+N351siEqMTkpmVtS5VDhFmgtyv
	jPOGOhTsQ8O/nXIp+TwXbfHavoYM78hWbvEWjaJLjXabZzuextcSLd8B+9TZv2OM74a9tydUXL9Tv
	DwtugsV7t2YxwbVuGqi4CS9hH/woHrLSd/JnIMsXqwMTpyFfh4QpbW7wIhXT4yWSY/tM9HxZ4pNax
	W/cNVE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKW4-0000000EQ5r-0GGB;
	Fri, 20 Nov 2026 09:02:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKW2-0000000EQ5U-1IzK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:02:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABD9846A38;
	Fri, 20 Nov 2026 09:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA29F1F000C6;
	Fri, 20 Nov 2026 09:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795165361;
	bh=r0MrQSsfFF+8NFuoWmPZr5CuzJzWwIyM3EAzHjJs0u0=;
	h=From:Date:Subject:To:Cc;
	b=TsTPgFpfhMWHP34oPirrzHQNRxHR35WOs4Gp1pb4TIVWmEQ6oI6qvxe58n39bxj9Z
	 +AHfW5nHT0fbeSiBzdCPpWAru8YoQWyArWlH5Qwbj7PNcT0blB3xI6ml1KWOsj0v99
	 LLknuYxzp8u9S+RQiDLqD+9CTtwGr3HDe88totRLN7TOmTlvZFJ2reBORmmuO+Nje0
	 PnaZhuJ7PkzvvLefzV1nm1p5oci727F+s9V/gCxjzzoDS2kgywzguntN9zaEmzDrsF
	 g2/F/D50BC36w5hBvqQc1FAOXp7a+U7m46e/M+QscK8IQu1Z0t3bGeR/gMhimqRAhq
	 59oKwvpVRCYXg==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 10:02:38 +0100
Subject: [PATCH] clk: ux500: Power the AB8500 ULP PLL from VintCore12
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ux500-clk-power-upll-v1-1-431041f317ba@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MSwqEMBAFwKs0b21DEoyLXGWYRdCO00zQkOAHx
 LsL1gHqQpOq0hDoQpVdm64LAtmOMP7iMgvrhEBwxg3WOsPb6Y3hMf+5rIdU3krOPEzJiu99H2N
 CRyhVkp5v+/ne9wOMT+8dZgAAAA==
X-Change-ID: 20261120-ux500-clk-power-upll-6df1e5454aaf
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Mike Turquette <mturquette@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

The AB8500 ULP PLL draws power from VintCore12.

Enable the supply before requesting ULPCLK and release it only after
clearing the request. This keeps the rail on for every ULPCLK consumer
without forcing it on when the PLL is idle.

The AB8505 does not have this requirement, the change only affects
the AB8500.

Fixes: 312f0f0b9a4e ("clk: ux500: abx500: Define clock tree for ab850x")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
The corresponding bindings change hits the MFD subsystem, see:
https://lore.kernel.org/mfd/20261120-ux500-mfd-ulp-pll-supply-binding-v1-1-2740b61bd839@kernel.org/
---
 drivers/clk/ux500/abx500-clk.c  | 20 +++++++++------
 drivers/clk/ux500/clk-sysctrl.c | 54 ++++++++++++++++++++++++++++++++++-------
 drivers/clk/ux500/clk.h         |  4 ++-
 3 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/ux500/abx500-clk.c b/drivers/clk/ux500/abx500-clk.c
index b2ddbf08fca4..1cf94d0ebcda 100644
--- a/drivers/clk/ux500/abx500-clk.c
+++ b/drivers/clk/ux500/abx500-clk.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/mfd/abx500/ab8500.h>
 #include <linux/mfd/abx500/ab8500-sysctrl.h>
 #include <linux/clkdev.h>
@@ -24,7 +25,7 @@ static struct clk *ab8500_clks[AB8500_NUM_CLKS];
 static struct clk_onecell_data ab8500_clk_data;
 
 /* Clock definitions for ab8500 */
-static int ab8500_reg_clks(struct device *dev)
+static int ab8500_reg_clks(struct device *dev, struct regulator *vintcore)
 {
 	int ret;
 	struct clk *clk;
@@ -64,7 +65,7 @@ static int ab8500_reg_clks(struct device *dev)
 	clk = clk_reg_sysctrl_gate_fixed_rate(dev, "ulpclk", NULL,
 		AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_ULPCLKREQ,
 		AB8500_SYSULPCLKCTRL1_ULPCLKREQ,
-		38400000, 9000, 0);
+		38400000, 9000, 0, vintcore);
 	ab8500_clks[AB8500_SYSCLK_ULP] = clk;
 
 	/* ab8500_intclk */
@@ -90,16 +91,19 @@ static int ab8500_reg_clks(struct device *dev)
 static int abx500_clk_probe(struct platform_device *pdev)
 {
 	struct ab8500 *parent = dev_get_drvdata(pdev->dev.parent);
-	int ret;
-
-	if (is_ab8500(parent) || is_ab8505(parent)) {
-		ret = ab8500_reg_clks(&pdev->dev);
-	} else {
+	struct regulator *vintcore = NULL;
+
+	if (is_ab8500(parent)) {
+		vintcore = devm_regulator_get(&pdev->dev, "vintcore");
+		if (IS_ERR(vintcore))
+			return dev_err_probe(&pdev->dev, PTR_ERR(vintcore),
+					     "failed to get ULP PLL supply\n");
+	} else if (!is_ab8505(parent)) {
 		dev_err(&pdev->dev, "non supported plf id\n");
 		return -ENODEV;
 	}
 
-	return ret;
+	return ab8500_reg_clks(&pdev->dev, vintcore);
 }
 
 static const struct of_device_id abx500_clk_match[] = {
diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
index 2127a949e56c..aaa7278e5d38 100644
--- a/drivers/clk/ux500/clk-sysctrl.c
+++ b/drivers/clk/ux500/clk-sysctrl.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/mfd/abx500/ab8500-sysctrl.h>
+#include <linux/regulator/consumer.h>
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
@@ -22,6 +23,9 @@
 struct clk_sysctrl {
 	struct clk_hw hw;
 	struct device *dev;
+	struct regulator *supply;
+	/* A failed unprepare can leave our regulator enable reference held. */
+	bool supply_ref_held;
 	u8 parent_index;
 	u16 reg_sel[SYSCTRL_MAX_NUM_PARENTS];
 	u8 reg_mask[SYSCTRL_MAX_NUM_PARENTS];
@@ -32,27 +36,56 @@ struct clk_sysctrl {
 
 /* Sysctrl clock operations. */
 
+static void clk_sysctrl_disable_supply(struct clk_sysctrl *clk)
+{
+	if (!clk->supply_ref_held)
+		return;
+
+	if (regulator_disable(clk->supply))
+		dev_err(clk->dev, "failed to disable supply for %s\n",
+			clk_hw_get_name(&clk->hw));
+	else
+		clk->supply_ref_held = false;
+}
+
 static int clk_sysctrl_prepare(struct clk_hw *hw)
 {
-	int ret;
 	struct clk_sysctrl *clk = to_clk_sysctrl(hw);
+	bool take_supply_ref = clk->supply && !clk->supply_ref_held;
+	int ret;
+
+	if (take_supply_ref) {
+		ret = regulator_enable(clk->supply);
+		if (ret)
+			return ret;
+		clk->supply_ref_held = true;
+	}
 
 	ret = ab8500_sysctrl_write(clk->reg_sel[0], clk->reg_mask[0],
 				clk->reg_bits[0]);
+	if (ret) {
+		if (take_supply_ref)
+			clk_sysctrl_disable_supply(clk);
+		return ret;
+	}
 
-	if (!ret && clk->enable_delay_us)
+	if (clk->enable_delay_us)
 		usleep_range(clk->enable_delay_us, clk->enable_delay_us +
 			     (clk->enable_delay_us >> 2));
 
-	return ret;
+	return 0;
 }
 
 static void clk_sysctrl_unprepare(struct clk_hw *hw)
 {
 	struct clk_sysctrl *clk = to_clk_sysctrl(hw);
-	if (ab8500_sysctrl_clear(clk->reg_sel[0], clk->reg_mask[0]))
+
+	if (ab8500_sysctrl_clear(clk->reg_sel[0], clk->reg_mask[0])) {
 		dev_err(clk->dev, "clk_sysctrl: %s fail to clear %s.\n",
 			__func__, clk_hw_get_name(hw));
+		return;
+	}
+	clk_sysctrl_disable_supply(clk);
 }
 
 static unsigned long clk_sysctrl_recalc_rate(struct clk_hw *hw,
@@ -125,7 +158,8 @@ static struct clk *clk_reg_sysctrl(struct device *dev,
 				unsigned long rate,
 				unsigned long enable_delay_us,
 				unsigned long flags,
-				const struct clk_ops *clk_sysctrl_ops)
+				const struct clk_ops *clk_sysctrl_ops,
+				struct regulator *supply)
 {
 	struct clk_init_data clk_sysctrl_init = {};
 	struct clk_sysctrl *clk;
@@ -160,6 +194,7 @@ static struct clk *clk_reg_sysctrl(struct device *dev,
 	clk->rate = rate;
 	clk->enable_delay_us = enable_delay_us;
 	clk->dev = dev;
+	clk->supply = supply;
 
 	clk_sysctrl_init.name = name;
 	clk_sysctrl_init.ops = clk_sysctrl_ops;
@@ -189,7 +224,7 @@ struct clk *clk_reg_sysctrl_gate(struct device *dev,
 
 	return clk_reg_sysctrl(dev, name, parent_names, num_parents,
 			&reg_sel, &reg_mask, &reg_bits, 0, enable_delay_us,
-			flags, &clk_sysctrl_gate_ops);
+			flags, &clk_sysctrl_gate_ops, NULL);
 }
 
 struct clk *clk_reg_sysctrl_gate_fixed_rate(struct device *dev,
@@ -200,7 +235,8 @@ struct clk *clk_reg_sysctrl_gate_fixed_rate(struct device *dev,
 					u8 reg_bits,
 					unsigned long rate,
 					unsigned long enable_delay_us,
-					unsigned long flags)
+					unsigned long flags,
+					struct regulator *supply)
 {
 	const char **parent_names = (parent_name ? &parent_name : NULL);
 	u8 num_parents = (parent_name ? 1 : 0);
@@ -208,7 +244,7 @@ struct clk *clk_reg_sysctrl_gate_fixed_rate(struct device *dev,
 	return clk_reg_sysctrl(dev, name, parent_names, num_parents,
 			&reg_sel, &reg_mask, &reg_bits,
 			rate, enable_delay_us, flags,
-			&clk_sysctrl_gate_fixed_rate_ops);
+			&clk_sysctrl_gate_fixed_rate_ops, supply);
 }
 
 struct clk *clk_reg_sysctrl_set_parent(struct device *dev,
@@ -222,5 +258,5 @@ struct clk *clk_reg_sysctrl_set_parent(struct device *dev,
 {
 	return clk_reg_sysctrl(dev, name, parent_names, num_parents,
 			reg_sel, reg_mask, reg_bits, 0, 0, flags,
-			&clk_sysctrl_set_parent_ops);
+			&clk_sysctrl_set_parent_ops, NULL);
 }
diff --git a/drivers/clk/ux500/clk.h b/drivers/clk/ux500/clk.h
index 91003cf8003c..08ba094322b0 100644
--- a/drivers/clk/ux500/clk.h
+++ b/drivers/clk/ux500/clk.h
@@ -14,6 +14,7 @@
 
 struct clk;
 struct clk_hw;
+struct regulator;
 
 struct clk *clk_reg_prcc_pclk(const char *name,
 			      const char *parent_name,
@@ -82,7 +83,8 @@ struct clk *clk_reg_sysctrl_gate_fixed_rate(struct device *dev,
 					    u8 reg_bits,
 					    unsigned long rate,
 					    unsigned long enable_delay_us,
-					    unsigned long flags);
+					    unsigned long flags,
+					    struct regulator *supply);
 
 struct clk *clk_reg_sysctrl_set_parent(struct device *dev,
 				       const char *name,

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261120-ux500-clk-power-upll-6df1e5454aaf

Best regards,
--  
Linus Walleij <linusw@kernel.org>


