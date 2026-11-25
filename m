Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F9A606A684
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eelVgrNN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FyKQvJt0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+mt4v5TKcuFNPHnEj9B2hxvtTkKA1RUmlDuN7rlM2O8=; b=eelVgrNNjtUmQk37DWIX3fzwpk
	wVsCEPf29z0VP3C5M5c9Dx9hALrxt47xcfSk7fEv/SIR0xiqvOVkcIcqPBSBbSlbMb8eINqMGHfDp
	Pxugydcm+AD4AaWazhFJD4pUZ6PvCvEHo4nYulRXgfnc9Gzr9Oc3+8T7Ho79Mm3P2rtm/eY5Zssmr
	jeZ1i/aAmVJ1oDTEm8RQOqa1PjDJEHbpO8Phrr3BNv5aOkv5/APhmq2IIPS6L6ITDIVCFxeYjBpoJ
	A2GIG9dX2OfF9r/+SLoCveNlasFPhZCrEK4jnyajnBCucwfDucqH04c8cPsK6evb3qLJ+YgYLWEi7
	f++ymhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9P6-00000009Ivg-45tk;
	Wed, 25 Nov 2026 09:35:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9P0-00000009Ioc-0iqK;
	Wed, 25 Nov 2026 09:34:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5FB8416A3;
	Wed, 25 Nov 2026 09:34:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795599297;
	b=q2gXnl5/ywlaAXn+tHcy4REJ7PsoO8ArlK9m6F0H5GSOBDblzDt1HOHt+ruoiD99p6Rx
	 ysskdkylusiZ+QlMM7leurpk+RtgjSImAwFPs75WFl4U4sSSVY9o+iR2LdHSyQl42gnMs
	 1XTd45yEyJlvNB8hDc0oxtEIgjWqieT8HfRbVyGC+GUTQfrZNuE+xAnJxdGQ+BbDAesQY
	 difE1Q68qxXA8LYZdmxaH7w7hnQgKhyOd9F/qJFt8MaFbOC6F9ZIZ4SxY0vUVYQSQNVcJ
	 X18Adg1duZSU2P6pJGFyh4QXql0q89ytlkw1f1bVfxO5WKma8fVgH6bbVhOf0ZjTHBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599297;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+mt4v5TKcuFNPHnEj9B2hxvtTkKA1RUmlDuN7rlM2O8=;
	b=cV0EkJ2EQ2AbU6mKOmqm0DuIwaPHOk35nXUIBCb9uGiHEm0UsMx6uDdqh0JhtmVbrv7L
	 AzOjaa4Z1t5URwHdGGbtNIx4ZAA74HKDq6ZWV/bUAJW6oiMPhARBhUoua0EAy6kk80ZdT
	 SG32CrYrbhhyByYK6RvzMJhfGrSknF9ms1YWS+0ihzG3KgHnFevMXcDgkyXML8Ku4sPK7
	 OukquqfcR45/mjDl7Ihhqhs4qYGkuR/j0KddRLUVyd5HK+I+ASFcEaRp2FoSnaZ6IZmLp
	 I2gN5bXg6qBx86G/JN95IAYoOUihGBux20vPoz+eJF9GI277lqkH74d0H9pf47/TP/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43BA41F000F0;
	Wed, 25 Nov 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599297;
	bh=+mt4v5TKcuFNPHnEj9B2hxvtTkKA1RUmlDuN7rlM2O8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FyKQvJt0t1GDIpgI2bMkdjajXp8Uet8x34hluDDpljgF1u3ic2RySgM/msPFiW0fQ
	 TD2UVRWsmsGkkJy1H+CPJnhHKe4VThLIPI5Z7pyVoxjromRhlqcVbO0VGcAtspTXOF
	 NavYR+pGdvVPJzcirg49xY6bNhjHmuhGYkwsn+eide4YEpVZNjV1/QYvE5StrZfbj9
	 jBlr78PkVklyhFVULUysstC2wAJSczH2fn4Gm/ReRET6ia+nSwQVrZjaCc+EkREW8p
	 a2lGEdksgWqlKML1NOe6RnmuLjqfLOvXFS1jUOu60EnMYZ+jvxDHA4d4driZciTe9e
	 Pt1B22RlcQSUw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 05EC34CE06;
	Wed, 25 Nov 2026 09:34:37 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Nov 2026 10:33:48 +0100
Subject: [PATCH RFC v4 06/15] net: pcs: xpcs: add NXP S32G SerDes XPCS
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-s32g_serdes-v4-6-3bfe0589be8d@oss.nxp.com>
References: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
In-Reply-To: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
 Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599274; l=6539;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=W6rh1RjPdoeMIJ8ZCm9nMWjlrgL9L0gDkZs/tQBH5Kg=;
 b=1Vt5k1XKAL0Rd6NXHG2t0dl7NSnFrPcxtYcfixDjEx2Y/DIdel+2ld8UhvWqjiYKpY6vd6Kue
 MomSGhAuYUPD9uFsvq8uknK0ZMf/+i6uCG+qFmwW1tkgne6vSDFMn7Z
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The NXP S32G SerDes subsystem has two DesignWare XPCS instances behind
an indirect MMIO window, next to a combo PHY which the XPCS lanes may
share with a PCIe controller. The S32G SerDes driver exposes each
instance as an MDIO bus.

The XPCS reports the generic DesignWare PCS ID; what differs on S32G is
the PMA integration. Add NXP_S32G_XPCS_PMA_ID, for the S32G glue driver
to declare, and an entry for the DesignWare PCS ID with that PMA. The
entry:

 - supports SGMII only;

 - has a PMA hook which sets the SGMII link timer to the 1.6 ms that
   phylink gives for SGMII, then sets CL37_TMR_OVR_RIDE, without which
   the timer value is not used. pcs-xpcs restarted AN before the hook,
   with the old timer, so the hook restarts it when AN is enabled. The
   PLLs and the lane's PLL selection are set up once by the SerDes
   bring-up; the 1G sequence of the RM has no TX/RX request and no PCS
   flush;

 - sets DW_XPCS_QUIRK_NO_SOFT_RESET: the XPCS reset is part of the combo
   PHY bring-up, which the SerDes driver sequences against the PCIe
   lane and the other XPCS instance;

 - sets DW_XPCS_QUIRK_NO_EEE: VR_MII_EEE_MCTRL0/1 are not implemented.

The PMA hook is in pcs-xpcs-s32g.c, as the Wangxun one is in
pcs-xpcs-wx.c.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/pcs/Makefile        |  3 ++-
 drivers/net/pcs/pcs-xpcs-s32g.c | 48 +++++++++++++++++++++++++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c      | 16 ++++++++++++++
 drivers/net/pcs/pcs-xpcs.h      |  5 +++++
 include/linux/pcs/pcs-xpcs.h    |  2 ++
 5 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index f9f6cf2578d7..072b8214446b 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
-pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-wx.o
+pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-s32g.o \
+				   pcs-xpcs-wx.o
 
 obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
 obj-$(CONFIG_PCS_XPCS_PLATFORM) += pcs-xpcs-plat.o
diff --git a/drivers/net/pcs/pcs-xpcs-s32g.c b/drivers/net/pcs/pcs-xpcs-s32g.c
new file mode 100644
index 000000000000..9283c5931f1b
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-s32g.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NXP S32G SerDes XPCS support for pcs-xpcs
+ *
+ * Copyright 2026 NXP
+ */
+#include <linux/math.h>
+#include <linux/mii.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/phylink.h>
+#include "pcs-xpcs.h"
+
+/*
+ * DW_VR_MII_LINK_TIMER_CTRL holds bits [23:8] of a 24 bit count of 8 ns
+ * cycles; the low byte is fixed at 0x7d.
+ */
+#define S32G_LINK_TIMER_CYCLE_NS	8
+#define S32G_LINK_TIMER_LOW		0x7d
+
+int nxp_s32g_sgmii_pma_config(struct dw_xpcs *xpcs)
+{
+	int cycles = phylink_get_link_timer_ns(PHY_INTERFACE_MODE_SGMII) /
+		     S32G_LINK_TIMER_CYCLE_NS;
+	int ret;
+
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_LINK_TIMER_CTRL,
+			 DIV_ROUND_CLOSEST(cycles - S32G_LINK_TIMER_LOW, 256));
+	if (ret < 0)
+		return ret;
+
+	/* The timer value is used only once the override is set after it */
+	ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1,
+			  DW_VR_MII_DIG_CTRL1_CL37_TMR_OVR_RIDE,
+			  DW_VR_MII_DIG_CTRL1_CL37_TMR_OVR_RIDE);
+	if (ret < 0)
+		return ret;
+
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
+	if (ret < 0)
+		return ret;
+
+	if (!(ret & BMCR_ANENABLE))
+		return 0;
+
+	/* pcs-xpcs restarted AN before this hook, with the old timer */
+	return xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+			   BMCR_ANRESTART);
+}
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 3b5857dc44f3..71e5882f4b0b 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1507,6 +1507,16 @@ static const struct dw_xpcs_compat nxp_sja1110_xpcs_compat[] = {
 	}
 };
 
+static const struct dw_xpcs_compat nxp_s32g_xpcs_compat[] = {
+	{
+		.interface = PHY_INTERFACE_MODE_SGMII,
+		.supported = xpcs_sgmii_features,
+		.an_mode = DW_AN_C37_SGMII,
+		.pma_config = nxp_s32g_sgmii_pma_config,
+	}, {
+	}
+};
+
 static const struct dw_xpcs_desc xpcs_desc_list[] = {
 	{
 		.id = DW_XPCS_ID,
@@ -1520,6 +1530,12 @@ static const struct dw_xpcs_desc xpcs_desc_list[] = {
 		.id = NXP_SJA1110_XPCS_ID,
 		.mask = DW_XPCS_ID_MASK,
 		.compat = nxp_sja1110_xpcs_compat,
+	}, {
+		.id = DW_XPCS_ID,
+		.mask = DW_XPCS_ID_MASK,
+		.pma = NXP_S32G_XPCS_PMA_ID,
+		.compat = nxp_s32g_xpcs_compat,
+		.quirks = DW_XPCS_QUIRK_NO_SOFT_RESET | DW_XPCS_QUIRK_NO_EEE,
 	},
 };
 
diff --git a/drivers/net/pcs/pcs-xpcs.h b/drivers/net/pcs/pcs-xpcs.h
index 929fa238445e..fb41cdff2b35 100644
--- a/drivers/net/pcs/pcs-xpcs.h
+++ b/drivers/net/pcs/pcs-xpcs.h
@@ -56,6 +56,8 @@
 /* VR MII MMD registers offsets */
 #define DW_VR_MII_DIG_CTRL1		0x8000
 #define DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW		BIT(9)
+#define DW_VR_MII_DIG_CTRL1_INIT		BIT(8)
+#define DW_VR_MII_DIG_CTRL1_CL37_TMR_OVR_RIDE	BIT(3)
 #define DW_VR_MII_DIG_CTRL1_2G5_EN		BIT(2)
 #define DW_VR_MII_DIG_CTRL1_PHY_MODE_CTRL	BIT(0)
 
@@ -87,6 +89,8 @@
 #define DW_VR_MII_EEE_RX_EN_CTRL		BIT(7)  /* Rx Control Enable */
 #define DW_VR_MII_EEE_MULT_FACT_100NS		GENMASK(11, 8)
 
+#define DW_VR_MII_LINK_TIMER_CTRL	0x800a
+
 #define DW_VR_MII_EEE_MCTRL1		0x800b
 #define DW_VR_MII_EEE_TRN_LPI		BIT(0)	/* Transparent Mode Enable */
 
@@ -124,4 +128,5 @@ int xpcs_write_vpcs(struct dw_xpcs *xpcs, int reg, u16 val);
 int nxp_sja1105_sgmii_pma_config(struct dw_xpcs *xpcs);
 int nxp_sja1110_sgmii_pma_config(struct dw_xpcs *xpcs);
 int nxp_sja1110_2500basex_pma_config(struct dw_xpcs *xpcs);
+int nxp_s32g_sgmii_pma_config(struct dw_xpcs *xpcs);
 int txgbe_xpcs_switch_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index f46434958383..ca17a8c1f23e 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -38,6 +38,8 @@ enum dw_xpcs_pma_id {
 	DW_XPCS_PMA_GEN4_6G_ID,
 	DW_XPCS_PMA_GEN5_10G_ID,
 	DW_XPCS_PMA_GEN5_12G_ID,
+	/* NXP S32G SerDes PMA, declared by its glue driver */
+	NXP_S32G_XPCS_PMA_ID,
 	WX_TXGBE_XPCS_PMA_10G_ID = 0xfc806000,
 	/* Meta Platforms OUI 88:25:08, model 0, revision 0 */
 	MP_FBNIC_XPCS_PMA_100G_ID = 0x46904000,

-- 
2.55.0



