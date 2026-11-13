Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YqxHfcTI;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=JnbVHKgI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wmZTKP8AkFpo88yYS9lI1c1Yb1KHZ45faZHvkLABff0=; b=YqxHfcTIHc0W4M
	TuOZRv9BzG4KKYOzjtPqt/Vv0xkSE8+cP0u+SnCJ+Xpi3l3pOowejA6KwoEKzk3dwWYsZMGKHUj9l
	6ZqACEjYs2yR7X9xbODLcNXm9ICcYPHg0+0PR0xd7q36T47gzN+n9J1I4Cxb77yl05zKn9dSGQnhs
	M3Loibpvxj2zfy8bGtVengPzGyafAL7D7SKt3DdWtvW8L/RldQMRP+rlUG+kV5I6qlaMkeyJGHpZN
	rxoGDHYwf81hF35IPnRfTGbtlpVjYSSH77b5gc7t27O40bHa6sL3WqSWrfMvUBoNdGqX8TRoN4Gvc
	ToygsgzGdQ+HeqrF8KIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoOJ-0000000CL4V-3GUP;
	Fri, 13 Nov 2026 10:20:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoO5-0000000CKyh-48hL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794565204; x=1826101204;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=KHzBl8IqRRN8d0OWf58A1H+V0NtTw3LAiHJ4yCsHqRA=;
  b=JnbVHKgI3lK1pBIu2y/2YvXRDbqiitzuDP/WMOa11s4ca63lhyIo7P16
   huZ+EnKPCzQkde8e7lyaY3KkwvfmNUNFu10G6/3pecTGgTc+7k2zygA9B
   SPKtcwi0v3gcbUkG7/fIJ0O/0pjdjGLI8ZnK3NpqsRgBVMU4D562aww2x
   QDPMF0ZzTCtO0MV2V4kxOHDWpfYBtdGdn+vCwd4BNgF5sYVZOkJ9pk8Ud
   wTT0PkUd7A/P1/sfNuk5BuTCyzJznK+o8On6A/M5pgAmi0Lkb93FbZg9X
   C9Jq6SfCTZKnSkmZwYE7tWcLxkhAqXfvvv22PaA2zY7qxe72l7p67sbaE
   w==;
X-CSE-ConnectionGUID: YE4i8/bMQBio6/YwFK363A==
X-CSE-MsgGUID: 8nzJ/0UoRn6kBa+fUPonlQ==
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="77158701"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2026 03:20:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 13 Nov 2026 03:20:05 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 13 Nov 2026 03:20:02 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 13 Nov 2026 11:19:40 +0100
Subject: [PATCH net-next 1/4] net: lan969x: add the core PLL registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261113-lan969x-core-skew-v1-1-b9b02b863d38@microchip.com>
References: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
In-Reply-To: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022006_620437_EFC26F2E 
X-CRM114-Status: GOOD (  12.53  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the CHIP_TOP registers required to configure the lan969x core PLL,
and map the CHIP_TOP target. They are used in a later patch of this
series.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |  1 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 82 ++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
index c02499d1b297a..df211e608056a 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
@@ -13,6 +13,7 @@ static const struct sparx5_main_io_resource lan969x_main_iomap[] =  {
 	{ TARGET_CPU,                   0xc0000, 0 }, /* 0xe00c0000 */
 	{ TARGET_FDMA,                  0xc0400, 0 }, /* 0xe00c0400 */
 	{ TARGET_GCB,                 0x2010000, 1 }, /* 0xe2010000 */
+	{ TARGET_CHIP_TOP,            0x2020000, 1 }, /* 0xe2020000 */
 	{ TARGET_QS,                  0x2030000, 1 }, /* 0xe2030000 */
 	{ TARGET_PTP,                 0x2040000, 1 }, /* 0xe2040000 */
 	{ TARGET_ANA_ACL,             0x2050000, 1 }, /* 0xe2050000 */
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index 1bf7dabf622e6..071d2f013a195 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -26,6 +26,7 @@ enum sparx5_target {
 	TARGET_ANA_L2 = 7,
 	TARGET_ANA_L3 = 8,
 	TARGET_ASM = 9,
+	TARGET_CHIP_TOP = 10,
 	TARGET_CLKGEN = 11,
 	TARGET_CPU = 12,
 	TARGET_DEV10G = 17,
@@ -2636,6 +2637,87 @@ extern const struct sparx5_regs *regs;
 #define ASM_RAM_INIT_RAM_CFG_HOOK_GET(x)\
 	FIELD_GET(ASM_RAM_INIT_RAM_CFG_HOOK, x)
 
+/* LAN969X ONLY */
+/* CHIP_TOP:HW_STAT:HW_STAT */
+#define CHIP_TOP_HW_STAT                                                       \
+	__REG(TARGET_CHIP_TOP, 0, 1, 92, 0, 1, 4, 0, 0, 1, 4)
+
+#define CHIP_TOP_HW_STAT_REFCLK_SEL              BIT(1)
+#define CHIP_TOP_HW_STAT_REFCLK_SEL_SET(x)\
+	FIELD_PREP(CHIP_TOP_HW_STAT_REFCLK_SEL, x)
+#define CHIP_TOP_HW_STAT_REFCLK_SEL_GET(x)\
+	FIELD_GET(CHIP_TOP_HW_STAT_REFCLK_SEL, x)
+
+/* LAN969X ONLY */
+/* CHIP_TOP:CORE_PLL_CFG:CORE_PLL_CFG */
+#define CHIP_TOP_CORE_PLL_CFG                                                  \
+	__REG(TARGET_CHIP_TOP, 0, 1, 212, 0, 1, 8, 0, 0, 1, 4)
+
+#define CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL        GENMASK(29, 28)
+#define CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL, x)
+#define CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL, x)
+
+#define CHIP_TOP_CORE_PLL_CFG_DIVACK             BIT(27)
+#define CHIP_TOP_CORE_PLL_CFG_DIVACK_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_CFG_DIVACK, x)
+#define CHIP_TOP_CORE_PLL_CFG_DIVACK_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_CFG_DIVACK, x)
+
+#define CHIP_TOP_CORE_PLL_CFG_NEWDIV             BIT(26)
+#define CHIP_TOP_CORE_PLL_CFG_NEWDIV_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_CFG_NEWDIV, x)
+#define CHIP_TOP_CORE_PLL_CFG_NEWDIV_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_CFG_NEWDIV, x)
+
+#define CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE       GENMASK(25, 23)
+#define CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE, x)
+#define CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE, x)
+
+#define CHIP_TOP_CORE_PLL_CFG_DIVQ               GENMASK(22, 8)
+#define CHIP_TOP_CORE_PLL_CFG_DIVQ_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_CFG_DIVQ, x)
+#define CHIP_TOP_CORE_PLL_CFG_DIVQ_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_CFG_DIVQ, x)
+
+#define CHIP_TOP_CORE_PLL_CFG_DIVR               GENMASK(7, 2)
+#define CHIP_TOP_CORE_PLL_CFG_DIVR_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_CFG_DIVR, x)
+#define CHIP_TOP_CORE_PLL_CFG_DIVR_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_CFG_DIVR, x)
+
+#define CHIP_TOP_CORE_PLL_CFG_ENA_CFG            BIT(1)
+#define CHIP_TOP_CORE_PLL_CFG_ENA_CFG_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_CFG_ENA_CFG, x)
+#define CHIP_TOP_CORE_PLL_CFG_ENA_CFG_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_CFG_ENA_CFG, x)
+
+#define CHIP_TOP_CORE_PLL_CFG_LOCK_STAT          BIT(0)
+#define CHIP_TOP_CORE_PLL_CFG_LOCK_STAT_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_CFG_LOCK_STAT, x)
+#define CHIP_TOP_CORE_PLL_CFG_LOCK_STAT_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_CFG_LOCK_STAT, x)
+
+/* LAN969X ONLY */
+/* CHIP_TOP:CORE_PLL_CFG:CORE_PLL_FREQ_CFG */
+#define CHIP_TOP_CORE_PLL_FREQ_CFG                                             \
+	__REG(TARGET_CHIP_TOP, 0, 1, 212, 0, 1, 8, 4, 0, 1, 4)
+
+#define CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI         GENMASK(30, 24)
+#define CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI, x)
+#define CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI, x)
+
+#define CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF         GENMASK(23, 0)
+#define CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF_SET(x)\
+	FIELD_PREP(CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF, x)
+#define CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF_GET(x)\
+	FIELD_GET(CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF, x)
+
 /* SPARX5 ONLY */
 /* CLKGEN:LCPLL1:LCPLL1_CORE_CLK_CFG */
 #define CLKGEN_LCPLL1_CORE_CLK_CFG                                             \

-- 
2.34.1


