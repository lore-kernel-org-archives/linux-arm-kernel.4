Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF9606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bwftn/w6;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0C7mQjQ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sfczlqGoqcKf8BJ99b2cU5jN/FIN0u2riNdIo/NS2VI=; b=Bwftn/w6n2hB/g
	AtrMfYZmu8ilgt235+jgXDjwRIpACAPzgPfJXT7nOZSnLd2iuV5ThWrnC6XG3HkjJ5IdM8FxqkOi0
	rbusERSwOqwpoc6GQWpMhwaS3R+cFU0MN3cYhxFu1wfsPiV/bv13gis23Dd4twaciqOMjb4C0aFgm
	8n8aBF6o59hMU+xKJtkDgb5fsRx0xrdoTpi4lSZlvJnABTKGbTdZ/m4nsi+eGZyLuu6yCegEA0M9g
	rvf7h7Gg9oh3JMX5wXGucDxlYP2P31Is2axxk1lO0yj8Ur4+wqblpF6pRKSkkzo959qRykSqRvpyy
	KPO8eB2iPljqgBMgunuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNF9-0000000Esnx-2dmw;
	Fri, 20 Nov 2026 11:57:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNF5-0000000Eskv-1A8H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795175843; x=1826711843;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=zJ77KNPLAy3FkxE89rjoPqq7WV3HynUXY47vntOrBEM=;
  b=0C7mQjQ1Cqzbhg9Pm7tS57o8BHDBkN4ER+vRoTvoO8V3gg5hpWORCH33
   tKYw/7F4c9k1yWluT8yxv7XWiER0nA9ZcpubFeiV2MqRvfvqKO1i/w9Cv
   IhGoC6ERr3vjiTL26KTftoyHC8dbdNrOMGsLqQUgUGQ5kEala2a6iwvBY
   cvYKW8y4LOvp/ORdF0YsSEcZMj6XSyp7EZzuzSOuY4AsGl79er1AZqBn1
   b2pe6jysCSJTyTaqkU8JV8bruye7kf/pAcFAEkKUusbROOIGsNrMR4UiJ
   L7G2qKe+jxTr73Y4lqffqPmDIbfLOjFgXfe/4E8iOCHMlYt+aQ+8ZmiJg
   Q==;
X-CSE-ConnectionGUID: IYBPOYx/TG6PbKYoUCy5DA==
X-CSE-MsgGUID: XlqjDEXhRGKjuk5tT86AGA==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="67053189"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:57:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 04:57:22 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 20 Nov 2026 04:57:19 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Nov 2026 12:57:00 +0100
Subject: [PATCH net-next v3 3/9] net: sparx5/lan969x: add a helper for
 setting the MAC max frame length
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-sparx5-mtu-change-v3-3-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
In-Reply-To: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_035723_606783_6D744CF6 
X-CRM114-Status: GOOD (  19.12  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The maximum frame length accepted by a port is set in the MAC_MAXLEN_CFG
register of its MAC. All ports have a 2G5 device, the 5G, 10G and 25G
ports also have a high speed device, and the lan969x RGMII ports have an
RGMII device instead. The register is currently written open-coded in
sparx5_port_init(), with a fixed length of 1518 bytes.

Add sparx5_port_max_len_set(), which sets the maximum frame length in the
devices of a port, and use it in sparx5_port_init(). To support the
RGMII devices, add the DEVRGMII_MAC_MAXLEN_CFG register, and make
lan969x_port_dev_mapping() return the RGMII device index for the RGMII
ports.

The helper is used to change the maximum frame length with the MTU, later
in this series.

No functional change intended.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |  9 ++++
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 11 +++++
 .../net/ethernet/microchip/sparx5/sparx5_port.c    | 50 ++++++++++++++++------
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |  4 ++
 4 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
index df211e608056a..fd1b55eae9c3a 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
@@ -181,6 +181,15 @@ static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int port)
 		}
 	}
 
+	if (lan969x_port_is_rgmii(port)) {
+		switch (port) {
+		case 28:
+			return 0;
+		case 29:
+			return 1;
+		}
+	}
+
 	/* 2g5 port */
 	return port;
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index 73bc26bf4376e..b2314ce8baf50 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -8617,6 +8617,17 @@ extern const struct sparx5_regs *regs;
 #define DEVRGMII_MAC_ENA_CFG_TX_ENA_GET(x)\
 	FIELD_GET(DEVRGMII_MAC_ENA_CFG_TX_ENA, x)
 
+/* LAN969X ONLY */
+/* DEV1G:MAC_CFG_STATUS:MAC_MAXLEN_CFG */
+#define DEVRGMII_MAC_MAXLEN_CFG(t)                                             \
+	__REG(TARGET_DEVRGMII, t, 2, 36, 0, 1, 36, 8, 0, 1, 4)
+
+#define DEVRGMII_MAC_MAXLEN_CFG_MAX_LEN          GENMASK(15, 0)
+#define DEVRGMII_MAC_MAXLEN_CFG_MAX_LEN_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_MAXLEN_CFG_MAX_LEN, x)
+#define DEVRGMII_MAC_MAXLEN_CFG_MAX_LEN_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_MAXLEN_CFG_MAX_LEN, x)
+
 /* LAN969X ONLY */
 /* DEV1G:MAC_CFG_STATUS:MAC_TAGS_CFG */
 #define DEVRGMII_MAC_TAGS_CFG(t)                                               \
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index ef06bed3a9cc4..701d310df0ba6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -613,6 +613,42 @@ static int sparx5_port_max_tags_set(struct sparx5 *sparx5,
 	return 0;
 }
 
+/* Set the maximum frame length accepted by the MAC of a port */
+void sparx5_port_max_len_set(struct sparx5 *sparx5,
+			     struct sparx5_port *port,
+			     u32 len)
+{
+	u32 pix = sparx5_port_dev_index(sparx5, port->portno);
+	const struct sparx5_ops *ops = sparx5->data->ops;
+	void __iomem *devinst;
+
+	if (ops->is_port_rgmii(port->portno)) {
+		spx5_rmw(DEVRGMII_MAC_MAXLEN_CFG_MAX_LEN_SET(len),
+			 DEVRGMII_MAC_MAXLEN_CFG_MAX_LEN,
+			 sparx5,
+			 DEVRGMII_MAC_MAXLEN_CFG(pix));
+		return;
+	}
+
+	/* All other ports have a 2G5 (shadow) device */
+	spx5_rmw(DEV2G5_MAC_MAXLEN_CFG_MAX_LEN_SET(len),
+		 DEV2G5_MAC_MAXLEN_CFG_MAX_LEN,
+		 sparx5,
+		 DEV2G5_MAC_MAXLEN_CFG(port->portno));
+
+	if (ops->is_port_2g5(port->portno))
+		return;
+
+	/* The MAXLEN_CFG register layout is shared by the high speed devices */
+	devinst = spx5_inst_get(sparx5,
+				sparx5_to_high_dev(sparx5, port->portno), pix);
+
+	spx5_inst_rmw(DEV10G_MAC_MAXLEN_CFG_MAX_LEN_SET(len),
+		      DEV10G_MAC_MAXLEN_CFG_MAX_LEN,
+		      devinst,
+		      DEV10G_MAC_MAXLEN_CFG(0));
+}
+
 int sparx5_port_fwd_urg(struct sparx5 *sparx5, u32 speed)
 {
 	u32 clk_period_ps = 1600; /* 625Mhz for now */
@@ -1068,18 +1104,15 @@ int sparx5_port_init(struct sparx5 *sparx5,
 	u32 pause_start = sparx5_wm_enc(6  * (ETH_MAXLEN / SPX5_BUFFER_CELL_SZ));
 	u32 atop = sparx5_wm_enc(20 * (ETH_MAXLEN / SPX5_BUFFER_CELL_SZ));
 	const struct sparx5_ops *ops = sparx5->data->ops;
-	u32 devhigh = sparx5_to_high_dev(sparx5, port->portno);
 	u32 pix = sparx5_port_dev_index(sparx5, port->portno);
 	u32 pcs = sparx5_to_pcs_dev(sparx5, port->portno);
 	bool sd_pol = port->signd_active_high;
 	bool sd_sel = !port->signd_internal;
 	bool sd_ena = port->signd_enable;
 	u32 pause_stop = 0xFFF - 1; /* FC generate disabled */
-	void __iomem *devinst;
 	void __iomem *pcsinst;
 	int err;
 
-	devinst = spx5_inst_get(sparx5, devhigh, pix);
 	pcsinst = spx5_inst_get(sparx5, pcs, pix);
 
 	/* Set the mux port mode  */
@@ -1119,10 +1152,7 @@ int sparx5_port_init(struct sparx5 *sparx5,
 		return err;
 
 	/* Set Max Length */
-	spx5_rmw(DEV2G5_MAC_MAXLEN_CFG_MAX_LEN_SET(ETH_MAXLEN),
-		 DEV2G5_MAC_MAXLEN_CFG_MAX_LEN,
-		 sparx5,
-		 DEV2G5_MAC_MAXLEN_CFG(port->portno));
+	sparx5_port_max_len_set(sparx5, port, ETH_MAXLEN);
 
 	/* 1G/2G5: Signal Detect configuration */
 	spx5_wr(DEV2G5_PCS1G_SD_CFG_SD_POL_SET(sd_pol) |
@@ -1171,12 +1201,6 @@ int sparx5_port_init(struct sparx5 *sparx5,
 	if (sparx5_is_baser(conf->portmode))
 		sparx5_dev_switch(sparx5, port->portno, true);
 
-	/* Set Max Length */
-	spx5_inst_rmw(DEV10G_MAC_MAXLEN_CFG_MAX_LEN_SET(ETH_MAXLEN),
-		      DEV10G_MAC_MAXLEN_CFG_MAX_LEN,
-		      devinst,
-		      DEV10G_MAC_MAXLEN_CFG(0));
-
 	/* Handle Signal Detect in 10G PCS */
 	spx5_inst_wr(PCS10G_BR_PCS_SD_CFG_SD_POL_SET(sd_pol) |
 		     PCS10G_BR_PCS_SD_CFG_SD_SEL_SET(sd_sel) |
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.h b/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
index c8a37468a3d1d..912f97a506768 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
@@ -88,6 +88,10 @@ int sparx5_port_init(struct sparx5 *sparx5,
 		     struct sparx5_port *spx5_port,
 		     struct sparx5_port_config *conf);
 
+void sparx5_port_max_len_set(struct sparx5 *sparx5,
+			     struct sparx5_port *port,
+			     u32 len);
+
 int sparx5_port_config(struct sparx5 *sparx5,
 		       struct sparx5_port *spx5_port,
 		       struct sparx5_port_config *conf);

-- 
2.34.1


