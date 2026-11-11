Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED20606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YxeetSft;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlmmL6Cp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HwQsavcpwT6oUkHLWkX2r2aaF5YyockY0Ila1LjxSlk=; b=YxeetSftoI3X/Y
	IcRhg9npzScl4eMpkmVW7xd3lAmnCxLcwelyx84bstRq/WKP/B2udkG4/7jfWYghLWuNJ7knstJKt
	pa29UBR+t/rOHmbQCNPjAubwQcfXhyp6KhwD9ICZkG51xHErHaphVcM/+oYjkB0JB6vns0/NW2784
	fum08UUJfks1JfBNMnKznWbEpFvgnF8F3r/pzgPAScoltIhAt6zv3Z2rfHuHUAx72Wdh8Yyl465WS
	67cmtIj5nL/nAz40YiUhqEK9rDhLTUTHs8yGCoyYbct+oBGR6ffbic5v3klAxYo7FEwNod98RH2N0
	rAYLBWuv4ofVT4habIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcn-00000007vFR-40tA;
	Wed, 11 Nov 2026 22:17:01 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcV-00000007uxZ-3GBD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:16:45 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-844a8bf7e25so2606150a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435402; x=1795040202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwQsavcpwT6oUkHLWkX2r2aaF5YyockY0Ila1LjxSlk=;
        b=xlmmL6Cp/k3HBjG2U0FuQzlqyiT32/s3oxMSJoO3qHg4LK/e3rAySqMOPodrSLTRVR
         Z+MPR/puBQzlYbjjcRCCGs0SBqm/eXGA2Ut6pfOQ3gX7rkeJgXN5Do0vvYCMZKH0Rogm
         vBao60xBQqE7eUCSr19BdoYvTUxVDgOVvFRw8SzepiwznfXsW+zlWbDc0Y64Oa9ANegw
         OlBL24c7FyLZfA8kvaK89WdpO4esTQVU3flLc6U+dIJfhOjG3qxEJsshiowYH6q+GYYs
         xmJoha0ccMvrXy//A1rY2mWjuT1psXbLpmLfDW2s6eNWo9wCT1oSpEJVkt8d8m2Du73r
         8g+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435402; x=1795040202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwQsavcpwT6oUkHLWkX2r2aaF5YyockY0Ila1LjxSlk=;
        b=Ywr7TxqD4xnxFw47EVpY+YMvjo+7EbHzad01LUWA6UQF+ipSTKpAiiy30sQhmpDLCU
         OV1Jl6eowZoKwkLazGRxDJSJvq6NLKGCgcTCO3wpIgkh++6/Y610e7f5dUY9jMRq4Cdv
         Zea210CK1Obh3bNWJJ30qltB7klwMr4XKmtRXLe2W38ZUD9HAOSNdZn/WlDGx9WSb3pa
         +VTauhUAT2NCZKRjxb2oEZHlx3rBCC987TyI6y8BeBfupP7/SEfyKkztz7SpU/NMTRXz
         pPsvuoJ7FdeOpXAxSqd24D2oPOgXY960Esls3FdmWVY/x2U0xHIwsKJ0QakKxHFTUvwm
         R1Fg==
X-Forwarded-Encrypted: i=1; AL+hErGvq8synhKVAIWy77MzDQAmXUqcoBHrXvhEDGKzOZL99fZU5JkvuQLmSOO3sfR08FY5oOKaJ/vGoI+pOTAjMTt0@lists.infradead.org
X-Gm-Message-State: APuU4Z88HqlQ9e+gpR9yVEmat9E55RX32rTPbRqrgrLKlCSMcqaYYVlK
	bNhq+G3CyvaoblugteKUs5BIoGHTe00Z2CBzRkvlQCUay4EK0m+NN8Ds
X-Gm-Gg: AYBFou13wUrfGwIqV9XkMcEc1P4/sIrzYVpl1ikc1VhZPLZ7nGdg3CZFF4Tf6gEAAnN
	GBbBzAjME94Ut2s7xfu+Am9s2eMgBPXBJkQdR3Tp/p7Ewcdnps23MlV+xkYhoE9nRKCdwGF3pJB
	pp/VAzvGHsTz7Vwi9le1mkb7GWSLHIDoL7S8hpr24N0yDdTRZblFq6FFUFEZJq2MAe75bLa/eM7
	QFcYaUkwU417Zf3HhrZDywgVCGgDogH4xdAjzy3Eg9FBq1jVWZLShM+9BjtPayeB6B1QsegYekQ
	UA996zDLJGscTGwVhsqtQK0J6fhrwMjXxRs1mL4Fk5zp56l8M/EOfKQN4CD6KnZhPVyXXw7xOd2
	l4Id+o4pFwfLsGwnOWe40rR5EVAvoXzGblKl6IpsBVvTv/eoxjsaWxWR/afAR8v83iIQuETQ+1e
	KNrZYQb+JXDAX4SgqWH+NUF68oCx5p6a15JnlJAAXmbh6zpIoTV2vCxitEPXN4t8aprAvMEUmcZ
	VAOtNZbK2lDVQ0KBkDK6kzQNMCa4OfI3y6bZEBnuApngg6Rj4FaP8cym3qPpGqn9oTkT3pHtQjY
	/Dgmu1/K5NdUP2OCj3zcIDNevvXxtpsRa8Q3CFoFAcWK43MJYGzH+M229AkMGh5YkFlDyhB8TCx
	VHQtE5REu3z+KOb3otZg3axMFW4WvNn6VUmqFkVACeFDcR0OLBqofPjaPZI1sA8okNE9EVun6Lw
	f8FZ6yZsP1NjD+alQjDyn11lO6s+iaFaBppctCqNIVTR+aKJIHCkcwC8h4XTVzPyptVw9bgAcR
X-Received: by 2002:a05:6808:1304:b0:544:1bec:8daf with SMTP id 5614622812f47-56b95f9f65cmr3204363b6e.37.1794435402238;
        Wed, 11 Nov 2026 14:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:31 -0700
Subject: [PATCH v12 6/8] serial: 8250: drain canceled TX DMA before reusing
 its buffer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-6-9e3456bc2555@gmail.com>
References: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
In-Reply-To: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Timur Tabi <timur@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_141644_072334_C4D3B696 
X-CRM114-Status: GOOD (  27.17  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

uart_flush_buffer() resets the transmit kfifo before calling the driver.
serial8250_tx_dma_flush() terminates DMA asynchronously and clears
tx_running, allowing a new write to replace tx_size while a detached
callback has not yet run. That callback can then consume bytes
from the new transmission. Reusing the reset kfifo can also overwrite the
source of a transfer that has not stopped yet.

Reserve the flushed FIFO storage through serial core before returning
from the flush callback. Keep tx_running set until a worker synchronizes
the terminated channel, suppressing old callbacks and new submissions
during that interval. Return the mapping to CPU ownership before releasing
the reservation and waking writers. Normal transfers continue to use the
FIFO directly.

Reuse the locked completion processing after retirement, including OMAP
delayed register restoration and transmitter-empty handling. Take a runtime
PM reference around worker UART accesses and drain the worker before
releasing the channels. Shutdown releases the FIFO reservation after
stopping DMA and unmapping its source. Serial core keeps writes and wakeups
gated until startup or resume makes the port ready again.

Track a flushed FIFO separately from the transfer length. If termination
fails, retain the reservation until normal completion and account the
completed bytes without advancing the reset FIFO. After successful
cancellation, process a zero-length completion once callbacks have drained.

The race was found by inspecting cancellation and restart while preparing
H616 UART DMA support.

Retain the tx_running check in both completion callbacks. Releasing the
reservation relies on the DMA provider draining detached callbacks when
dmaengine_synchronize() returns; provider callback-lifetime fixes supply
that guarantee for controllers which previously lacked it.

Fixes: a424a34b8fad ("serial: 8250: Fix TX deadlock when using DMA")
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  20 +++++-
 drivers/tty/serial/8250/8250_dma.c  | 130 ++++++++++++++++++++++++++----------
 drivers/tty/serial/8250/8250_omap.c |  21 ++++--
 3 files changed, 125 insertions(+), 46 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 974a47f24084..1e739aceff39 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -11,6 +11,7 @@
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/dmaengine.h>
+#include <linux/workqueue.h>
 
 #include "../serial_mctrl_gpio.h"
 
@@ -19,6 +20,10 @@ struct uart_8250_dma {
 	int (*rx_dma)(struct uart_8250_port *p);
 	void (*prepare_tx_dma)(struct uart_8250_port *p);
 	void (*prepare_rx_dma)(struct uart_8250_port *p);
+	/* Completion processing with the port lock held. */
+	void (*tx_complete)(struct uart_8250_port *p);
+	struct work_struct tx_flush_work;
+	struct uart_8250_port *port;
 
 	/* Filter function */
 	dma_filter_fn		fn;
@@ -52,7 +57,9 @@ struct uart_8250_dma {
 	unsigned char		tx_err;
 	unsigned char		rx_running;
 	/* Protected by the UART port lock. */
-	bool			shutting_down;
+	bool			shutting_down:1;
+	bool			tx_terminating:1;
+	bool			tx_flushed:1;
 };
 
 struct old_serial_port {
@@ -400,8 +407,15 @@ static inline int is_omap1510_8250(struct uart_8250_port *pt)
 #endif
 
 #ifdef CONFIG_SERIAL_8250_DMA
+static inline bool serial8250_tx_dma_blocked(struct uart_8250_dma *dma)
+{
+	return dma->shutting_down || dma->tx_terminating;
+}
+
 extern int serial8250_tx_dma(struct uart_8250_port *);
 extern void serial8250_tx_dma_flush(struct uart_8250_port *);
+void serial8250_tx_dma_sync_buffer(struct uart_8250_port *p,
+				   struct scatterlist *sgl, unsigned int nents);
 extern int serial8250_rx_dma(struct uart_8250_port *);
 extern void serial8250_rx_dma_flush(struct uart_8250_port *);
 extern int serial8250_request_dma(struct uart_8250_port *);
@@ -434,7 +448,7 @@ static inline void serial8250_tx_dma_pause(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
 
-	if (!dma->tx_running)
+	if (serial8250_tx_dma_blocked(dma) || !dma->tx_running)
 		return;
 
 	dmaengine_pause(dma->txchan);
@@ -444,7 +458,7 @@ static inline void serial8250_tx_dma_resume(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
 
-	if (!dma->tx_running)
+	if (serial8250_tx_dma_blocked(dma) || !dma->tx_running)
 		return;
 
 	dmaengine_resume(dma->txchan);
diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 43c55cb991a5..739a8238e4de 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -11,34 +11,79 @@
 
 #include "8250.h"
 
-static void __dma_tx_complete(void *param)
+static void serial8250_tx_dma_complete(struct uart_8250_port *p)
 {
-	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
-	unsigned long	flags;
 	int		ret;
 
-	uart_port_lock_irqsave(&p->port, &flags);
-	if (dma->shutting_down)
-		goto out;
-
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
 	dma->tx_running = 0;
 
-	uart_xmit_advance(&p->port, dma->tx_size);
+	if (dma->tx_flushed) {
+		p->port.icount.tx += dma->tx_size;
+		uart_xmit_unblock(&p->port);
+	} else {
+		uart_xmit_advance(&p->port, dma->tx_size);
+	}
 
 	uart_write_wakeup_if_needed(&p->port);
 
 	ret = serial8250_tx_dma(p);
 	if (ret || !dma->tx_running)
 		serial8250_set_THRI(p);
+}
 
-out:
-	uart_port_unlock_irqrestore(&p->port, flags);
+static void __dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (serial8250_tx_dma_blocked(dma) || !dma->tx_running)
+		return;
+	serial8250_tx_dma_complete(p);
+}
+
+static void serial8250_tx_dma_flush_work(struct work_struct *work)
+{
+	struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma, tx_flush_work);
+	struct uart_8250_port *p = dma->port;
+
+	/* Neither the channel nor its buffer may be reused before this returns. */
+	dmaengine_synchronize(dma->txchan);
+
+	guard(serial8250_rpm)(p);
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	dma->tx_terminating = false;
+	dma->tx_size = 0;
+	if (dma->shutting_down)
+		return;
+	dma->tx_complete(p);
 }
 
+void serial8250_tx_dma_sync_buffer(struct uart_8250_port *p,
+				   struct scatterlist *sgl, unsigned int nents)
+{
+	struct uart_8250_dma *dma = p->dma;
+	struct device *dev = dmaengine_get_dma_device(dma->txchan);
+	struct scatterlist *sg;
+	unsigned int i;
+
+	/* DMA reads the FIFO directly; its occupied ranges remain reserved. */
+	for_each_sg(sgl, sg, nents, i) {
+		size_t offset = sg_dma_address(sg) - dma->tx_addr;
+
+		dma_sync_single_range_for_device(dev, dma->tx_addr, offset,
+						 sg_dma_len(sg), DMA_TO_DEVICE);
+	}
+}
+EXPORT_SYMBOL_GPL(serial8250_tx_dma_sync_buffer);
+
 static void __dma_rx_complete(struct uart_8250_port *p)
 {
 	struct uart_8250_dma	*dma = p->dma;
@@ -99,7 +144,7 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 	int i;
 	int ret;
 
-	if (dma->shutting_down)
+	if (serial8250_tx_dma_blocked(dma))
 		return 0;
 
 	if (dma->tx_running) {
@@ -129,24 +174,25 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 		dma->tx_size += sg_dma_len(sg);
 
 	serial8250_do_prepare_tx_dma(p);
+	serial8250_tx_dma_sync_buffer(p, sgl, ret);
 
 	desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret,
 				       DMA_MEM_TO_DEV,
 				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
+		dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
+					UART_XMIT_SIZE, DMA_TO_DEVICE);
 		ret = -EBUSY;
 		goto err;
 	}
 
 	dma->tx_running = 1;
+	dma->tx_flushed = false;
+	dma->tx_complete = serial8250_tx_dma_complete;
 	desc->callback = __dma_tx_complete;
 	desc->callback_param = p;
 
 	dma->tx_cookie = dmaengine_submit(desc);
-
-	dma_sync_single_for_device(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
-				   UART_XMIT_SIZE, DMA_TO_DEVICE);
-
 	dma_async_issue_pending(dma->txchan);
 	serial8250_clear_THRI(p);
 	dma->tx_err = 0;
@@ -160,32 +206,31 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 void serial8250_tx_dma_flush(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
+	int ret;
 
-	if (!dma->tx_running)
+	if (serial8250_tx_dma_blocked(dma) || !dma->tx_running)
 		return;
 
 	/*
 	 * kfifo_reset() has been called by the serial core, avoid
-	 * advancing and underflowing in __dma_tx_complete().
+	 * advancing the reset FIFO when the old transfer completes.
 	 */
-	dma->tx_size = 0;
+	dma->tx_flushed = true;
+	/* The core reset the FIFO indices, but DMA may still read its storage. */
+	uart_xmit_block(&p->port);
 
 	/*
 	 * We can't use `dmaengine_terminate_sync` because `uart_flush_buffer` is
 	 * holding the uart port spinlock.
 	 */
-	dmaengine_terminate_async(dma->txchan);
-
-	/*
-	 * The callback might or might not run. If it doesn't run, we need to ensure
-	 * that `tx_running` is cleared so that we can schedule new transactions.
-	 * If it does run, then the zombie callback will clear `tx_running` again
-	 * and perform a no-op since `tx_size` was cleared above.
-	 *
-	 * In either case, we ASSUME the DMA transaction will terminate before we
-	 * issue a new `serial8250_tx_dma`.
-	 */
-	dma->tx_running = 0;
+	dma->tx_terminating = true;
+	ret = dmaengine_terminate_async(dma->txchan);
+	if (ret) {
+		/* Keep the buffer owned by the transfer until its callback runs. */
+		dma->tx_terminating = false;
+		return;
+	}
+	schedule_work(&dma->tx_flush_work);
 }
 
 int serial8250_rx_dma(struct uart_8250_port *p)
@@ -310,21 +355,28 @@ int serial8250_request_dma(struct uart_8250_port *p)
 		goto err;
 	}
 
-	/* TX buffer */
+	/* Normal TX uses serial core's FIFO; flush reserves it until retirement. */
 	dma->tx_addr = dma_map_single(tx_dev, p->port.state->port.xmit_buf,
 				      UART_XMIT_SIZE, DMA_TO_DEVICE);
 	if (dma_mapping_error(tx_dev, dma->tx_addr)) {
-		dma_free_coherent(rx_dev, dma->rx_size,
-				  dma->rx_buf, dma->rx_addr);
 		ret = -ENOMEM;
-		goto err;
+		goto free_rx;
 	}
+	dma_sync_single_for_cpu(tx_dev, dma->tx_addr, UART_XMIT_SIZE, DMA_TO_DEVICE);
+
+	dma->port = p;
+	INIT_WORK(&dma->tx_flush_work, serial8250_tx_dma_flush_work);
 
-	scoped_guard(uart_port_lock_irqsave, &p->port)
+	scoped_guard(uart_port_lock_irqsave, &p->port) {
+		dma->tx_terminating = false;
+		dma->tx_flushed = false;
 		dma->shutting_down = false;
+	}
 	dev_dbg_ratelimited(p->port.dev, "got both dma channels\n");
 
 	return 0;
+free_rx:
+	dma_free_coherent(rx_dev, dma->rx_size, dma->rx_buf, dma->rx_addr);
 err:
 	dma_release_channel(dma->txchan);
 release_rx:
@@ -340,6 +392,8 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	if (!dma)
 		return;
 
+	cancel_work_sync(&dma->tx_flush_work);
+
 	/* Release RX resources */
 	dmaengine_terminate_sync(dma->rxchan);
 	dma->rx_running = 0;
@@ -354,7 +408,11 @@ void serial8250_release_dma(struct uart_8250_port *p)
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);
 	dma->txchan = NULL;
-	dma->tx_running = 0;
+	scoped_guard(uart_port_lock_irqsave, &p->port) {
+		dma->tx_running = 0;
+		dma->tx_terminating = false;
+		uart_xmit_unblock(&p->port);
+	}
 
 	dev_dbg_ratelimited(p->port.dev, "dma channels released\n");
 }
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 366fa787292c..e5bca273ce6b 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1100,7 +1100,12 @@ static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 
 	dma->tx_running = 0;
 
-	uart_xmit_advance(&p->port, dma->tx_size);
+	if (dma->tx_flushed) {
+		p->port.icount.tx += dma->tx_size;
+		uart_xmit_unblock(&p->port);
+	} else {
+		uart_xmit_advance(&p->port, dma->tx_size);
+	}
 
 	if (priv->delayed_restore) {
 		priv->delayed_restore = 0;
@@ -1132,7 +1137,7 @@ static void omap_8250_dma_tx_complete(void *param)
 
 	guard(uart_port_lock_irqsave)(&p->port);
 
-	if (dma->shutting_down)
+	if (serial8250_tx_dma_blocked(dma) || !dma->tx_running)
 		return;
 	omap_8250_tx_dma_complete(p);
 }
@@ -1147,7 +1152,7 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 	int skip_byte = -1;
 	int ret;
 
-	if (dma->shutting_down || dma->tx_running)
+	if (serial8250_tx_dma_blocked(dma) || dma->tx_running)
 		return 0;
 	if (uart_tx_stopped(&p->port) || kfifo_is_empty(&tport->xmit_fifo)) {
 
@@ -1206,24 +1211,26 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 		goto err;
 	}
 
+	serial8250_tx_dma_sync_buffer(p, &sg, 1);
+
 	desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1, DMA_MEM_TO_DEV,
 			DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
+		dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
+					UART_XMIT_SIZE, DMA_TO_DEVICE);
 		ret = -EBUSY;
 		goto err;
 	}
 
 	dma->tx_size = sg_dma_len(&sg);
 	dma->tx_running = 1;
+	dma->tx_flushed = false;
+	dma->tx_complete = omap_8250_tx_dma_complete;
 
 	desc->callback = omap_8250_dma_tx_complete;
 	desc->callback_param = p;
 
 	dma->tx_cookie = dmaengine_submit(desc);
-
-	dma_sync_single_for_device(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
-				   UART_XMIT_SIZE, DMA_TO_DEVICE);
-
 	dma_async_issue_pending(dma->txchan);
 	if (dma->tx_err)
 		dma->tx_err = 0;

-- 
2.53.0


