Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75D8606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 02:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vhC/cuIj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IrwXkcVp;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lbD+qonp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LdIr81XQUw7VpYnpXqxz41gzN6tB2DzbyylB1vVqhYc=; b=vhC/cuIj2uqRKxohVK1auW5v8U
	olYGR4+3frqD+jGdvaQAD6pT8S2OpSWl96WQBcW1e8FMCyvw3ySRl6IXxXwZ8fer8fvRKx7P5DUth
	yT1+pf1Nuk7nDrTKv8Quvx0zF6sJTiuUGZwYeO4649NgSyb/uHGhtJHY8UXrDi63x1WNcM4AZWk2y
	KcF94pM3z9XCYz+F6tECYMrcQA/WjFArHjjUExZqBdkrW59HqmvYl+kNKFXEhORiNj5GJxV0wU3BV
	5kHdA0TXK8B0ESk1QdwNX1x8DDMUk2fHgpKSR31S5p/Y3FE1kG6JCY/B8BeASu8vBC1Nowm3JBesZ
	DBfZcJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgP0-00000005NZP-0glB;
	Tue, 24 Nov 2026 02:37:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgOs-00000005NX1-2cTw;
	Tue, 24 Nov 2026 02:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LdIr81XQUw7VpYnpXqxz41gzN6tB2DzbyylB1vVqhYc=; b=IrwXkcVpRLcJKdRcd88hV87xfH
	gH55kJazyEOQe1CWM3lg95S20qpGD+rglFl77ttKZX/iYyMd1AeVjWq1D6N+hZAwJbkujG5vJvzBA
	ZwhahtJqk9RnGQgboFv/VMrApzGRwqEfEkbA+qQ6c8YagcbNdN8sIgLcoLqhhMBwXEM7z+qb40e5a
	TGoIDO1Jt+YOF1120gIxrTXpeVs6P5EyZqGnoi4PvG/i3z6kEpnhfgyNces340O7Vg4mgn0Sci94I
	UmDpss8rS13Ws3JYJscOmdAl+jMpGRkLA+zx5VJ+BHffQ5k3h1kkfQshWryKnFI8FS6mOsO212zHS
	zliyGRpQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgOl-00000003lpE-0mIH;
	Tue, 24 Nov 2026 02:36:52 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2Zxh162160552, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487759; bh=LdIr81XQUw7VpYnpXqxz41gzN6tB2DzbyylB1vVqhYc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=lbD+qonpKwf4hNFEzBDp7YnUzczQl2uWMc8DYVPRDfuwHm7AvmJq9lgzCFqhH32OH
	 FPqLm8TGuBbs4TodGJ3arHFJnCLJjcFHhc3XT3FnSOZwzew6y9V2mL/nMWXWSizcFH
	 rmPx+I7r4KDk6rcaRncMhSMmqm5fIrkkviIrEvfpigKsQOImBUMOxzTLlMNq15BgVT
	 mNJv1OGwbxjpzXvyUhS1zoyzNg8FzVcwCXSudMMhEiFHekbuaM+OF0vBbPIWqbbvMm
	 AH8MgSPEZttH21qM3DsGndO242Vpqzji5yMCGYdSNgwAIcIUbSWlBz3EgRHyya/6F8
	 pd85+sdJJ0KjQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2Zxh162160552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:35:59 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:59 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:35:59 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 5/9] clk: realtek: Add support for mux clock
Date: Tue, 24 Nov 2026 10:35:53 +0800
Message-ID: <20261124023558.4088635-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124023558.4088635-1-eleanor.lin@realtek.com>
References: <20261124023558.4088635-1-eleanor.lin@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_023649_517612_8BDD012D 
X-CRM114-Status: GOOD (  16.90  )
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
Changes in v17:
- None.
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


