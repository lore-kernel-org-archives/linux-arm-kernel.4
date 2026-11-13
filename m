Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6841606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sLkbm1li;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=JJXEL2Zj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XrTVENYeHvGmG8hjhtT2N1v4bTdyvJX1NFu94SleBOQ=; b=sLkbm1li0gsrLi
	d4Y0/ab+YVLkLPNCn6yCyA+PdyxwNOrPjEY4SiK5566pHxsD++UJx7ksIWLNHULjwOzZWeuslYeB1
	yIWBPgBth4FQ0KozH1c+1cL6ExCaVsc+EaeQ0XFlII/AuzwdX3yYDTvpYlcsGm7u+FkDA5t+cw1R6
	YM8kOOGS6D7JbWYorkhZVhOzVijflQKCuCXRWvQakNlnkVay1Nnyelpy1knpyyHL3/6mKHJxe4urQ
	kj4tY17SXBaMhZy1VuZ9n2eUiXfNGW/rhcP5qMjAZmVgVskLi+8iZ4pt+szk1in24Yh+mUIhlHL23
	Qjq9Fu4t/J+2k0XF+9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoOO-0000000CL5y-2KYG;
	Fri, 13 Nov 2026 10:20:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoOB-0000000CL09-1oRA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794565211; x=1826101211;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=57RoIAElqhBq+GU+sKkkMZ57o5dE7ZZ1bfxCahq6AEk=;
  b=JJXEL2ZjQAOcEvlkhnk3OK0EU04OrBjYgC5pHab2eSj3fv9i734K3tGI
   +BOfCKJZFFraVcLqLN5T3Pvf4dmInAt3mDqPPXqqKXEqwnzHH5CJCpdOU
   8sVcjAd9JJlzgYFxoT6UIEwpnGkbZEc0Fd+cRujRR2GIsjj9Q5LESg/12
   188r9HJtkkyjpih3IfYgPBwEeqPiXb/g5m99umtS70iSMgVJYPXrIFmNT
   R4szgRfQT19LwghfgkJM7BQmi6/2nLwSgSU1wESsStD0LL30XAQkEozIB
   CWbnU8pLEu69uulyZEUYJH62LKg/abOgTqnAUnkwk0AZC08AG5xpv20aC
   Q==;
X-CSE-ConnectionGUID: /JeimWT8RF+lLiCQTEZYHQ==
X-CSE-MsgGUID: EFDVXrQqTLWQLe7pWcbS1A==
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="66461930"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2026 03:20:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 13 Nov 2026 03:20:10 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 13 Nov 2026 03:20:08 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 13 Nov 2026 11:19:42 +0100
Subject: [PATCH net-next 3/4] net: lan969x: configure the core PLL
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261113-lan969x-core-skew-v1-3-b9b02b863d38@microchip.com>
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
X-CRM114-CacheID: sfid-20261113_022014_436456_55E65973 
X-CRM114-Status: GOOD (  23.31  )
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

The lan969x core PLL is left at its 328.125 MHz default, while the PTP
time of day (TOD) increment from sparx5_ptp_get_nominal_value() assumes
a core clock skewed about 200 ppm up, as recommended for the high
accuracy phase detectors. The TOD and the clock that drives the
scheduler therefore run 200 ppm apart: a 1 ms taprio cycle takes about
1000.2 us.

Program the core PLL to the skewed rate from sparx5_init_coreclock(),
using the glitch free divider change documented for CORE_PLL_CFG.

Select the dividers, and the matching TOD increment, from the reference
clock read from the strapping pin. Leave the PLL alone if it is already
configured, and disable the register configuration again if the change
fails.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 119 +++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   7 ++
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |   5 +-
 3 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 93a7cb89493c4..244974ffe496b 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -474,10 +474,120 @@ static int sparx5_init_switchcore(struct sparx5 *sparx5)
 	return 0;
 }
 
+struct lan969x_core_pll_dividers {
+	u32 divfi;
+	u32 divff;
+	u32 divr;
+	u32 divq;
+};
+
+static const struct lan969x_core_pll_dividers lan969x_core_pll_328mhz[] = {
+	[SPX5_CORE_CLOCK_REF_25MHZ] = {
+		.divfi = 64, .divff = 0xa36076, .divr = 3, .divq = 10,
+	},
+	[SPX5_CORE_CLOCK_REF_39MHZ] = {
+		.divfi = 72, .divff = 0x83c361, .divr = 6, .divq = 10,
+	},
+};
+
+static int lan969x_init_core_pll(struct sparx5 *sparx5)
+{
+	const struct lan969x_core_pll_dividers *div;
+	u32 hw_stat, pll_cfg, freq_cfg;
+	enum sparx5_core_clockref ref;
+	int err;
+
+	hw_stat = spx5_rd(sparx5, CHIP_TOP_HW_STAT);
+	ref = CHIP_TOP_HW_STAT_REFCLK_SEL_GET(hw_stat) ?
+		SPX5_CORE_CLOCK_REF_39MHZ : SPX5_CORE_CLOCK_REF_25MHZ;
+	div = &lan969x_core_pll_328mhz[ref];
+	sparx5->coreclockref = ref;
+
+	/* Already configured by an earlier probe? */
+	pll_cfg = spx5_rd(sparx5, CHIP_TOP_CORE_PLL_CFG);
+	freq_cfg = spx5_rd(sparx5, CHIP_TOP_CORE_PLL_FREQ_CFG);
+	if (CHIP_TOP_CORE_PLL_CFG_ENA_CFG_GET(pll_cfg) &&
+	    CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI_GET(freq_cfg) == div->divfi &&
+	    CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF_GET(freq_cfg) == div->divff)
+		return 0;
+
+	spx5_rmw(CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI_SET(div->divfi) |
+		 CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF_SET(div->divff),
+		 CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI |
+		 CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF,
+		 sparx5, CHIP_TOP_CORE_PLL_FREQ_CFG);
+
+	/* Set the reference and output dividers, select the reference clock
+	 * from the strapping pin and use fractional mode.
+	 */
+	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_DIVQ_SET(div->divq) |
+		 CHIP_TOP_CORE_PLL_CFG_DIVR_SET(div->divr) |
+		 CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL_SET(0) |
+		 CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE_SET(0),
+		 CHIP_TOP_CORE_PLL_CFG_DIVQ |
+		 CHIP_TOP_CORE_PLL_CFG_DIVR |
+		 CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL |
+		 CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE,
+		 sparx5, CHIP_TOP_CORE_PLL_CFG);
+
+	/* Switch the PLL from its reset defaults to the register settings */
+	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_ENA_CFG_SET(1),
+		 CHIP_TOP_CORE_PLL_CFG_ENA_CFG,
+		 sparx5, CHIP_TOP_CORE_PLL_CFG);
+
+	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_NEWDIV_SET(1),
+		 CHIP_TOP_CORE_PLL_CFG_NEWDIV,
+		 sparx5, CHIP_TOP_CORE_PLL_CFG);
+
+	err = read_poll_timeout(spx5_rd,
+				pll_cfg,
+				CHIP_TOP_CORE_PLL_CFG_DIVACK_GET(pll_cfg),
+				100,
+				10000,
+				false,
+				sparx5,
+				CHIP_TOP_CORE_PLL_CFG);
+
+	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_NEWDIV_SET(0),
+		 CHIP_TOP_CORE_PLL_CFG_NEWDIV,
+		 sparx5, CHIP_TOP_CORE_PLL_CFG);
+
+	if (err) {
+		dev_err(sparx5->dev,
+			"Failed to change the core PLL dividers\n");
+		goto err_disable;
+	}
+
+	/* LOCK_STAT resets to 1, so sleep before the first read */
+	err = read_poll_timeout(spx5_rd,
+				pll_cfg,
+				CHIP_TOP_CORE_PLL_CFG_LOCK_STAT_GET(pll_cfg),
+				100,
+				10000,
+				true,
+				sparx5,
+				CHIP_TOP_CORE_PLL_CFG);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to lock the core PLL\n");
+		goto err_disable;
+	}
+
+	return 0;
+
+err_disable:
+	/* Make the next probe redo the change */
+	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_ENA_CFG_SET(0),
+		 CHIP_TOP_CORE_PLL_CFG_ENA_CFG,
+		 sparx5, CHIP_TOP_CORE_PLL_CFG);
+
+	return err;
+}
+
 static int sparx5_init_coreclock(struct sparx5 *sparx5)
 {
 	enum sparx5_core_clockfreq freq = sparx5->coreclock;
 	u32 clk_div, clk_period, pol_upd_int, idx;
+	int err;
 
 	/* Verify if core clock frequency is supported on target.
 	 * If 'VTSS_CORE_CLOCK_DEFAULT' then the highest supported
@@ -573,6 +683,15 @@ static int sparx5_init_coreclock(struct sparx5 *sparx5)
 			 CLKGEN_LCPLL1_CORE_CLK_CFG_CORE_CLK_ENA,
 			 sparx5, CLKGEN_LCPLL1_CORE_CLK_CFG);
 	} else {
+		if (freq != SPX5_CORE_CLOCK_328MHZ) {
+			dev_err(sparx5->dev,
+				"%d coreclock not supported\n",
+				freq);
+			return -EINVAL;
+		}
+		err = lan969x_init_core_pll(sparx5);
+		if (err)
+			return err;
 		pol_upd_int = 820; // SPX5_CORE_CLOCK_328MHZ
 	}
 
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index ad29db91ce91e..f6316086e6ecb 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -266,6 +266,12 @@ struct sparx5_port {
 	} tas_lists[SPX5_TAS_ENTRIES_PER_PORT];
 };
 
+/* lan969x core PLL reference clock, from CHIP_TOP:HW_STAT.REFCLK_SEL */
+enum sparx5_core_clockref {
+	SPX5_CORE_CLOCK_REF_25MHZ,
+	SPX5_CORE_CLOCK_REF_39MHZ,
+};
+
 enum sparx5_core_clockfreq {
 	SPX5_CORE_CLOCK_DEFAULT,  /* Defaults to the highest supported frequency */
 	SPX5_CORE_CLOCK_250MHZ,   /* 250MHZ core clock frequency */
@@ -415,6 +421,7 @@ struct sparx5 {
 	/* port structures are in net device */
 	struct sparx5_port *ports[SPX5_PORTS];
 	enum sparx5_core_clockfreq coreclock;
+	enum sparx5_core_clockref coreclockref;
 	/* Statistics */
 	u32 num_stats;
 	u32 num_ethtool_stats;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index 9f61692b243b7..544e9513a9a53 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -62,7 +62,10 @@ static u64 sparx5_ptp_get_nominal_value(struct sparx5 *sparx5)
 		res = 0x1FF0000000000000;
 		break;
 	case SPX5_CORE_CLOCK_328MHZ:
-		res = 0x18604697DD0F9B5B;
+		if (sparx5->coreclockref == SPX5_CORE_CLOCK_REF_25MHZ)
+			res = 0x186044FEF1EA9C10;
+		else
+			res = 0x18604697DD0F9B5B;
 		break;
 	case SPX5_CORE_CLOCK_500MHZ:
 		res = 0x0FF8000000000000;

-- 
2.34.1


