Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 23:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ef2qONnY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFI6BSVM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U4xx5YvVOcvcEjqksoW6QRvcGwL3WGnKWnm7u39mUEM=; b=Ef2qONnYTpHXGG
	61T1rJ99tK/qHoTij+kDtKAl1RGwbI2gNvyqX2ollUMFcPy6raAt6MF48BZbDUAkokJvSPTy51lSe
	4+6cMRaaUWWJHTlWl+MwN18UDq7kG2ZlhQZPJpaCPZu+1WX62Auc7F5sToVLtATOnr1Latm7vw37T
	WIBXR9GohYwqmAhwYpr9Ivzn8DSNpmzmmjtLNEMRX/bFUiA0lKPPDEF4VbazA5xvakuLgVAMpsooQ
	2esOQny/shkZlSjs5oUprgYcoGCqpBfdLrSDspGqXwkO07s6YVpXeknV03ssqhl4A2Rcke9K+Jtop
	1zsvKGwH4TKs0/OnUJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5ab-00000000CKw-0ySq;
	Fri, 27 Nov 2026 23:42:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5aR-00000000CJb-2wqZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 23:42:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 427E44444E;
	Fri, 27 Nov 2026 23:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E051F00897;
	Fri, 27 Nov 2026 23:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822958;
	bh=U4xx5YvVOcvcEjqksoW6QRvcGwL3WGnKWnm7u39mUEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZFI6BSVMqqt4q7baZcHWWNB5Ma6X796NTYduUjpwF5EDXjHuGjp8WbLvEW5r0Mfay
	 tLuvi0CvWU2Kcl+oSKBfxAKQIW+44P49ZIZhHeAYAqNywfOgRZvXDiKV0u8bdZfu+x
	 fuhVPMU+I5zovwFFGS7I/dKckBQw8jWpTU0v09KU3TSDMa8YbzZEAmomVZEKpEv0pV
	 QxZQloC9PyE9PgEE6+z8WbBRDCj6ymsDoWmgIAEhuCNdrwUEfqLPwcSuN/jR3DPbAw
	 CrYVh1lheKTVaePtzgi6IUZNubPCEFBwCraaLKOsoooUkS4IaDpZqMzq323L/VmwRT
	 4tMkrKt0uEgUA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:30 +0100
Subject: [PATCH 2/6] clk: ux500: Move CLKOUT programming to the clock
 driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-ux500-prcmu-clock-move-v1-2-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
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

The programmable clock outputs only use MMIO and have no firmware
transaction. Move their register definitions, lock and request
bookkeeping next to their CCF operations. Use the existing PRCMU
register accessors rather than exposing the mapping.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/clk/ux500/clk-prcmu.c    | 87 ++++++++++++++++++++++++++++++++++++++--
 drivers/mfd/db8500-prcmu-regs.h  | 16 --------
 drivers/mfd/db8500-prcmu.c       | 67 -------------------------------
 include/linux/mfd/db8500-prcmu.h |  6 ---
 4 files changed, 84 insertions(+), 92 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 842962be7f9e..82c905394eff 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -6,9 +6,11 @@
  * Author: Ulf Hansson <ulf.hansson@linaro.org>
  */
 
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/db8500-prcmu.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include "clk.h"
@@ -350,13 +352,92 @@ struct clk_hw *clk_reg_prcmu_opp_volt_scalable(const char *name,
 			&clk_prcmu_opp_volt_scalable_ops);
 }
 
-/* The clkout (external) clock is special and need special ops */
+/* External programmable clock outputs */
+
+#define PRCM_CLKOCR		   0x1CC
+#define PRCM_CLKOCR_CLKODIV0_SHIFT	0
+#define PRCM_CLKOCR_CLKODIV0_MASK	GENMASK(5, 0)
+#define PRCM_CLKOCR_CLKOSEL0_SHIFT	6
+#define PRCM_CLKOCR_CLKOSEL0_MASK	GENMASK(8, 6)
+#define PRCM_CLKOCR_CLKODIV1_SHIFT	16
+#define PRCM_CLKOCR_CLKODIV1_MASK	GENMASK(21, 16)
+#define PRCM_CLKOCR_CLKOSEL1_SHIFT	22
+#define PRCM_CLKOCR_CLKOSEL1_MASK	GENMASK(24, 22)
+#define PRCM_CLKOCR_CLK1TYPE		BIT(28)
+
+static DEFINE_SPINLOCK(clkout_lock);
+
+/**
+ * clk_prcmu_config_clkout - Configure one of the programmable clock outputs.
+ * @clkout:	The CLKOUT number (0 or 1).
+ * @source:	The clock to be used (one of the PRCMU_CLKSRC_*).
+ * @div:	The divider to be applied.
+ *
+ * Configures one of the programmable clock outputs (CLKOUTs).
+ * @div should be in the range [1,63] to request a configuration, or 0 to
+ * inform that the configuration is no longer requested.
+ */
+static int clk_prcmu_config_clkout(u8 clkout, u8 source, u8 div)
+{
+	static int requests[2];
+	int r = 0;
+	unsigned long flags;
+	u32 val;
+	u32 bits;
+	u32 mask;
+	u32 div_mask;
+
+	BUG_ON(clkout > 1);
+	BUG_ON(div > 63);
+	BUG_ON((clkout == 0) && (source > PRCMU_CLKSRC_CLK009));
+
+	if (!div && !requests[clkout])
+		return -EINVAL;
+
+	if (clkout == 0) {
+		div_mask = PRCM_CLKOCR_CLKODIV0_MASK;
+		mask = (PRCM_CLKOCR_CLKODIV0_MASK | PRCM_CLKOCR_CLKOSEL0_MASK);
+		bits = ((source << PRCM_CLKOCR_CLKOSEL0_SHIFT) |
+			(div << PRCM_CLKOCR_CLKODIV0_SHIFT));
+	} else {
+		div_mask = PRCM_CLKOCR_CLKODIV1_MASK;
+		mask = (PRCM_CLKOCR_CLKODIV1_MASK | PRCM_CLKOCR_CLKOSEL1_MASK |
+			PRCM_CLKOCR_CLK1TYPE);
+		bits = ((source << PRCM_CLKOCR_CLKOSEL1_SHIFT) |
+			(div << PRCM_CLKOCR_CLKODIV1_SHIFT));
+	}
+	bits &= mask;
+
+	spin_lock_irqsave(&clkout_lock, flags);
+
+	val = db8500_prcmu_read(PRCM_CLKOCR);
+	if (val & div_mask) {
+		if (div) {
+			if ((val & mask) != bits) {
+				r = -EBUSY;
+				goto unlock_and_return;
+			}
+		} else {
+			if ((val & mask & ~div_mask) != bits) {
+				r = -EINVAL;
+				goto unlock_and_return;
+			}
+		}
+	}
+	db8500_prcmu_write(PRCM_CLKOCR, bits | (val & ~mask));
+	requests[clkout] += (div ? 1 : -1);
+
+unlock_and_return:
+	spin_unlock_irqrestore(&clkout_lock, flags);
+
+	return r;
+}
 
 static int clk_prcmu_clkout_prepare(struct clk_hw *hw)
 {
 	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
 
-	return prcmu_config_clkout(clk->clkout_id, clk->source, clk->divider);
+	return clk_prcmu_config_clkout(clk->clkout_id, clk->source, clk->divider);
 }
 
 static void clk_prcmu_clkout_unprepare(struct clk_hw *hw)
@@ -365,7 +446,7 @@ static void clk_prcmu_clkout_unprepare(struct clk_hw *hw)
 	int ret;
 
 	/* The clkout clock is disabled by dividing by 0 */
-	ret = prcmu_config_clkout(clk->clkout_id, clk->source, 0);
+	ret = clk_prcmu_config_clkout(clk->clkout_id, clk->source, 0);
 	if (ret)
 		pr_err("clk_prcmu: %s failed to disable %s\n", __func__,
 		       clk_hw_get_name(hw));
diff --git a/drivers/mfd/db8500-prcmu-regs.h b/drivers/mfd/db8500-prcmu-regs.h
index 75fd1069372c..e024400c4e80 100644
--- a/drivers/mfd/db8500-prcmu-regs.h
+++ b/drivers/mfd/db8500-prcmu-regs.h
@@ -161,12 +161,6 @@
 
 #define PRCM_APE_RESETN_DSIPLL_RESETN BIT(14)
 
-#define PRCM_CLKOCR		   (prcmu_base + 0x1CC)
-#define PRCM_CLKOCR_CLKOUT0_REF_CLK	(1 << 0)
-#define PRCM_CLKOCR_CLKOUT0_MASK	BITS(0, 13)
-#define PRCM_CLKOCR_CLKOUT1_REF_CLK	(1 << 16)
-#define PRCM_CLKOCR_CLKOUT1_MASK	BITS(16, 29)
-
 /* ePOD and memory power signal control registers */
 #define PRCM_EPOD_C_SET            (prcmu_base + 0x410)
 #define PRCM_SRAM_LS_SLEEP         (prcmu_base + 0x304)
@@ -189,16 +183,6 @@
 #define PRCM_TCR_STOP_TIMERS       BIT(16)
 #define PRCM_TCR_DOZE_MODE         BIT(17)
 
-#define PRCM_CLKOCR_CLKODIV0_SHIFT	0
-#define PRCM_CLKOCR_CLKODIV0_MASK	BITS(0, 5)
-#define PRCM_CLKOCR_CLKOSEL0_SHIFT	6
-#define PRCM_CLKOCR_CLKOSEL0_MASK	BITS(6, 8)
-#define PRCM_CLKOCR_CLKODIV1_SHIFT	16
-#define PRCM_CLKOCR_CLKODIV1_MASK	BITS(16, 21)
-#define PRCM_CLKOCR_CLKOSEL1_SHIFT	22
-#define PRCM_CLKOCR_CLKOSEL1_MASK	BITS(22, 24)
-#define PRCM_CLKOCR_CLK1TYPE		BIT(28)
-
 #define PRCM_CLK_MGT_CLKPLLDIV_MASK		BITS(0, 4)
 #define PRCM_CLK_MGT_CLKPLLSW_SOC0		BIT(5)
 #define PRCM_CLK_MGT_CLKPLLSW_SOC1		BIT(6)
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index befc8d4ab922..1d9114edfbdb 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -441,7 +441,6 @@ static atomic_t ac_wake_req_state = ATOMIC_INIT(0);
 
 /* Spinlocks */
 static DEFINE_SPINLOCK(prcmu_lock);
-static DEFINE_SPINLOCK(clkout_lock);
 
 /* Global var to runtime determine TCDM base for v2 or v1 */
 static __iomem void *tcdm_base;
@@ -622,72 +621,6 @@ enum ap_pwrst prcmu_get_xp70_current_state(void)
 	return readb(tcdm_base + PRCM_XP70_CUR_PWR_STATE);
 }
 
-/**
- * prcmu_config_clkout - Configure one of the programmable clock outputs.
- * @clkout:	The CLKOUT number (0 or 1).
- * @source:	The clock to be used (one of the PRCMU_CLKSRC_*).
- * @div:	The divider to be applied.
- *
- * Configures one of the programmable clock outputs (CLKOUTs).
- * @div should be in the range [1,63] to request a configuration, or 0 to
- * inform that the configuration is no longer requested.
- */
-int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
-{
-	static int requests[2];
-	int r = 0;
-	unsigned long flags;
-	u32 val;
-	u32 bits;
-	u32 mask;
-	u32 div_mask;
-
-	BUG_ON(clkout > 1);
-	BUG_ON(div > 63);
-	BUG_ON((clkout == 0) && (source > PRCMU_CLKSRC_CLK009));
-
-	if (!div && !requests[clkout])
-		return -EINVAL;
-
-	if (clkout == 0) {
-		div_mask = PRCM_CLKOCR_CLKODIV0_MASK;
-		mask = (PRCM_CLKOCR_CLKODIV0_MASK | PRCM_CLKOCR_CLKOSEL0_MASK);
-		bits = ((source << PRCM_CLKOCR_CLKOSEL0_SHIFT) |
-			(div << PRCM_CLKOCR_CLKODIV0_SHIFT));
-	} else {
-		div_mask = PRCM_CLKOCR_CLKODIV1_MASK;
-		mask = (PRCM_CLKOCR_CLKODIV1_MASK | PRCM_CLKOCR_CLKOSEL1_MASK |
-			PRCM_CLKOCR_CLK1TYPE);
-		bits = ((source << PRCM_CLKOCR_CLKOSEL1_SHIFT) |
-			(div << PRCM_CLKOCR_CLKODIV1_SHIFT));
-	}
-	bits &= mask;
-
-	spin_lock_irqsave(&clkout_lock, flags);
-
-	val = readl(PRCM_CLKOCR);
-	if (val & div_mask) {
-		if (div) {
-			if ((val & mask) != bits) {
-				r = -EBUSY;
-				goto unlock_and_return;
-			}
-		} else {
-			if ((val & mask & ~div_mask) != bits) {
-				r = -EINVAL;
-				goto unlock_and_return;
-			}
-		}
-	}
-	writel((bits | (val & ~mask)), PRCM_CLKOCR);
-	requests[clkout] += (div ? 1 : -1);
-
-unlock_and_return:
-	spin_unlock_irqrestore(&clkout_lock, flags);
-
-	return r;
-}
-
 int db8500_prcmu_set_power_state(u8 state, bool keep_ulp_clk, bool keep_ap_pll)
 {
 	unsigned long flags;
diff --git a/include/linux/mfd/db8500-prcmu.h b/include/linux/mfd/db8500-prcmu.h
index 87a28c4f1d81..b6e3450b1d11 100644
--- a/include/linux/mfd/db8500-prcmu.h
+++ b/include/linux/mfd/db8500-prcmu.h
@@ -706,7 +706,6 @@ void prcmu_configure_auto_pm(struct prcmu_auto_pm_config *sleep,
 	struct prcmu_auto_pm_config *idle);
 bool prcmu_is_auto_pm_enabled(void);
 
-int prcmu_config_clkout(u8 clkout, u8 source, u8 div);
 unsigned long prcmu_clock_rate(u8 clock);
 long prcmu_round_clock_rate(u8 clock, unsigned long rate);
 int prcmu_set_clock_rate(u8 clock, unsigned long rate);
@@ -816,11 +815,6 @@ static inline bool prcmu_is_auto_pm_enabled(void)
 	return false;
 }
 
-static inline int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
-{
-	return 0;
-}
-
 static inline unsigned long prcmu_clock_rate(u8 clock)
 {
 	return 0;

-- 
2.56.1


