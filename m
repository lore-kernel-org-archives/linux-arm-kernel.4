Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58F8606A339
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2VkURUl;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=D1qDPLrz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2jggDFXfiKjyjxfNyJQQxWRj7IWrl5y+P/gKpuovSl0=; b=Y2VkURUlVEE+xDYddEdN/msTHa
	KCj213crxL4DkU1+yEWGgoP84H32au01GdZdHUovF/AZdzkaUX2GRjFDFQ9ixStFxS7qjhaFnokh+
	lq1T5z42uCzrjG5fREw4mDzN3JUdQb3vN805rtCPGwLJ3c+Es339MaG2dItU9ms2gvvT0a6Ur5eXX
	Y8MERjp/YK8TDueELsnqrbUgfgD5F2Ad/LyiqLGIOpPqvYy3Zu3a8Ux3v5kqvOOq+ZLD4oieAFRbW
	V2KVVmh0YGNscHM3SOW1GgDObd3ccBsPu9n4Y2P8yhnkhQy4bVBe0m02SgbNQD6NbJRWGMmeCnlPz
	TKfpkp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWyM-0000000AV2A-3JKa;
	Thu, 12 Nov 2026 15:44:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWyI-0000000AV1T-1lh4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794498258; x=1826034258;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=HxgHa+ylojaHP6gqM1yhKD1ewdvIyZI+z1/zt8wg2Fk=;
  b=D1qDPLrzOgj20y7Ls3iJnDo+XBvTcGoXiSU9OtC5OEhrd5PSttXg0nu2
   ymBH8AqVNreyn4LGZ7NPvRUf+Stocq43lX1n08bZoABNhKg7FHTCAdA+7
   11GCx6Cn3dzB623A+D7QbVH+XbZ6ijwKWyWg4Yf9T1Uxgqf4LPcRCH2Rl
   1vmQaXdijVbFqf+Vk5vLAM64ga69Q5Q6kOBnkZs49KyhwWaHCcyCUfAV+
   jXov2qrw+3N1l7WXiKhBtfQx2bfqdYxAlKTsukv552ZdUw6H50f7IWVKy
   LUwKmBWAWHN6t01OmFRuD6wkKk2kT+V0UmbM+x1tKgTGv4EkUCIDGy9ZO
   w==;
X-CSE-ConnectionGUID: hFPvcHixS26nUTs0b7YK8w==
X-CSE-MsgGUID: bvlYCDkkQXWNbTmxtQ8J0w==
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="66419760"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:44:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 12 Nov 2026 08:44:16 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Thu, 12 Nov 2026 08:44:14 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Thu, 12 Nov 2026 16:43:58 +0100
Subject: [PATCH] spi: atmel: poll short PIO transfers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20261112-spi-atmel-poll-short-pio-transfers-v1-1-240ccc868cc3@microchip.com>
X-B4-Tracking: v=1; b=H4sIAL3e9WoC/x3NMQrDMAxA0asEzRVUHkrSq5QOtiM3Atc2kimBk
 LvXZHzL/wcYq7DBczpA+ScmtQzQbYK4+fJhlHUY3N09iMihNUHfv5yx1ZzRtqodm1Ts6oslVsO
 wzimGJdISAoxQU06yX5PX+zz/IAezvnQAAAA=
To: Ryan Wanner <ryan.wanner@microchip.com>, Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_074418_704596_D3510FEE 
X-CRM114-Status: GOOD (  18.79  )
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

Every PIO transfer enables the controller interrupt and sleeps in
wait_for_completion_timeout() until the interrupt handler has drained the
receive data. For a transfer of a few bytes, the interrupt, the
completion and the two context switches take several times longer than
the transfer on the wire. Devices that do their register IO over SPI,
such as SPI attached Ethernet switches, issue one message of a few short
transfers per register access, so this overhead dominates their register
access time.

Busy-wait on the status register instead of enabling the interrupt when
the transfer is estimated to take less than polling_limit_us, 30 us by
default, as spi-imx does. The estimate uses the effective clock rate and
the word delay. Setting the module parameter to 0 disables polling.

Mask the receive and overrun interrupts before a polled transfer is
started. An earlier interrupt driven transfer can leave them enabled:
the overrun interrupt always stays enabled, and the receive interrupt
also stays enabled after an overrun or a timeout. The interrupt handler
would then consume the status the poll waits for. Like the interrupt
handler, the poll only reads received data while bytes are outstanding.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/spi/spi-atmel.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index ffc1292b08c1..25a0a3acfc4e 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -234,6 +234,11 @@
  */
 #define DMA_MIN_BYTES	16
 
+static unsigned int polling_limit_us = 30;
+module_param(polling_limit_us, uint, 0664);
+MODULE_PARM_DESC(polling_limit_us,
+		 "maximum time in us to run a transfer in polling mode");
+
 #define AUTOSUSPEND_TIMEOUT	2000
 
 struct atmel_spi_caps {
@@ -274,6 +279,8 @@ struct atmel_spi {
 
 	bool			use_dma;
 	bool			use_pdc;
+	bool			poll;
+	unsigned int		poll_limit_us;
 
 	bool			keep_cs;
 
@@ -688,6 +695,9 @@ static void atmel_spi_next_xfer_single(struct spi_controller *host,
 
 	dev_vdbg(host->dev.parent, "atmel_spi_next_xfer_pio\n");
 
+	if (as->poll)
+		spi_writel(as, IDR, SPI_BIT(RDRF) | SPI_BIT(OVRES));
+
 	/* Make sure data is not remaining in RDR */
 	spi_readl(as, RDR);
 	while (spi_readl(as, SR) & SPI_BIT(RDRF)) {
@@ -706,7 +716,8 @@ static void atmel_spi_next_xfer_single(struct spi_controller *host,
 		xfer->bits_per_word);
 
 	/* Enable relevant interrupts */
-	spi_writel(as, IER, SPI_BIT(RDRF) | SPI_BIT(OVRES));
+	if (!as->poll)
+		spi_writel(as, IER, SPI_BIT(RDRF) | SPI_BIT(OVRES));
 }
 
 /*
@@ -725,6 +736,9 @@ static void atmel_spi_next_xfer_fifo(struct spi_controller *host,
 
 	dev_vdbg(host->dev.parent, "atmel_spi_next_xfer_fifo\n");
 
+	if (as->poll)
+		spi_writel(as, IDR, SPI_BIT(RXFTHF) | SPI_BIT(OVRES));
+
 	/* Compute the number of data to transfer in the current iteration */
 	current_remaining_data = ((xfer->bits_per_word > 8) ?
 				  ((u32)as->current_remaining_bytes >> 1) :
@@ -776,7 +790,8 @@ static void atmel_spi_next_xfer_fifo(struct spi_controller *host,
 	 * Enable RX FIFO Threshold Flag interrupt to be notified about
 	 * transfer completion.
 	 */
-	spi_writel(as, IER, SPI_BIT(RXFTHF) | SPI_BIT(OVRES));
+	if (!as->poll)
+		spi_writel(as, IER, SPI_BIT(RXFTHF) | SPI_BIT(OVRES));
 }
 
 /*
@@ -1375,6 +1390,58 @@ static void atmel_spi_set_cs(struct spi_device *spi, bool enable)
 
 }
 
+static bool atmel_spi_use_poll(struct atmel_spi *as,
+			       struct spi_transfer *xfer)
+{
+	u32 hz = xfer->effective_speed_hz ?: xfer->speed_hz;
+	unsigned int limit = as->poll_limit_us;
+	int word_delay_ns;
+	u32 words;
+	u64 us;
+
+	if (!limit || as->use_pdc || atmel_spi_use_dma(as, xfer) || !hz)
+		return false;
+
+	us = div_u64((u64)xfer->len * BITS_PER_BYTE * USEC_PER_SEC, hz);
+
+	word_delay_ns = spi_delay_to_ns(&xfer->word_delay, xfer);
+	if (word_delay_ns > 0) {
+		words = xfer->len / DIV_ROUND_UP(xfer->bits_per_word,
+						 BITS_PER_BYTE);
+		us += div_u64((u64)words * word_delay_ns, NSEC_PER_USEC);
+	}
+
+	return us < limit;
+}
+
+static int atmel_spi_poll_xfer(struct atmel_spi *as,
+			       struct spi_transfer *xfer)
+{
+	u32 done = as->fifo_size ? SPI_BIT(RXFTHF) : SPI_BIT(RDRF);
+	u32 status;
+	int ret;
+
+	ret = readl_poll_timeout(as->regs + SPI_SR, status,
+				 status & (done | SPI_BIT(OVRES)),
+				 0, (u64)as->poll_limit_us * 10);
+	if (ret) {
+		dev_err(&as->pdev->dev, "spi transfer timeout\n");
+		return -EIO;
+	}
+
+	if (status & SPI_BIT(OVRES)) {
+		dev_warn(&as->pdev->dev, "overrun\n");
+		return -EIO;
+	}
+
+	atmel_spi_lock(as);
+	if (as->current_remaining_bytes)
+		atmel_spi_pump_pio_data(as, xfer);
+	atmel_spi_unlock(as);
+
+	return 0;
+}
+
 static int atmel_spi_one_transfer(struct spi_controller *host,
 					struct spi_device *spi,
 					struct spi_transfer *xfer)
@@ -1412,6 +1479,8 @@ static int atmel_spi_one_transfer(struct spi_controller *host,
 	as->done_status = 0;
 	as->current_transfer = xfer;
 	as->current_remaining_bytes = xfer->len;
+	as->poll_limit_us = READ_ONCE(polling_limit_us);
+	as->poll = atmel_spi_use_poll(as, xfer);
 	while (as->current_remaining_bytes) {
 		reinit_completion(&as->xfer_completion);
 
@@ -1437,6 +1506,13 @@ static int atmel_spi_one_transfer(struct spi_controller *host,
 			atmel_spi_lock(as);
 			atmel_spi_next_xfer_pio(host, xfer);
 			atmel_spi_unlock(as);
+
+			if (as->poll) {
+				as->done_status = atmel_spi_poll_xfer(as, xfer);
+				if (as->done_status)
+					break;
+				continue;
+			}
 		}
 
 		dma_timeout = msecs_to_jiffies(spi_controller_xfer_timeout(host, xfer));

---
base-commit: 2bc7eb398cd0f89fd2331d5a1a8fe7ed17addd35
change-id: 20261112-spi-atmel-poll-short-pio-transfers-bd8fcb9c19bb

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>


