Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79140606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MxiCaok1;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=d055oxr6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jB/1U0fWdj0DZ0gZKs1wUQuMfdnKTfbWdwKCxQuzKHM=; b=MxiCaok16SHpVY
	yMaywNFpCrdVbV6QNF1QDhVbqfpSgwYoqxuranjaJTpAiY8LgpXVja3qR0wZwrR5pZOGf5RVJm9gg
	rL0kdhncTsFWT8cRNVrktxd0nVYrpWJT/gi8ksnU1Z+ZRyZd7peZ1sCvg4dXy66wzFNY685NyIaFt
	cY7G/orK0wmrsjvnb+8ALtdpTMAaTBAp6jt3Nhvcie2qDAYup5XhpWPdrrVM4S6+J2C84fwBW0quZ
	G/eHzjmI1I4lFd+NSExB07qoVMt5uBA/gcGZ4GmhaKrVOotpjQznxGg4BwVIJEEQzjLvpv86BLpIy
	pEemjv0P2bhvKR1MmpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqT1-0000000F845-3tGa;
	Fri, 27 Nov 2026 07:33:59 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqSo-0000000F7uN-1SMV;
	Fri, 27 Nov 2026 07:33:48 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 7F3814C976;
	Fri, 27 Nov 2026 18:33:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jB/1U0fWdj0DZ0gZKs1wUQuMfdnKTfbWdwKCxQuzKHM=;
	b=d055oxr6bmNIOiZGMOutOvgPFjWMp9gLQ7booQZCfRN2wr3hzQbwKZVw2cN1LWwgs2PkNp
	PADh+QlFkhM5kFsM4QfNvjRO9UdjcGUBEuDrVuCB4wxvlRxnilpjs43MN8HWNcgC8evPEg
	GqR/ksoGl/hfrvT5G4lLMll/yMGL18vSOq9AjT6PKzjZJA7qT9sNLn4wWxjDHqjCuxsHQ1
	y0V+vBIvsRx8/LGHunxKBvHQS0mzmPRegWNTewojjqBZ6TNc3IVkyDsJPRpmkdKW7Aifjn
	IHdiB5YG6lCyKSv9/qtwG9DNBJvW1BY3YzUZ1lbKMnAcb5iQhHgTp/lbCRn4dg==
X-GPT-Reason: legitimate personal/professional communication; the
	message is a technical Linux kernel patch description (usb: host:
	xhci) that perfectly aligns with the sender's identity
	(alastair@d-silva.org) and the recipient's mailbox (alastair@d-silva.org);
	the content is technical, non-promotional, and contains no phishing
	indicators, urgency, or external links; the From/Return-Path domains
	match the personal/business domain of the user.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 09/11] usb: host: xhci: Add W1C port change quirk for Allwinner A733
Date: Fri, 27 Nov 2026 18:32:29 +1100
Message-ID: <20261127073231.1776847-10-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_233346_564267_67DAF9F0 
X-CRM114-Status: GOOD (  15.55  )
X-Spam-Score: -2.1 (--)
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

Allwinner A733 xHCI PORTSC change bits do not clear on write-1-to-clear
when a SuperSpeed device is active. Track cleared bits per port and
sync connection state when reading PORTSC. Use warm port reset on
SuperSpeed port reset.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/usb/host/xhci-hub.c  | 53 +++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-plat.c |  3 ++
 drivers/usb/host/xhci.h      |  2 ++
 3 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 55430b673f1e..566cebbd0998 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -623,6 +623,9 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue, struct
 	xhci_portsc_writel(port, portsc | status);
 	portsc = xhci_portsc_readl(port);
 
+	if (xhci->quirks & XHCI_W1C_PORT_CHANGE_QUIRK)
+		port->cleared_change_bits |= (portsc & status);
+
 	xhci_dbg(xhci, "clear port%d %s change, portsc: 0x%x\n",
 		 port->hcd_portnum + 1, port_change_bit, portsc);
 }
@@ -1122,6 +1125,33 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 	}
 }
 
+static u32 xhci_w1c_filter_portsc(struct xhci_hcd *xhci, struct xhci_port *port,
+				  u32 portsc)
+{
+	u32 pls;
+
+	if (!(xhci->quirks & XHCI_W1C_PORT_CHANGE_QUIRK))
+		return portsc;
+
+	/*
+	 * Stuck W1C bits prevent new Port Status Change Events after initial
+	 * attach, so keep port->connected and port->link_inactive synced here.
+	 */
+	pls = portsc & PORT_PLS_MASK;
+	if (!(portsc & PORT_RESET)) {
+		port->link_inactive = (pls == XDEV_INACTIVE);
+		port->connected = !!(portsc & PORT_CONNECT);
+	}
+
+	if (!(portsc & PORT_CONNECT) || pls == XDEV_RXDETECT ||
+	    pls == XDEV_DISABLED || pls == XDEV_INACTIVE) {
+		port->cleared_change_bits = 0;
+		return portsc;
+	}
+
+	return portsc & ~port->cleared_change_bits;
+}
+
 /*
  * Converts a raw xHCI port status into the format that external USB 2.0 or USB
  * 3.0 hubs use.
@@ -1138,12 +1168,15 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd, struct xhci_bus_state *bus_
 	__acquires(&xhci->lock)
 {
 	u32 status = 0;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_hub *rhub;
 	struct xhci_port *port;
 
 	rhub = xhci_get_rhub(hcd);
 	port = rhub->ports[portnum];
 
+	portsc = xhci_w1c_filter_portsc(xhci, port, portsc);
+
 	/* common wPortChange bits */
 	if (portsc & PORT_CSC)
 		status |= USB_PORT_STAT_C_CONNECTION << 16;
@@ -1472,7 +1505,21 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_set_port_power(xhci, port, true, &flags);
 			break;
 		case USB_PORT_FEAT_RESET:
-			portsc |= PORT_RESET;
+			if (xhci->quirks & XHCI_W1C_PORT_CHANGE_QUIRK) {
+				port->cleared_change_bits &= ~PORT_RC;
+				/*
+				 * A733 SuperSpeed ports fail to re-enumerate
+				 * after a hot reset; issue a warm reset.
+				 */
+				if (hcd->speed >= HCD_USB3) {
+					port->cleared_change_bits &= ~PORT_WRC;
+					portsc |= PORT_WR;
+				} else {
+					portsc |= PORT_RESET;
+				}
+			} else {
+				portsc |= PORT_RESET;
+			}
 			xhci_portsc_writel(port, portsc);
 
 			portsc = xhci_portsc_readl(port);
@@ -1487,6 +1534,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				 hcd->self.busnum, portnum + 1, portsc);
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
+			if (xhci->quirks & XHCI_W1C_PORT_CHANGE_QUIRK)
+				port->cleared_change_bits &= ~PORT_WRC;
 			portsc |= PORT_WR;
 			xhci_portsc_writel(port, portsc);
 			portsc = xhci_portsc_readl(port);
@@ -1667,6 +1716,8 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 		}
 		trace_xhci_hub_status_data(ports[i], temp);
 
+		temp = xhci_w1c_filter_portsc(xhci, ports[i], temp);
+
 		if ((temp & mask) != 0 ||
 			(bus_state->port_c_suspend & 1 << i) ||
 			(ports[i]->resume_timestamp && time_after_eq(
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..a3307135b3ac 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-w1c-port-change-quirk"))
+			xhci->quirks |= XHCI_W1C_PORT_CHANGE_QUIRK;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 86a615c6fd2b..70135907e4c0 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1491,6 +1491,7 @@ struct xhci_port {
 	int			slot_id;
 	struct completion	rexit_done;
 	struct completion	u3exit_done;
+	u32			cleared_change_bits;
 };
 
 struct xhci_hub {
@@ -1652,6 +1653,7 @@ struct xhci_hcd {
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
+#define XHCI_W1C_PORT_CHANGE_QUIRK	BIT_ULL(51)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.53.0


