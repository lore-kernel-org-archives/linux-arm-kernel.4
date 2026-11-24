Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F94C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b5PU8clS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kNvAaXKh;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kyH/2jW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QC6CLzWd/YK7FzJemA/kc1XWRISB9OLj7BLpGSxA8eA=; b=b5PU8clSh+IbNKbeLQdI8kwM0G
	IIf7qiCGh2kV0KkCnh1lMRUczJENECq8ovIjdIbH+OfS6GD7TleaXZlk8YIe5NzCoGMIXLmk4hgOH
	Bk0nQwWrOsl/DnPpCWeWRdcEsS/dVDxBOjGKWrN+zcFqVZF5rwBaoxoXvg9a4OD7EWTioXBCqOigZ
	FzprxHJUVjDCPzeOCXNe4uskIJml5i6dAHWJHyjDQghOG8Q0JN+b/IPa0kB8fUo41HnifY+qSeIej
	Sv9lttQgxCvS5zx0Ej+l+Sy9XeUCYY03hNmmmynNAYIfR4Ta599Pegze3Of5NQQ7x+ibYuLydcKlX
	yLT6QlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgOr-00000005NX2-3pty;
	Tue, 24 Nov 2026 02:36:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgOr-00000005NWp-0Ux4;
	Tue, 24 Nov 2026 02:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QC6CLzWd/YK7FzJemA/kc1XWRISB9OLj7BLpGSxA8eA=; b=kNvAaXKhHntnTNFt7tMi9+JVQT
	a1xvn3CGZr9uWThhEZYxbSgSVT71RNhnIzM7bh1CGoJ+aVCiknhMzCWp+Ga4aL4zBVB5JEyYvLDZb
	ezYcu0hmivLWLn0GFw6sgxj1Rnh/pT+pKJ2NCEC5v93K+vilDQCUJF+UffZrJGzEgal3aT+FKqSRP
	WfdOnafDuhRw+CsDlSNp1tuo6L17oQDw6nOwOQPTYSixkSi+bo58ci9DN2Pz39jd2igUv8tH/WXbz
	BhivaQQSConvUKbs7VyHUg5XpuzY77NXCAM9g2Sy0ndZEOlQN5vmF+Bu45lmR0LWjj2Gh85299ueE
	MChUhWGw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgOl-00000003lp8-0pEg;
	Tue, 24 Nov 2026 02:36:51 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2Zxw462160551, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487759; bh=QC6CLzWd/YK7FzJemA/kc1XWRISB9OLj7BLpGSxA8eA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kyH/2jW8UQWbj+0jUyNKzPzkQxnZzrQPHzsFJZXaLnwMuD8PmeXcZtYisJdMLl7wL
	 dTXVeDlmrC6nkaK4vOjOt7K9dXUIqnh1tj2dsGWACew7eUo3VjRxaxH4CTYbhumAht
	 BS+dhswaX5UVmQqDpUXl9zO/AHKaMtiXdthPEmgwvT01bhHiyy2PssV+CMQpbpjdre
	 uW9tPfGEXblFehix6O6cQH7V1Fbza1NfCRmc9MK4mnIl5ywKTT1+8TKrBWPIxN2LuJ
	 QamviiV231UBSlTFUdykMGebd/NqB9Xzsk8+HXgV4zyu0hKrxoHxv1QkHLaOmOkWFG
	 ekQHweWgtqXug==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2Zxw462160551
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
Subject: [PATCH v17 4/9] clk: realtek: Add support for gate clock
Date: Tue, 24 Nov 2026 10:35:52 +0800
Message-ID: <20261124023558.4088635-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124023558.4088635-1-eleanor.lin@realtek.com>
References: <20261124023558.4088635-1-eleanor.lin@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_023649_453658_63E9FC54 
X-CRM114-Status: GOOD (  19.60  )
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
Changes in v17:
- Return 0 instead of the error code from '.is_enabled()'.
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
index 000000000000..094cd18660c5
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
+		return 0;
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


