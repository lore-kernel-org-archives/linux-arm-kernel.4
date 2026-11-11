Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610B60A3809
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TJzyDVGL;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PSWMG4ro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ns1YeimGAsOs3Z1Cmj4o6AHpOqtHj5g4xVeuZOEVRn0=; b=TJzyDVGLRCTDl+
	8Ku8oHn2RU5RqRYyAbni2EsmZjc8WeHD7eOrVnP4OvaNfg3KwtDQx8TBhoxJWsxFkTrz6Wveor8X5
	rw6cBOtT8Bo9gRUSottU6UxGvm2y5lTxC06rTHokw4m1IomCTQyvx8EF0GR9azskDS9Q1xGBf1RBH
	S1ZTqiUpxdXswNOVO56s/3Em5Z/GqW+i/eANHpY+ZTEyycesZvJGQH3LOVKwZSvudOur2gyJbd3KT
	JDEW5+xr7YNhY2xjRBTptpHi4HoxoX5Um60gH5DdPX2MV6sZ5UufZAwZBYWwrEwR1xH/rYKmQe16G
	9jAcVpSwT62nURWQNkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9MP-00000006xBA-3D3p;
	Wed, 11 Nov 2026 14:31:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9MH-00000006x8w-40SI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794407490; x=1825943490;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=VYNPjjF2MIMlznZcgdyhsEylSs9Yra3CK6TUB4nM0g8=;
  b=PSWMG4ro69Ljs3+AFrW5WOwzLNRtwQ3vUVeApNQh6KdOZeQL2n4ewm1o
   bWbdLPnoaCorD2TSLiDj/tVySTle2h3IU39z73VvDgWMK2LChwzTi25sh
   dNZ08qtLmzxk/o79EKJsGiL+1Z5v/pmQbKhZe6VQC5FwlqFyo6Mv6XgrU
   GTTvlgEaqz+6CEI++cWl1tiHiJyxUee0pA9RcJO59lYlwXs86gDWuKHq/
   jh39puoQxcZJZA3//yQ81OwI7D3ySYBxNxX56ZcppvlVFvRI42rD76Ke0
   f70ogTyeEi8efKgOWpGNF/WjG6mBzOxsBBXkTc5+lqqKkA6jRHp4gZVAW
   A==;
X-CSE-ConnectionGUID: uDXNW5CRRBOOiUbnJttyfQ==
X-CSE-MsgGUID: M+S++q9YQjKlPD2dacsLXg==
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="66598087"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Nov 2026 07:31:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Nov 2026 07:31:28 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 07:31:26 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 11 Nov 2026 15:31:11 +0100
Subject: [PATCH net-next v2 1/9] net: sparx5/lan969x: stop the FDMA
 channels properly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-sparx5-mtu-change-v2-1-59c91357e8f6@microchip.com>
References: <20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com>
In-Reply-To: <20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_063130_033576_D3B2A5DC 
X-CRM114-Status: GOOD (  19.79  )
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

The FDMA channels are activated by setting their bit in
FDMA_CH_ACTIVATE, and are disabled through FDMA_CH_DISABLE, after which
a channel finishes the DCB it is fetching before it becomes inactive,
as shown by FDMA_CH_ACTIVE. The injection and extraction ports are
stopped through INJ_STOP and XTR_STOP.

sparx5_fdma_stop() tries to stop the channels by clearing their bit in
FDMA_CH_ACTIVATE, which has no effect: the register only acts on the
bits that are set, and its bits are cleared immediately by the
hardware. It also never stops the injection port, and waits for
XTR_BUF_IS_EMPTY to be 0, which means that the extraction buffer is not
empty, instead of 1, so the wait always runs until it times out.

Add the FDMA_CH_ACTIVE register, and make sparx5_fdma_stop() disable the
channels and wait for them to become inactive, stop the injection port,
and wait for the extraction buffer to be empty.

The stop sequence is used by the FDMA deinit, and by the FDMA buffer
resize added later in this series.

The issues were discovered by an AI code review agent and confirmed
against the datasheet. The fix was tested by unbinding and rebinding the
switch driver on Sparx5 (PCB135) and lan969x (EV23X71A).

Fixes: 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA functionality")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 46 ++++++++++++++++------
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 11 ++++++
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 15ec9b053824f..bcae0bbd5e44e 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -20,6 +20,8 @@
 
 #define FDMA_XTR_BUFFER_SIZE		2048
 #define FDMA_WEIGHT			4
+#define SPX5_FDMA_STOP_SLEEP_US		500
+#define SPX5_FDMA_STOP_TIMEOUT_US	10000
 
 static int sparx5_fdma_tx_dataptr_cb(struct fdma *fdma, int dcb, int db,
 				     u64 *dataptr)
@@ -86,10 +88,6 @@ static void sparx5_fdma_rx_deactivate(struct sparx5 *sparx5, struct sparx5_rx *r
 {
 	struct fdma *fdma = &rx->fdma;
 
-	/* Deactivate the RX channel */
-	spx5_rmw(0, BIT(fdma->channel_id) & FDMA_CH_ACTIVATE_CH_ACTIVATE,
-		 sparx5, FDMA_CH_ACTIVATE);
-
 	/* Disable RX channel DB interrupt */
 	spx5_rmw(0, BIT(fdma->channel_id) & FDMA_INTR_DB_ENA_INTR_DB_ENA,
 		 sparx5, FDMA_INTR_DB_ENA);
@@ -125,9 +123,9 @@ static void sparx5_fdma_tx_activate(struct sparx5 *sparx5, struct sparx5_tx *tx)
 
 static void sparx5_fdma_tx_deactivate(struct sparx5 *sparx5, struct sparx5_tx *tx)
 {
-	/* Disable the channel */
-	spx5_rmw(0, BIT(tx->fdma.channel_id) & FDMA_CH_ACTIVATE_CH_ACTIVATE,
-		 sparx5, FDMA_CH_ACTIVATE);
+	/* Stop TX fdma */
+	spx5_rmw(FDMA_PORT_CTRL_INJ_STOP_SET(1), FDMA_PORT_CTRL_INJ_STOP,
+		 sparx5, FDMA_PORT_CTRL(0));
 }
 
 void sparx5_fdma_reload(struct sparx5 *sparx5, struct fdma *fdma)
@@ -447,6 +445,11 @@ static u32 sparx5_fdma_port_ctrl(struct sparx5 *sparx5)
 	return spx5_rd(sparx5, FDMA_PORT_CTRL(0));
 }
 
+static u32 sparx5_fdma_ch_active(struct sparx5 *sparx5)
+{
+	return spx5_rd(sparx5, FDMA_CH_ACTIVE);
+}
+
 int sparx5_fdma_start(struct sparx5 *sparx5)
 {
 	const struct sparx5_ops *ops = sparx5->data->ops;
@@ -468,20 +471,39 @@ int sparx5_fdma_start(struct sparx5 *sparx5)
 
 int sparx5_fdma_stop(struct sparx5 *sparx5)
 {
+	u32 channels = BIT(sparx5->rx.fdma.channel_id) |
+		       BIT(sparx5->tx.fdma.channel_id);
 	struct sparx5_rx *rx = &sparx5->rx;
 	struct sparx5_tx *tx = &sparx5->tx;
 	u32 val;
 
 	napi_disable(&rx->napi);
 
-	/* Stop the fdma and channel interrupts */
+	/* Disable the channels, and wait for them to finish the current DCB */
+	spx5_wr(FDMA_CH_DISABLE_CH_DISABLE_SET(channels), sparx5,
+		FDMA_CH_DISABLE);
+
+	if (read_poll_timeout(sparx5_fdma_ch_active,
+			      val,
+			      !(FDMA_CH_ACTIVE_CH_ACTIVE_GET(val) & channels),
+			      SPX5_FDMA_STOP_SLEEP_US,
+			      SPX5_FDMA_STOP_TIMEOUT_US,
+			      false,
+			      sparx5))
+		dev_warn(sparx5->dev, "Failed to stop FDMA channels\n");
+
+	/* Stop the fdma and the RX channel interrupt */
 	sparx5_fdma_rx_deactivate(sparx5, rx);
 	sparx5_fdma_tx_deactivate(sparx5, tx);
 
-	/* Wait for the RX channel to stop */
-	read_poll_timeout(sparx5_fdma_port_ctrl, val,
-			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val) == 0,
-			  500, 10000, 0, sparx5);
+	/* Wait for the extraction buffer to be empty */
+	read_poll_timeout(sparx5_fdma_port_ctrl,
+			  val,
+			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val),
+			  SPX5_FDMA_STOP_SLEEP_US,
+			  SPX5_FDMA_STOP_TIMEOUT_US,
+			  false,
+			  sparx5);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index 1464fd1a1d447..df438be0ec552 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -4713,6 +4713,17 @@ extern const struct sparx5_regs *regs;
 	__REG(TARGET_FDMA, 0, 1, 8, 0, 1, regs->gsize[GW_FDMA_FDMA], 148, r, 8,\
 	      4)
 
+/* FDMA:FDMA:FDMA_CH_ACTIVE */
+#define FDMA_CH_ACTIVE                                                         \
+	__REG(TARGET_FDMA, 0, 1, 8, 0, 1, regs->gsize[GW_FDMA_FDMA], 180, 0, 1,\
+	      4)
+
+#define FDMA_CH_ACTIVE_CH_ACTIVE                 GENMASK(7, 0)
+#define FDMA_CH_ACTIVE_CH_ACTIVE_SET(x)\
+	FIELD_PREP(FDMA_CH_ACTIVE_CH_ACTIVE, x)
+#define FDMA_CH_ACTIVE_CH_ACTIVE_GET(x)\
+	FIELD_GET(FDMA_CH_ACTIVE_CH_ACTIVE, x)
+
 /* FDMA:FDMA:FDMA_CH_CFG */
 #define FDMA_CH_CFG(r)                                                         \
 	__REG(TARGET_FDMA, 0, 1, 8, 0, 1, regs->gsize[GW_FDMA_FDMA], 224, r, 8,\

-- 
2.34.1


