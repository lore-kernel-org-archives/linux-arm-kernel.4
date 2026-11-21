Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vkLCWtKd;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gsRSMffZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UTJX+tcvo3R3E5PJ/uygxppi2tr2IitzqXxlzPaiOCc=; b=vkLCWtKd2qJvJi
	oUYKX5+CgIBJymspt/9ZEddtBcCgZx6OTO+/F6k5OSSC/gYp661RAGIJpLIg4iPEN2WKF7pjUzbms
	lKbry34/zkKHo7LS4Y6ykoBWfPlgHSVZHp+wwpCER7tLNRTGrpGTfua9NHb2RQB+tWmbDw57T1d40
	IOfQ/XJRmqRNO536GxOoSASc8MvalKK5OYF8aatj9PlX32btdh7zc33eQlStUVhHAvWG1v+VyGU0x
	cdD7vE+6rwe9d5KX6wyoKgG7E6HNH3VW5aoy6TQf1drsW0aRVWpMbOJUy4imhaPBBVlWcM2e9P3L3
	HuTB7Nh54iN7Xgji8zzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUioQ-0000000H3q3-1Bx7;
	Sat, 21 Nov 2026 10:59:18 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUioH-0000000H3n2-1V11;
	Sat, 21 Nov 2026 10:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795258744; bh=UTJX+tcvo3R3E5PJ/uygxppi2tr2IitzqXxlzPaiOCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gsRSMffZWtIpmbsZFbe1HuNRG+66wo2eWxuUL9BXuN7QsbfEnTLJYWFilDi4lKb4J
	 6bZkXIsy3nrhPmYev3ZevMDh3p59f4Btqf80j7Qc7de3Jr/DdW8Jo8wsKI/fDHn4RF
	 d+pSVlEVzSxUcKgIKPJjJijUpZEPA8NoCycPTudM=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id EBA89487; Sat, 21 Nov 2026 18:58:58 +0800
X-QQ-mid: xmsmtpt1795258740tr31uycgp
Message-ID: <tencent_6DE9C8A75BC0B999E08A6DD1A67AC25C5705@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJ6BC0KyBCR9g6YVS6MrPbsiOGBPpw0+PXw2cMEzhN2aJ8wwVfTE
	 wF3GAy4lYP3ghHO8CWN5CjlwVffY+tskYo2DZuEhMNvdHF91A30NMJfl41fZvxtfgUD6hLnZsXGq
	 EsBesXArVkC/InaXddlGFx0YuwEx6LLeFVJ+QPxy2DgwMN7JiF8DsOMRxLOdvVGpdLPgY0xrU9eq
	 XQBE2Pi4+iQPIwfoGaXHkwvhUkB82OzQWYA4BOZkqGwSN9+7ergwINW/XOCo72e3aId9jgI90Mck
	 j4Q9uSccAFT5NKHz4JBk95ts8cL30IB3Hu/+byJi4bJsx8MSIKNsc7nVLeB932Mtq714rkPGo1Xw
	 F8vbThIdMTnrCG3tbkXSQDaqnyYo39rV6WN5Ge+VAlcIG7TJWuZV9H2VlwnZPql3hkYrBzeN3+Sv
	 PZ4BblDFM+F3o1PXnjWnSxOnnnyQO+fr7tqM5gkZYGzgEdA81FvKMxBtrnU9eURS+5SaJ0hOsWz3
	 KSarzP6PCZZb0OVEcdNwNaVjRo5m53OgEDPR6omSFfvf0Uwm4fj9vGJQ+NDtD3su1+/P8U4spseI
	 dDlotqbSM7e6ci1/p9BOFzQmgdxgGYO68Ii9l1W0fnKEBtDSpiB/loXixBeTcr+YHvnNON8AH7kI
	 +W8vQhQ4Kox+SbnUKxjur5TSO8xJKwvSlHgyAyYF+Y3F/I6pDKgxvtNk1T2+J0Em/1endiEifetd
	 qKl9gkFrzriR9/R39ANElnqN0maFMQ9B/DazCzmRBFjUmb3q4YcwWJ0L6hEehf3ZhAHFs2hwziLA
	 D0eR4Tg15VYWKb49ARGkis/diiLvJCX57GtP4WPoJu5aWKcBKxMqu4t8SEUtlq0K6K55eZ6qGSSw
	 XIOcodasplsMWws5f4hwnRKsCCr9m6NQ6oHYVEG5oCNuUXfkFhBeIXAcctrYB1vqn7MQQAPtpblG
	 Bcp+GhNOM+Jz28kNG2hWEHuimZ+6IWQkH/IKnXK/ckUxj6y9NDR13GCztgYENPP9Hyi8EzFZP/8z
	 EGJ3u5L501Fxzz1ouk1ac8ZnmiTyrX8yaPE0/TbGdRrFFSkvHcA4Ws4cQtf/13q82SOITP65MjqL
	 YrfxEKacLZPJlb+QXimePcUweNpg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: ZhuXiangyu <1194781887@qq.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 2/2] clk: rockchip: add clock output/input switch driver
Date: Sat, 21 Nov 2026 18:58:56 +0800
X-OQ-MSGID: <20261121105856.1414984-2-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121105856.1414984-1-1194781887@qq.com>
References: <20261121105856.1414984-1-1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_025909_927812_1F0E732A 
X-CRM114-Status: GOOD (  19.72  )
X-Spam-Score: -1.8 (-)
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

Add a small driver for the Rockchip GRF-controlled clock output/input
switch. It exposes a single gate bit as a clock, allowing the SAI MCLK
pin direction to be controlled through the clock framework.

Tested on an RK3506B board with the ES8388 codec: this clock drives the
I2S MCLK and audio playback works.

Tested-by: ZhuXiangyu <1194781887@qq.com>
Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 drivers/clk/rockchip/Kconfig   |  8 ++++
 drivers/clk/rockchip/Makefile  |  1 +
 drivers/clk/rockchip/clk-out.c | 70 ++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 drivers/clk/rockchip/clk-out.c

diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index 4b55f48d..dfbdb231 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -156,4 +156,12 @@ config CLK_RK3588
 	help
 	  Build the driver for RK3588 Clock Driver.
 
+config ROCKCHIP_CLK_OUT
+	tristate "Rockchip clock output/input switch"
+	help
+	  Say Y or M here to enable the Rockchip clock output/input switch
+	  driver. It exposes a GRF-controlled clock gate used for the SAI
+	  MCLK output pins. The pin direction is controlled through the
+	  common clock framework.
+
 endif
diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
index 554b7eb8..eed5fb59 100644
--- a/drivers/clk/rockchip/Makefile
+++ b/drivers/clk/rockchip/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_COMMON_CLK_ROCKCHIP) += clk-rockchip.o
+obj-$(CONFIG_ROCKCHIP_CLK_OUT) += clk-out.o
 
 clk-rockchip-y += clk.o
 clk-rockchip-y += clk-pll.o
diff --git a/drivers/clk/rockchip/clk-out.c b/drivers/clk/rockchip/clk-out.c
new file mode 100644
index 00000000..de56ff1f
--- /dev/null
+++ b/drivers/clk/rockchip/clk-out.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2023 Rockchip Electronics Co., Ltd.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+static DEFINE_SPINLOCK(clk_out_lock);
+
+static int rockchip_clk_out_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	const char *clk_name;
+	const char *parent_name;
+	struct clk_hw *hw;
+	void __iomem *reg;
+	u8 clk_gate_flags = CLK_GATE_HIWORD_MASK;
+	u32 shift;
+	int ret;
+
+	ret = device_property_read_string(dev, "clock-output-names", &clk_name);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u32(dev, "rockchip,bit-shift", &shift);
+	if (ret)
+		return ret;
+
+	if (device_property_read_bool(dev, "rockchip,bit-set-to-disable"))
+		clk_gate_flags |= CLK_GATE_SET_TO_DISABLE;
+
+	parent_name = of_clk_get_parent_name(node, 0);
+	if (!parent_name)
+		return -EINVAL;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	hw = devm_clk_hw_register_gate(dev, clk_name, parent_name,
+				       CLK_SET_RATE_PARENT, reg, shift,
+				       clk_gate_flags, &clk_out_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
+}
+
+static const struct of_device_id rockchip_clk_out_match[] = {
+	{ .compatible = "rockchip,clk-out" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rockchip_clk_out_match);
+
+static struct platform_driver rockchip_clk_out_driver = {
+	.driver = {
+		.name = "rockchip-clk-out",
+		.of_match_table = rockchip_clk_out_match,
+	},
+	.probe = rockchip_clk_out_probe,
+};
+module_platform_driver(rockchip_clk_out_driver);
+
+MODULE_DESCRIPTION("Rockchip Clock Input-Output-Switch");
+MODULE_AUTHOR("Sugar Zhang <sugar.zhang@rock-chips.com>");
+MODULE_LICENSE("GPL");
-- 
2.47.3


