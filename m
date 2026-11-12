Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C937606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZpF2WNt8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FzaNLFbp;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=YO1TuYJs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DdSkIHQhAppkS2Hhaj02LdC/RhI8GVMz9XKFgubFT/4=; b=ZpF2WNt8X5EMYXYn7WCwiGfs4O
	ux1JlTDDaargjh2ns68vjUFhI0tO+ByXMaBbQ+SN13b/Lagz6oRXMu2rFHhQ44VfAa8abdj3QnoH2
	vymweYPfHt1CIgiHJeLY+7wbmN4IFUqmDvaZt7QNirB9ZKwxKe4f+X5TH26WQl62kAIXLme+D3gHD
	zJP3n90vCgwVgP5ZN9GzBpzhHjGYR6ytQrUsizSFtLXQsAYR10Ws8mlA8m7a8Ub6MZmsSe9j+TY9s
	4YOX+NuFVTM5CMy+/vIZSyzaPmlJyv1bKxbyoaQihmy7rVHzKjOUsR79XVfHJL6HOUNDC1jOsqx5b
	YJA9qGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKV-00000008kBZ-0QYi;
	Thu, 12 Nov 2026 05:26:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKP-00000008k7N-1Xj7;
	Thu, 12 Nov 2026 05:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DdSkIHQhAppkS2Hhaj02LdC/RhI8GVMz9XKFgubFT/4=; b=FzaNLFbp0SXHQbtLDVNFdAppVR
	1YOQ1cvM1HnoYU5ABiQvzQMUCWkiVYysNqYm85+GD1LbXhrW90mVgwK0bdwFqJ9kPMsi/TwW1VM5j
	RGTlfYUAIlyfb7IVa/aSqIIWogbb6w0iWw931ohygFTlL6WIwZKhGblppyMTuTMbGSc9Io6rjSDDL
	eK9pd+x0XBQjWbrZqeKuJcSYRw/Q6LhsxzIuGb6BIZrTm7elIRXP2sX9i1YNPqzXXzXNDU3QU5ai8
	bc5u8wPZD4Mf4ylLpzju6Xi5OY+OWCIRyQzUPzv3SOUWFmiliL6ljoQQwMEnkdReA+facpMJ5OR1N
	m1lzMiRQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKH-00000009vLx-2hQK;
	Thu, 12 Nov 2026 05:26:25 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PkmrE3459342, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461146; bh=DdSkIHQhAppkS2Hhaj02LdC/RhI8GVMz9XKFgubFT/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=YO1TuYJsAIqb3/hxnAUf2dhxlqnygkm8EzRKcgiSBlvus9kp3pjO/SsDm0DfxYFHQ
	 RzgsPRa4uFAW69VkGlUgyXqZmKNGspasW8eH4QdavgsBDD+NFYrpKk+BTzSFVpADl3
	 GF3ogWUdbPRCC28Tkp3wi4/EJa0ah8DOk4E2xYipNWMsW0EzqnXeu4KbauC9Fhe5Hl
	 J5LsXzVRiwLpQ/lgAHCMe051vmrPeynhFWRSVl42RqbrybcU7e+9jcw7nQIrLnP8Ei
	 hZ6ZXFrPCI+w19drii1ESgj3N7osbFvsiPPwAIdHRsrqb0/rBjDJ6vYgznFywqmtP6
	 Ts1G2KOhUAv9w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PkmrE3459342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 4/9] clk: realtek: Add support for gate clock
Date: Thu, 12 Nov 2026 13:25:39 +0800
Message-ID: <20261112052544.555563-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112052544.555563-1-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052622_414887_F032F4C9 
X-CRM114-Status: GOOD (  18.48  )
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

Introduce clk_regmap_gate_ops supporting enable, disable, and is_enabled
for standard regmap gate clocks. To accommodate hardware designs, the
enable and disable operations handle a 'write_en' flag, which asserts an
adjacent write-enable bit (bit_idx + 1) simultaneously when modifying the
gate bit.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v16:
- Remove Brian's reviewed-by tag.
- Replace 'CLK_HW_INIT' with 'CLK_HW_INIT_HW' and 'CLK_HW_INIT_FW_NAME' macros
to avoid relying on unstable internal CCF global names.
- Drop all unused NO_PARENT macro and 'rtk_clk_regmap_gate_ro_ops'.
---
 drivers/clk/realtek/Makefile          |  1 +
 drivers/clk/realtek/clk-regmap-gate.c | 59 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-gate.h | 54 ++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 6fbe6e07b760..9397d677f52d 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,5 +2,6 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
+clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += clk-regmap-pll.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
new file mode 100644
index 000000000000..12539e11647c
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include "clk-regmap-gate.h"
+
+static int rtk_clk_regmap_gate_update(struct clk_hw *hw, bool enable)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	unsigned int mask = BIT(clkg->bit_idx);
+	unsigned int val = enable ? mask : 0;
+
+	/*
+	 * Hardware specific design: to modify the gate bit, the adjacent
+	 * write-enable bit (bit_idx + 1) must be asserted simultaneously.
+	 */
+	if (clkg->write_en) {
+		mask |= BIT(clkg->bit_idx + 1);
+		val |= BIT(clkg->bit_idx + 1);
+	}
+
+	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
+}
+
+static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	return rtk_clk_regmap_gate_update(hw, true);
+}
+
+static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	rtk_clk_regmap_gate_update(hw, false);
+}
+
+static int rtk_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	int ret;
+	u32 val;
+
+	ret = regmap_read(clkg->clkr.regmap, clkg->gate_ofs, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & BIT(clkg->bit_idx));
+}
+
+const struct clk_ops rtk_clk_regmap_gate_ops = {
+	.enable     = rtk_clk_regmap_gate_enable,
+	.disable    = rtk_clk_regmap_gate_disable,
+	.is_enabled = rtk_clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
new file mode 100644
index 000000000000..4540e73ca72b
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_GATE_H
+#define __CLK_REALTEK_CLK_REGMAP_GATE_H
+
+#include "clk-rtk-common.h"
+
+struct rtk_clk_regmap_gate {
+	struct rtk_clk_regmap clkr;
+	unsigned int gate_ofs;
+	u8 bit_idx;
+	u32 write_en : 1;
+};
+
+#define __rtk_clk_regmap_gate_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
+
+#define __RTK_CLK_REGMAP_GATE_HW(_name, _parent, _ops, _flags, _ofs, _bit_idx, _write_en) \
+struct rtk_clk_regmap_gate _name = { \
+	.clkr.hw.init = CLK_HW_INIT_HW(#_name, _parent, _ops, _flags), \
+	.gate_ofs = _ofs, \
+	.bit_idx = _bit_idx, \
+	.write_en = _write_en, \
+}
+
+#define RTK_CLK_REGMAP_GATE_HW(_name, _parent, _flags, _ofs, _bit_idx, _write_en) \
+	__RTK_CLK_REGMAP_GATE_HW(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, \
+				 _ofs, _bit_idx, _write_en)
+
+#define __RTK_CLK_REGMAP_GATE_FW_NAME(_name, _parent, _ops, _flags, _ofs, _bit_idx, _write_en) \
+struct rtk_clk_regmap_gate _name = { \
+	.clkr.hw.init = CLK_HW_INIT_FW_NAME(#_name, _parent, _ops, _flags), \
+	.gate_ofs = _ofs, \
+	.bit_idx = _bit_idx, \
+	.write_en = _write_en, \
+}
+
+#define RTK_CLK_REGMAP_GATE_FW_NAME(_name, _parent, _flags, _ofs, _bit_idx, _write_en) \
+	__RTK_CLK_REGMAP_GATE_FW_NAME(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, \
+				      _ofs, _bit_idx, _write_en)
+
+static inline struct rtk_clk_regmap_gate *to_rtk_clk_regmap_gate(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_gate, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_gate_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
-- 
2.43.0


