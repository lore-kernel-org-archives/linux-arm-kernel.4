Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA19606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 05:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rJ6Z2xpa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JkvvoXKY;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=DTEF90BX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pj0rSYpUQTbEPKMnfqCizKcSx/5CubON/JSKQVLoENM=; b=rJ6Z2xpaVJEITRTE/ytQH4qksi
	gJhq1apWBBY+WxdTY5SrXZeHrPnYwiRAG47zP3VsUPaE3cHYkRc1AhucqCF9W5qo8Lpev5pPieOBc
	Xf29r+Pk1vAp5omcsfKUiq4ATa731+dmihFRYN6QG6LQrKlWoCKgF7PnQBiW6clM5JfZNlnmxOHhc
	II8HdgLkNPvPGZyz9+Hxf5xw4cHzte5HXdRCDF5dJdnGuKCgZ+T1Xg75Lh/Q/v6Sdmk6gnM1AxZQz
	AWv+qmreIrDGG8B6cnHfRn5xBcmGXeUfXFAF1IonRi9uqVYG38NHyW4pFe/4auv5No+py8uC1zzk5
	Fv1Don6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKN-00000008k6g-2YfJ;
	Thu, 12 Nov 2026 05:26:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKM-00000008k6B-1oxJ;
	Thu, 12 Nov 2026 05:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pj0rSYpUQTbEPKMnfqCizKcSx/5CubON/JSKQVLoENM=; b=JkvvoXKYgBCKqsaj0Mll6U9xGv
	fvTkzoiBIGsWVYcfkqW73I9c8CWu8oS964nhU854lKcrZ5FBXGQVRtzXhxo+nEiQ35j8WT67grzDS
	b/UFVzriV10xKYz1CsaIqNSpZVL7Z6RgU0L8wks8ezZy/d7zcvRNMOQbSEIegj3jGml32LSJ+Ij6p
	TtTsGBibS4cdpzgS3nehxgkEYRUNGKr8zvhMXxibxgntrGT5stl5hRhZyHgpJHYQS3f+xx0u9OdxD
	drDz7jjoQWoPSEOpNvNZdik2fKJ5BndryoBzOBFE3MxdNThR6LIpminfbfwBt49cqxURgkGEe6NWt
	LREwhFrg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKH-00000009vLw-2Hek;
	Thu, 12 Nov 2026 05:26:24 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PkUlA3459344, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461146; bh=pj0rSYpUQTbEPKMnfqCizKcSx/5CubON/JSKQVLoENM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=DTEF90BXB9uzi3SKvFEDqaHyhczN4jmwCX4xtxnYBR385XGpe4GCdgQxCyjydhRu7
	 lh3Y7+wzdWRoXK2Eac/XoPHrHgr0hiu3hAFRWZaEaHNtMuLcRgCTPL70UTESWN0Ey5
	 rrL7Z3uqwxpJ5yFhMVTmcv7XmxRa2i8Cj/Z3Vx+K0Uw3oL/ww1igBnbaN2vyYYEHk+
	 Aht9Qe43I8pHx7Zt9iHB14inoUTn+hGtzoUsvVAuJYWj72j/L8SpVmnn/EvQ/MJXJN
	 +8BgBOiATimnHI7UdFohx2GAyfLGNTbUXfeXpYWbm7u4W0yDL+rn6/Up4o7Ay2JbcX
	 iWHoTmoQATckw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PkUlA3459344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 5/9] clk: realtek: Add support for mux clock
Date: Thu, 12 Nov 2026 13:25:40 +0800
Message-ID: <20261112052544.555563-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112052544.555563-1-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052622_270605_A3138E9C 
X-CRM114-Status: GOOD (  16.96  )
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

Add a simple regmap-based clk_ops implementation for Realtek mux clocks.

The implementation supports parent selection and rate determination through
regmap-backed register access.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v16:
- Remove Brian's reviewed-by tag.
- Replace 'CLK_HW_INIT_PARENTS' with 'CLK_HW_INIT_PARENTS_HW' to use
'.parent_hws'
---
 drivers/clk/realtek/Makefile         |  1 +
 drivers/clk/realtek/clk-regmap-mux.c | 40 ++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-mux.h | 42 ++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 9397d677f52d..4be39e2dd5b4 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
 clk-rtk-y += clk-regmap-gate.o
+clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += clk-regmap-pll.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
new file mode 100644
index 000000000000..ba86f314bb5e
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include "clk-regmap-mux.h"
+
+static u8 rtk_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
+	if (ret)
+		return 0xff;
+
+	val = (val >> clkm->shift) & clkm->mask;
+
+	return val;
+}
+
+static int rtk_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
+				  clkm->mask << clkm->shift, (u32)index << clkm->shift);
+}
+
+const struct clk_ops rtk_clk_regmap_mux_ops = {
+	.set_parent = rtk_clk_regmap_mux_set_parent,
+	.get_parent = rtk_clk_regmap_mux_get_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
new file mode 100644
index 000000000000..1d86a7f42efd
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_MUX_H
+#define __CLK_REALTEK_CLK_REGMAP_MUX_H
+
+#include "clk-rtk-common.h"
+
+struct rtk_clk_regmap_mux {
+	struct rtk_clk_regmap clkr;
+	unsigned int mux_ofs;
+	unsigned int mask;
+	unsigned int shift;
+};
+
+#define __rtk_clk_regmap_mux_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
+
+#define __RTK_CLK_REGMAP_MUX_HW(_name, _parents, _ops, _flags, _ofs, _sft, _mask) \
+struct rtk_clk_regmap_mux _name = { \
+	.clkr.hw.init = CLK_HW_INIT_PARENTS_HW(#_name, _parents, _ops, _flags), \
+	.mux_ofs = _ofs, \
+	.shift = _sft, \
+	.mask = _mask, \
+}
+
+#define RTK_CLK_REGMAP_MUX_HW(_name, _parents, _flags, _ofs, _sft, _mask) \
+	__RTK_CLK_REGMAP_MUX_HW(_name, _parents, &rtk_clk_regmap_mux_ops, _flags, _ofs, \
+				_sft, _mask)
+
+static inline struct rtk_clk_regmap_mux *to_rtk_clk_regmap_mux(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_mux, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_mux_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_MUX_H */
-- 
2.43.0


