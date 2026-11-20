Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F112606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lEDIyZnm;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=DE9j6gcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iV9u8MFIE2Wolvo/jYyUSGzwuZ29ksiHTwOuSrkSuN8=; b=lEDIyZnm2270JD
	62GUNKlkfFXo08EjSHtYgcjofCOIi0DWQFn4bGncH6EZSrv0P5jutzgMuo/9DwxF3kCzlztmYrQuR
	bQDOXqW9da3a+FrVe9GpxD9vSRFdj1SBRSHcrEEKB/Xd2bqPpb6ts+9r0X3PTTA10X+REY+aXPY/Q
	rmFEG1AFtWD5p5dV1bve/8Us0aldgxGOCf06gfb6TDeEXAdfvM1Mr3mPQKbdVJT42YSFywirrl+QM
	RUTF2WSUPbUiRi04NJKNQXr5C5Y1X6KZqGN5f/RzIS8Vh15HpRwEP49NxVN7A122hK/7sm6QkJO+l
	UohKFtqKq6lKNt9Qf5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNFh-0000000Et8K-3ffk;
	Fri, 20 Nov 2026 11:58:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNFN-0000000Esn9-2iWM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795175869; x=1826711869;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=kLOUYYM8s4VMg7h26drwKaxNfpxY4gVmxMSxqmASXpc=;
  b=DE9j6gccTVeVolAr2KKpF7USb1dzn6eoo3XZMcst6sWF00FFeHHkDVOz
   +kF3FlafkzAl9Na8jK+lBul4WmiumjiwjTLesocr6qCVeF0nNBVBiL5Ol
   YjVoBnajO3Ndr0b38pbLIQzp/hEK6H154KRqaR/vBo5sz2Q2Tc9z3PJ2A
   3X0/8C9hjyCRTtz2/Ewiz6Mqb5ZWbwbViXV7KDcKdJC6/NUz79XQRWv3o
   kJIhDu+kRmWsVYfMO05EI3hXCgD/dHRTpXst7w4vt2DPKcJGsvct9KZgB
   OpJPUc0ToWr208EScgQXz1E7VjVru+w7nO7MPI0o058HCfvo+/dCvpUkz
   A==;
X-CSE-ConnectionGUID: eM5yzAU1QTOWZ8T/WijD/w==
X-CSE-MsgGUID: y2BOvpCQQmaXlYxl3ySd2g==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="77589768"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:57:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 04:57:40 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 20 Nov 2026 04:57:37 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Nov 2026 12:57:06 +0100
Subject: [PATCH net-next v3 9/9] net: sparx5/lan969x: add support for
 changing the MTU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-sparx5-mtu-change-v3-9-55c272fe1acc@microchip.com>
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
X-CRM114-CacheID: sfid-20261120_035741_719595_8F04173C 
X-CRM114-Status: GOOD (  26.99  )
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

The MTU of a port is currently fixed to 1500, as the MAC maximum frame
length, the FDMA buffers, the queue watermarks and the TAS guard band
are all sized for a 1518 byte frame. The previous patches make the
buffers, watermarks and guard band follow the MTU, so changing the MTU
is a matter of programming the MAC and updating these.

Add an ndo_change_mtu callback that sets the MAC maximum frame length of
the port and resizes the FDMA buffers. The MAC must never accept frames
that are larger than the RX buffers, so when decreasing the MTU, the
maximum frame length is lowered before the buffers are shrunk, and when
increasing it, it is only raised once the buffers have been grown. The
new MTU is only published once the buffers fit it. If the buffers cannot
be grown, the MTU is not changed. If they cannot be shrunk, the current
buffers still fit all frames, so the new MTU is kept. Once the new MTU
is published, update the queue watermarks of the port and the TAS guard
band.

As the FDMA is shared by all ports, resizing its buffers briefly stops
CPU traffic on all ports. This only happens when the change affects the
buffer size needed for the largest MTU of the ports.

Register based extraction, which is used when the FDMA is not, sizes
its skbs from the MTU at the time a frame is read, so frames queued
before an MTU decrease would not fit. Therefore, only allow the MTU to be
changed when the FDMA is used.

The MACs of both Sparx5 and lan969x support frames of up to 14000 bytes,
so set the maximum MTU accordingly when the FDMA is used, and extend the
top RMON histogram range to the maximum frame length.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |  2 +-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  1 +
 .../net/ethernet/microchip/sparx5/sparx5_netdev.c  | 48 +++++++++++++++++++++-
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
index 2c6a5d3bc2bc6..af1fd32c6cef7 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
@@ -809,7 +809,7 @@ static const struct ethtool_rmon_hist_range sparx5_rmon_ranges[] = {
 	{  256,   511 },
 	{  512,  1023 },
 	{ 1024,  1518 },
-	{ 1519, 10239 },
+	{ 1519, SPX5_MAX_FRAME_LEN + 2 * VLAN_HLEN },
 	{}
 };
 
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 64ace5c3af5ab..a94c025ba3c0d 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -111,6 +111,7 @@ enum sparx5_feature {
 #define SPX5_BUFFER_MEMORY     4194280 /* 22795 words * 184 bytes */
 #define SPX5_TAS_ENTRIES_PER_PORT 2 /* TAS lists per port */
 #define SPX5_HW_MTU(mtu)       ((mtu) + ETH_HLEN + ETH_FCS_LEN)
+#define SPX5_MAX_FRAME_LEN     14000 /* Max frame length of the MACs */
 
 #define XTR_QUEUE     0
 #define INJ_QUEUE     0
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
index b3725cf2dd44c..095925752f5f6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
@@ -250,6 +250,44 @@ static int sparx5_port_hwtstamp_set(struct net_device *dev,
 	return sparx5_ptp_hwtstamp_set(sparx5_port, cfg, extack);
 }
 
+static int sparx5_port_change_mtu(struct net_device *dev, int new_mtu)
+{
+	struct sparx5_port *port = netdev_priv(dev);
+	struct sparx5 *sparx5 = port->sparx5;
+	bool resize = new_mtu > dev->mtu;
+	int err;
+
+	/* Register based extraction sizes its skbs from the MTU at the time
+	 * a frame is read, so it cannot handle frames queued before an MTU
+	 * decrease.
+	 */
+	if (sparx5->fdma_irq <= 0)
+		return -EOPNOTSUPP;
+
+	/* Never let the MAC accept frames larger than the RX buffers */
+	if (!resize)
+		sparx5_port_max_len_set(sparx5, port, SPX5_HW_MTU(new_mtu));
+
+	err = sparx5->data->ops->fdma_resize(sparx5, port, new_mtu);
+	if (err) {
+		if (resize)
+			return err;
+
+		/* The current, larger, buffers still fit all frames */
+		netdev_warn(dev, "Failed to resize FDMA buffers: %d\n", err);
+	}
+
+	WRITE_ONCE(dev->mtu, new_mtu);
+
+	sparx5_port_wm_update(sparx5, port);
+	sparx5_tas_gb_update(sparx5);
+
+	if (resize)
+		sparx5_port_max_len_set(sparx5, port, SPX5_HW_MTU(new_mtu));
+
+	return 0;
+}
+
 static const struct net_device_ops sparx5_port_netdev_ops = {
 	.ndo_open               = sparx5_port_open,
 	.ndo_stop               = sparx5_port_stop,
@@ -257,6 +295,7 @@ static const struct net_device_ops sparx5_port_netdev_ops = {
 	.ndo_set_rx_mode_async  = sparx5_set_rx_mode,
 	.ndo_get_phys_port_name = sparx5_port_get_phys_port_name,
 	.ndo_set_mac_address    = sparx5_set_mac_address,
+	.ndo_change_mtu         = sparx5_port_change_mtu,
 	.ndo_validate_addr      = eth_validate_addr,
 	.ndo_get_stats64        = sparx5_get_stats64,
 	.ndo_get_port_parent_id = sparx5_get_port_parent_id,
@@ -306,7 +345,14 @@ int sparx5_register_netdevs(struct sparx5 *sparx5)
 
 	for (portno = 0; portno < sparx5->data->consts->n_ports; portno++)
 		if (sparx5->ports[portno]) {
-			err = register_netdev(sparx5->ports[portno]->ndev);
+			struct net_device *ndev = sparx5->ports[portno]->ndev;
+
+			/* The MTU can only be changed when FDMA is used */
+			if (sparx5->fdma_irq > 0)
+				ndev->max_mtu = SPX5_MAX_FRAME_LEN - ETH_HLEN -
+						ETH_FCS_LEN;
+
+			err = register_netdev(ndev);
 			if (err) {
 				dev_err(sparx5->dev,
 					"port: %02u: netdev registration failed\n",

-- 
2.34.1


