Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5893606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJN0aftz;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0vfJiQpn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R26qmzEd6p1E3qSds2/i4/loBhNjXQNm0755urC7HDI=; b=uJN0aftz+fxRP6
	R7cNE93Y72RCB9rqeIppzaAXrlRWWIp+suMqLyzuOaLfi8qsnuEHgNMuamyFiA8fLdpXy/+5Soz1n
	5edAteGyY1VYuvG0NyADXv/eDLKEm1a9LmRYDd0We75ffOtIhRij8Lyl/aizbfWGqTGYRywqAo2R/
	Zud+PZbqPV5ElOVOIpI4uVR40bbyXYU2FCOuWrGQUAzvrhKipP04HKwtnf/XGD/yr+XKxJ5TonMNN
	qSbvPndZ61kP2OZ8yzUW+PVXedMwpBe9pNfa7oPJlld9TErr6vSmmCGVyUsd1dZHhJ+DXgLmb2Kfd
	amkIJM60k4r/ELziGqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2fI-0000000C9dO-0rbK;
	Thu, 19 Nov 2026 13:59:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2ef-0000000C9AC-2XyY;
	Thu, 19 Nov 2026 13:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=R26qmzEd6p1E3qSds2/i4/loBhNjXQNm0755urC7HDI=; b=0vfJiQpnJT00KWB8dY7BeGFaId
	I5XZTSAF7fnwGul2Vl52LtGB34gkfjgaF5yH5/iI+0fYbjOj8Bmdxc8SU+tl9UujPUTT3oLWACDyC
	PJC+IDFOX+INSpnm9ynHNjEeUbDD3mlpiCFa8pnuzBLL0tqpHVM41uZbphLvR05IkuwgyKWqalxXR
	MhPfg8m+6zqy9DqNuem7Hq6oVNJ/v+HPP7YdD53qZdjjM981JWZ7jqNAeQQe2YTRtKYZYJ9MG5G9r
	o871gUtOgZKfHgrmruYzjZpsZ0LAi138Ly+DfYhX0Bql8OnS03nfS4yJ7MPZoIH0uQeqPKyT8dunx
	arKLAKFg==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v4 4/6] spi: Add infrastructure for atomic sync transfers
Date: Thu, 19 Nov 2026 14:58:06 +0100
Message-ID: <20261119135808.2377849-5-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119135808.2377849-1-heiko@sntech.de>
References: <20261119135808.2377849-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_055826_015250_DE4AB5E8 
X-CRM114-Status: GOOD (  26.09  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

There are cases where SPI transfers are needed during times without
interrupts like shutdown when a PMIC should turn off the system.

I2C already has atomic transfers for exactly that case, so introduce a
similar concept for SPI. Similar to I2C, this is and should stay a
corner-case, so is only allowed during the shutdown stages of the kernel,
when interrupts are already turned off.

So add an optional transfer_atomic callback, drivers can implement to do
immediate uninterrupted transfers and let spi_sync() determine if the
state is late enough to use it.

For drivers without a transfer_atomic callback defined, the previous
behaviour is kept for backwards compatibility and a helper
spi_in_atomic_sync_mode() makes sure to only ever use this atomic mode
during late system stages.

spi_async() does not require a sleeping context for itself, so while it
could in theory also be included, its caller waiting for the completion
can sleep, so would still cause the splat about it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/spi/spi.c       | 68 ++++++++++++++++++++++++++++++++++++++---
 include/linux/spi/spi.h | 11 +++++++
 2 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 0b0bc093e01f..0569f30785e9 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -5073,6 +5073,47 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
 	return status;
 }
 
+/*
+ * We only allow atomic transfers for very late communication, e.g. to access a
+ * PMIC when powering down. Atomic transfers are a corner case and not for
+ * generic use!
+ */
+static inline bool spi_in_atomic_sync_mode(void)
+{
+	return system_state > SYSTEM_RUNNING && spi_in_atomic();
+}
+
+static int __spi_sync_atomic(struct spi_device *spi, struct spi_message *message)
+{
+	struct spi_controller *ctlr = spi->controller;
+	unsigned long flags;
+	int status;
+
+	if (!ctlr->transfer_atomic) {
+		dev_err(&ctlr->dev, "No atomic transfer handler defined\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (__spi_check_suspended(ctlr)) {
+		dev_warn_once(&spi->dev, "Attempted to sync while suspend\n");
+		return -ESHUTDOWN;
+	}
+
+	/* Not using spi_maybe_optimize_message, so just validate */
+	status = __spi_validate(spi, message);
+	if (status)
+		return status;
+
+	spin_lock_irqsave(&ctlr->bus_lock_spinlock, flags);
+	status = ctlr->transfer_atomic(spi, message);
+	spin_unlock_irqrestore(&ctlr->bus_lock_spinlock, flags);
+
+	if (status == 0)
+		status = message->status;
+
+	return status;
+}
+
 /**
  * spi_sync - blocking/synchronous SPI data transfers
  * @spi: device with which data will be exchanged
@@ -5083,6 +5124,10 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
  * is non-interruptible, and has no timeout.  Low-overhead controller
  * drivers may DMA directly into and out of the message buffers.
  *
+ * During the time when the system is being shutdown and a transfer_atomic
+ * function is set, this call may also be used from a context that does
+ * not allow sleeping, i.e. with disabled interrupts.
+ *
  * Note that the SPI device's chip select is active during the message,
  * and then is normally disabled between messages.  Drivers for some
  * frequently-used devices may want to minimize costs of selecting a chip,
@@ -5096,11 +5141,17 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
  */
 int spi_sync(struct spi_device *spi, struct spi_message *message)
 {
+	struct spi_controller *ctlr = spi->controller;
 	int ret;
 
-	mutex_lock(&spi->controller->bus_lock_mutex);
-	ret = __spi_sync(spi, message);
-	mutex_unlock(&spi->controller->bus_lock_mutex);
+	/* Keep old behaviour for clients that tolerate the warnings */
+	if (spi_in_atomic_sync_mode() && ctlr->transfer_atomic) {
+		ret = __spi_sync_atomic(spi, message);
+	} else {
+		mutex_lock(&spi->controller->bus_lock_mutex);
+		ret = __spi_sync(spi, message);
+		mutex_unlock(&spi->controller->bus_lock_mutex);
+	}
 
 	return ret;
 }
@@ -5116,6 +5167,10 @@ EXPORT_SYMBOL_GPL(spi_sync);
  * is non-interruptible, and has no timeout.  Low-overhead controller
  * drivers may DMA directly into and out of the message buffers.
  *
+ * During the time when the system is being shutdown and a transfer_atomic
+ * function is set, this call may also be used from a context that does
+ * not allow sleeping, i.e. with disabled interrupts.
+ *
  * This call should be used by drivers that require exclusive access to the
  * SPI bus. It has to be preceded by a spi_bus_lock call. The SPI bus must
  * be released by a spi_bus_unlock call when the exclusive access is over.
@@ -5124,7 +5179,12 @@ EXPORT_SYMBOL_GPL(spi_sync);
  */
 int spi_sync_locked(struct spi_device *spi, struct spi_message *message)
 {
-	return __spi_sync(spi, message);
+	struct spi_controller *ctlr = spi->controller;
+
+	if (spi_in_atomic_sync_mode() && ctlr->transfer_atomic)
+		return __spi_sync_atomic(spi, message);
+	else
+		return __spi_sync(spi, message);
 }
 EXPORT_SYMBOL_GPL(spi_sync_locked);
 
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 0bf31776c54c..f62b21af5d75 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -461,6 +461,8 @@ extern struct spi_device *devm_spi_new_ancillary_device(struct spi_device *spi,
  * controller for configuring specific CS setup time, hold time and inactive
  * delay in terms of clock counts
  * @transfer: adds a message to the controller's transfer queue.
+ * @transfer_atomic: transfer a message immediately from a late-stage
+ *	synchronous transfer
  * @cleanup: frees controller-specific state
  * @can_dma: determine whether this controller supports DMA
  * @dma_map_dev: device which can be used for DMA mapping
@@ -721,6 +723,15 @@ struct spi_controller {
 	int			(*transfer)(struct spi_device *spi,
 						struct spi_message *mesg);
 
+	/*
+	 * Bidirectional bulk atomic transfers
+	 *
+	 * Special function that allows transfers in contexts where
+	 * no interrupts nor DMA are available.
+	 */
+	int			(*transfer_atomic)(struct spi_device *spi,
+						   struct spi_message *mesg);
+
 	/* Called on deregistration to free memory provided by spi_controller */
 	void			(*cleanup)(struct spi_device *spi);
 
-- 
2.53.0


