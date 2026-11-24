Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABBB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 02:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXxTqPeA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nE5Li0GX;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=CVl6RNKF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bVhL96iV9lpS9bgasVTEMU/ASkJDwjybcBbtKvPmADg=; b=FXxTqPeAkhtt9RxpMZR6MXKpWj
	ZKR2LhHqMCuQB9CG/HxHUugcVHXYOhEhEn0AwoP+UhqR42vALIEygEzY+fa6f6bVh1SEt/TqgIj2U
	xNE61CZgUI+Q6VpbRgQvTEzCRtU/yLNKuDhxe6bTXQz21Fxr7VUJsqxT80pqX8BMLzuxI5ZlDRWfK
	BlJ53GEKXa2RaX8ptmPrJWuF+4AlPA7E3+Okecf56K96RaoEj7kD2QzUtzgmahVX+KY240GMgamcQ
	mPH3s8upSZG0PK/ROEL+ocpTpvop/2l8YF5cAgYCihe6nziKIwCszSI11wXhhp5vQvG6k75zARSXG
	ki0ZtTOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgPc-00000005NwS-47IW;
	Tue, 24 Nov 2026 02:37:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgP5-00000005Nd7-0629;
	Tue, 24 Nov 2026 02:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bVhL96iV9lpS9bgasVTEMU/ASkJDwjybcBbtKvPmADg=; b=nE5Li0GXekWIdUJo4wIAd7PsKe
	Rfm8AyrOuRUm+auqaf+81F+Lua7oHS3FOGcw4plGGM2qAPWaiVEqAlCXfpo6IQIC6j6OXxctOw3nV
	i/ZB2fYFJWoiMxqPaGyuuHMmwlplZqY+dyE8Bmhw3udJ2hVOEvflRzjKhKgC9xQiUSRd/wJLQ6ZF6
	anyztvqzIHxktXQuVfuN2fwn/hJm1g0C1yq2uonw6Lz3T1JDTZujS0OagP6Agb0ewqO1gFxdyZkFJ
	lphyRC/q7V/7OXu8EGSp/N3Siv4C+v5kIhqi+LeYiHKTI8lamyJVlH0t89w9D5TGf/pzSgPis/VF6
	+RdeR2Og==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgOl-00000003lp9-0pMh;
	Tue, 24 Nov 2026 02:37:03 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2Zxw262160551, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487759; bh=bVhL96iV9lpS9bgasVTEMU/ASkJDwjybcBbtKvPmADg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=CVl6RNKFQIiu8tG+nqbNnhMRICjv2iuYsEVz19WwWXq5jCWZ/It7TO/Uq0w72lNkg
	 TDkQjREsv9T05x8C4XdMbRPVQfuhDHYRfLNniUahaq4pxlxXaT6ygtk4+oZzUCs+JY
	 PIH4p8TRmC+iqlnTZHvtOJN6TbU4Xc2voT9V+besqPTM0kWt03NrFWPYvBNzAPSUag
	 gLJXYH8C3zDYwSQo2Ff0vFaa67XG9oQ0JKPjn/VhgVjsaoBwsPYbMVwaaHyM/x4OVF
	 1peKEZNZWXvjk9l4QOeErf8SAGIH4sfDB92febiyUbSoWIVHmsSEs+tUuWa9c+WwPN
	 xfIOSblwabcaQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2Zxw262160551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:35:59 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:59 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:35:58 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 3/9] clk: realtek: Add support for phase locked loops (PLLs)
Date: Tue, 24 Nov 2026 10:35:51 +0800
Message-ID: <20261124023558.4088635-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124023558.4088635-1-eleanor.lin@realtek.com>
References: <20261124023558.4088635-1-eleanor.lin@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_023701_092996_1DAC2883 
X-CRM114-Status: GOOD (  23.78  )
X-Spam-Score: -0.2 (/)
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

From: Cheng-Yu Lee <cylee12@realtek.com>

Provide a full set of PLL operations for programmable PLLs and a read-only
variant for fixed or hardware-managed PLLs.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v17:
- Move the power-on sequence from '.enable()' to '.prepare()', and use
'regmap_read_poll_timeout()' instead of the atomic variant: 'wait_freq_ready()'
can take up to 500 us, which is too long to busy-wait in atomic context.
- Drop the spinlock now that '.prepare()', '.unprepare()' and '.set_rate()'
are all serialized by 'prepare_lock'.
- Turn 'ftbl_find_closest_by_rate()' into a macro so that tables other than
'struct rtk_freq_table' can use it.
---
 drivers/clk/realtek/Makefile         |   2 +
 drivers/clk/realtek/clk-regmap-pll.c | 177 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-pll.h |  44 +++++++
 drivers/clk/realtek/freq_table.c     |  38 ++++++
 drivers/clk/realtek/freq_table.h     |  45 +++++++
 5 files changed, 306 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-pll.c
 create mode 100644 drivers/clk/realtek/clk-regmap-pll.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 13000ed4ba11..6fbe6e07b760 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
+clk-rtk-y += clk-regmap-pll.o
+clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-pll.c b/drivers/clk/realtek/clk-regmap-pll.c
new file mode 100644
index 000000000000..f9372aadfa29
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-pll.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include "clk-regmap-pll.h"
+
+#define TIMEOUT 500
+
+static inline struct rtk_clk_regmap_pll *to_rtk_clk_regmap_pll(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_pll, clkr);
+}
+
+static int wait_freq_ready(struct rtk_clk_regmap_pll *clkp)
+{
+	u32 pollval;
+
+	/*
+	 * Optional register: return success if not provided.
+	 */
+	if (!clkp->freq_ready_reg)
+		return 0;
+
+	return regmap_read_poll_timeout(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
+		(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val, 1, TIMEOUT);
+}
+
+static bool is_power_on(struct rtk_clk_regmap_pll *clkp)
+{
+	u32 val;
+
+	/*
+	 * If the PLL does not provide a power register, it is considered
+	 * to be always powered.
+	 */
+	if (!clkp->power_reg)
+		return true;
+
+	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
+		return false;
+
+	return (val & clkp->power_mask) == clkp->power_val_on;
+}
+
+static int rtk_clk_regmap_pll_is_prepared(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+
+	return is_power_on(clkp);
+}
+
+static int rtk_clk_regmap_pll_prepare(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	int ret;
+
+	if (!clkp->seq_power_on)
+		return 0;
+
+	if (is_power_on(clkp))
+		return 0;
+
+	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
+				     clkp->num_seq_power_on);
+	if (ret)
+		return ret;
+
+	return wait_freq_ready(clkp);
+}
+
+static void rtk_clk_regmap_pll_unprepare(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+
+	if (!clkp->seq_power_off)
+		return;
+
+	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
+			       clkp->num_seq_power_off);
+}
+
+static int rtk_clk_regmap_pll_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	const struct rtk_freq_table *ftblv = NULL;
+
+	if (clkp->expected_parent_rate &&
+	    req->best_parent_rate != clkp->expected_parent_rate)
+		return -EINVAL;
+
+	ftblv = ftbl_find_closest_by_rate(clkp->freq_tbl, req->rate,
+					  req->min_rate, req->max_rate);
+	if (!ftblv)
+		return -EINVAL;
+
+	req->rate = ftblv->rate;
+
+	return 0;
+}
+
+static unsigned long rtk_clk_regmap_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	const struct rtk_freq_table *fv;
+	u32 freq_val;
+
+	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val))
+		return 0;
+
+	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
+					freq_val);
+
+	return fv ? fv->rate : 0;
+}
+
+static int rtk_clk_regmap_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
+	const struct rtk_freq_table *fv;
+	int ret;
+
+	if (clkp->expected_parent_rate && parent_rate != clkp->expected_parent_rate)
+		return -EINVAL;
+
+	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
+	if (!fv || fv->rate != rate)
+		return -EINVAL;
+
+	if (clkp->seq_pre_set_freq) {
+		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
+					     clkp->num_seq_pre_set_freq);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
+				 clkp->freq_mask, fv->val);
+	if (ret)
+		return ret;
+
+	if (clkp->seq_post_set_freq) {
+		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
+					     clkp->num_seq_post_set_freq);
+		if (ret)
+			return ret;
+	}
+
+	if (is_power_on(clkp))
+		return wait_freq_ready(clkp);
+
+	return 0;
+}
+
+const struct clk_ops rtk_clk_pll_ops = {
+	.prepare        = rtk_clk_regmap_pll_prepare,
+	.unprepare      = rtk_clk_regmap_pll_unprepare,
+	.is_prepared    = rtk_clk_regmap_pll_is_prepared,
+	.recalc_rate    = rtk_clk_regmap_pll_recalc_rate,
+	.determine_rate = rtk_clk_regmap_pll_determine_rate,
+	.set_rate       = rtk_clk_regmap_pll_set_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "CLK_REALTEK");
+
+const struct clk_ops rtk_clk_pll_ro_ops = {
+	.is_prepared = rtk_clk_regmap_pll_is_prepared,
+	.recalc_rate = rtk_clk_regmap_pll_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ro_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-pll.h b/drivers/clk/realtek/clk-regmap-pll.h
new file mode 100644
index 000000000000..6e44fdbc7998
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-pll.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_PLL_H
+#define __CLK_REALTEK_CLK_PLL_H
+
+#include "clk-rtk-common.h"
+#include "freq_table.h"
+
+struct reg_sequence;
+
+struct rtk_clk_regmap_pll {
+	struct rtk_clk_regmap clkr;
+	const struct reg_sequence *seq_power_on;
+	u32 num_seq_power_on;
+	const struct reg_sequence *seq_power_off;
+	u32 num_seq_power_off;
+	const struct reg_sequence *seq_pre_set_freq;
+	u32 num_seq_pre_set_freq;
+	const struct reg_sequence *seq_post_set_freq;
+	u32 num_seq_post_set_freq;
+	const struct rtk_freq_table *freq_tbl;
+	u32 freq_reg;
+	u32 freq_mask;
+	u32 freq_ready_mask;
+	u32 freq_ready_reg;
+	u32 freq_ready_val;
+	u32 power_reg;
+	u32 power_mask;
+	u32 power_val_on;
+
+	/* Expected input rate for the preset frequency table; zero disables check. */
+	unsigned long expected_parent_rate;
+};
+
+#define __rtk_clk_regmap_pll_hw(_ptr)  __rtk_clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_ops;
+extern const struct clk_ops rtk_clk_pll_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_PLL_H */
diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
new file mode 100644
index 000000000000..3446657a437b
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/types.h>
+#include "freq_table.h"
+
+#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
+
+const struct rtk_freq_table *ftbl_find_by_rate(const struct rtk_freq_table *ftbl,
+					       unsigned long rate)
+{
+	const struct rtk_freq_table *best = NULL;
+	unsigned long best_rate = 0;
+
+	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
+		if (ftbl->rate == rate)
+			return ftbl;
+
+		if (ftbl->rate > rate)
+			continue;
+
+		if (ftbl->rate > best_rate) {
+			best_rate = ftbl->rate;
+			best = ftbl;
+		}
+	}
+
+	return best;
+}
+
+const struct rtk_freq_table *ftbl_find_by_val_with_mask(const struct rtk_freq_table *ftbl,
+							u32 mask, u32 value)
+{
+	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
+		if ((ftbl->val & mask) == (value & mask))
+			return ftbl;
+	}
+	return NULL;
+}
diff --git a/drivers/clk/realtek/freq_table.h b/drivers/clk/realtek/freq_table.h
new file mode 100644
index 000000000000..5a6a929e49b3
--- /dev/null
+++ b/drivers/clk/realtek/freq_table.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __CLK_REALTEK_FREQ_TABLE_H
+#define __CLK_REALTEK_FREQ_TABLE_H
+
+#include <linux/limits.h>
+#include <linux/math.h>
+#include <linux/types.h>
+
+struct rtk_freq_table {
+	u32 val;
+	unsigned long rate;
+};
+
+#define FREQ_TABLE_END    \
+	{                 \
+		.rate = 0 \
+	}
+
+#define ftbl_find_closest_by_rate(_tbl, _rate, _min, _max) ({		\
+	typeof(_tbl) __tbl = (_tbl);					\
+	typeof(&(__tbl)[0]) __best = NULL, __e;				\
+	unsigned long __r = (_rate), __lo = (_min), __hi = (_max);	\
+	unsigned long __best_delta = ULONG_MAX;				\
+									\
+	for (__e = (__tbl); __e->rate; __e++) {				\
+		unsigned long __d;					\
+									\
+		if (__e->rate < __lo || __e->rate > __hi)		\
+			continue;					\
+									\
+		__d = abs_diff(__e->rate, __r);				\
+		if (__d < __best_delta) {				\
+			__best_delta = __d;				\
+			__best = __e;					\
+		}							\
+	}								\
+	__best;								\
+})
+
+const struct rtk_freq_table *ftbl_find_by_rate(const struct rtk_freq_table *ftbl,
+					       unsigned long rate);
+const struct rtk_freq_table *
+ftbl_find_by_val_with_mask(const struct rtk_freq_table *ftbl, u32 mask, u32 value);
+
+#endif /* __CLK_REALTEK_FREQ_TABLE_H */
-- 
2.43.0


