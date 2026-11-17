Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C546606A89B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mcxTn7q4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fYNJsjgA;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LaVRiDqS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LwdZQUIfgt+sse1gdnZ0Zk0xWEjAcM+cCSRaPUtzOtM=; b=mcxTn7q41ldJFe
	ROQn62Eu1kfj3IdgLKXw9fY6DxjebP5MNBnCUaRzGX6dZ+dQNFxZovu+ahNLS8lqEv7yKAULpZR/M
	aXwqyH+zKCjClXZnp2kS72i/eagTGAts0ZLHs0KfgiRj81ijLOxeZMlJmm7ONIsGo5NRpPReB//jo
	mfv79/qHndbVooXhVzy/4OmjIo6MoL24z1fmgKxHZlLqfTCSrQ+OSQeS6XYF9nJ1PkNB60n540q+W
	Rg4pebbQFJQMmQNLQyNoFvUNWXfj2U1ePyVGDfktWCVl47dozbvWfr4RXfm7eAqf4he4NRl1Xf81a
	Xikdje+3w8A3e+dt38OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSxN-00000007JkO-1Sx7;
	Tue, 17 Nov 2026 23:51:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSwu-00000007JOn-1bPJ;
	Tue, 17 Nov 2026 23:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LwdZQUIfgt+sse1gdnZ0Zk0xWEjAcM+cCSRaPUtzOtM=; b=fYNJsjgAtk6V2YI3dOHcHqy/1e
	pXoT5LCwerWPQ1qDZdqnuocJJc8vjbg3OaeeSjvymplHHWS038GLNk9euWPt1au8qh1f/iCTiRlas
	KAe/aj94D9NeodhxZPEfebwbt9wCVoZpyBjxOQvnydz+x5Wl9hSW8V7svPSB1U/uXjbFe19kZe1sc
	6FnkAWYH6EP787GtYwip8t2cOe2ZtxaUuUUzZo+UW233KpYS8lkUH8C+cczoEWrN9N5iRMcq91iNN
	Ektcq61JWc1+SgGfaLombQVOKWhWJJ1MDypvW8eNZij+W1tr1XM5FCXurPQ8Mq56ccDj+jIailkTO
	J2cIQGiQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSwp-0000000FVId-1bDQ;
	Tue, 17 Nov 2026 23:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=LwdZQUIfgt+sse1gdnZ0Zk0xWEjAcM+cCSRaPUtzOtM=; b=LaVRiDqSxwymtAkxtIdEfecLdH
	ORdLws6Pi9v60/6LufNliNKsp+zQBjp8VwG5NxgifJKiK8J/YY4BCWabY4CkU6vNDl+M+2g34p0Mp
	RFv+cAnHP6tnzc33m8HvrBokQBy5kmJYkWYAxyBIGA2Sh/CDeRNb/bTp8DbrFrpAKCATzb154Rbla
	r3RpITOe1UlvmnBh+AvyDvG9ybouqBKFU7d1qh4JyW45BY7oiDBRlbYnWjYcsRWzIFJcRH1ZIu8rW
	Q2QEm0zTE0olTt1rbqIGYmt87aE9S6j5UnbqrQ5jeeJKsTX+GrE1Qauipzj3F9M9jePT7NLkvkNvf
	IPbNbyxw==;
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
Subject: [PATCH v3 4/7] spi: Add infrastructure for atomic sync transfers
Date: Wed, 18 Nov 2026 00:50:18 +0100
Message-ID: <20261117235021.2013719-5-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117235021.2013719-1-heiko@sntech.de>
References: <20261117235021.2013719-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_235047_861837_FBF0E932 
X-CRM114-Status: GOOD (  27.69  )
X-Spam-Score: -0.2 (/)
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
index f04adf069ec1..95fa460ca3ff 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -5026,6 +5026,47 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
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
@@ -5036,6 +5077,10 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
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
@@ -5049,11 +5094,17 @@ static int __spi_sync(struct spi_device *spi, struct spi_message *message)
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
@@ -5069,6 +5120,10 @@ EXPORT_SYMBOL_GPL(spi_sync);
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
@@ -5077,7 +5132,12 @@ EXPORT_SYMBOL_GPL(spi_sync);
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


