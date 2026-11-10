Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66D60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y/J0eXbu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seeI3EPK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=; b=y/J0eXbue9YOwB
	yeKRdmndbuMCOQZKPOUkr9yeFNwdA9CfKNXxKWDVWNAsP/2AAg+1wqUnDGfzHgIdgNYPXXMelU44P
	pmOh3J/akxh5ZhkS+ws2989CsbdNvR/+xJQlXKUd8UN0ZRT8yYZhJQTsDhA7Lf7YKtWhHOI4hRgAG
	JF1IhnKfmUiXpgjeyqfcAF7EwlI0G9oiJ97fV5xMpgR6AkFrvpW5+dZa1y24Uu23KrvD1bEh7y6ja
	PLml1O6WmY/86CO48GbARpAs8/eZY8OfZRYQdEjYMxmdQuYw5WbbxF5SoqRkXgy6naH3ibu4ZW0nF
	A9yDNYH8xJJkPWqdOCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQd2S-00000002L1O-251G;
	Tue, 10 Nov 2026 04:00:52 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQd2N-00000002KwV-0C1g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:00:48 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-8479f46ecd8so803364a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283246; x=1794888046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=seeI3EPK+NW2nn1Ma4hBy3K/rvypdh+q9V2uiJWnHzuCWWZX8MYSE4ZHBKc0/z6goY
         mmg5LseiZR3gR9UzuRODkspLHLzDJW/y8mqewoAZ5FOG8vfphHPLxoxNPX6FF7k9FIWM
         di2SPdxOKMK+dibLIampUPyEnPExLn3gyWfz8FHvwdvUWAM7vYmvJVKLjdv/J1bCI3qm
         gHmkyeddlEVAk2uenNAkNfO8UgAS+HtWCPZhsI4+MEieh441hGzFyNIjO0eUjfHYk5mp
         4y6r0RVuATSrv+QRgdh3FKjuQ0Jp5eyLBmyNun70jShy8HRbj3egUZ97rpoKx6AJQ5rM
         50NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283246; x=1794888046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=znWl3crtLU+Io30HWIeL87rGa9tw29vg0Jr780XYKl26ThSNsKTHdA4hzeeiiOdbUt
         6a523xLbgzMhq//2NoSKbG3+1Ss6ZLvfR0lPEBXHHOQudjSZCDupKC2zWl47HKc5k8n+
         mzb4X7FWtONXyFSguTCjbfOSGmjQZWhGqF7UWt1OYeGACF1pgZpWExL7krE/MH1VVuzL
         X1JL0f0ycHJHM6gz3W4xUyZ4qSpU3+ENj8DCNjfYm9v4ldumD+JTgdKpsdZb6mv1Iy4y
         r9mtr16E4SBLfKpIantfHdtI1d/KGaQpDUfOh31OeS7h+QwWYKSji52GJHVH/669BTx/
         9pkQ==
X-Forwarded-Encrypted: i=1; AL+hErFIYsxd+H+8BTl+BmJK1IjdOVb1b6DQtFcSNiQJh9m789lxY08w+++6ncSIZkrJpzVxqsAyoRZEp31pK0anjnjy@lists.infradead.org
X-Gm-Message-State: APuU4Z/pSgAYkQFVYqIz5J7xa2JzIC1DQkJF7Mfklvko/odm+KezK1/Y
	lfP1i1EeyWQ53kz3zgThYWT2w7GoazeF3woWyLX6HTQ7zrsJrL/G9jOd
X-Gm-Gg: AYBFou0sw2FxkSmxuIK9RD7UMtYj9UD28g/RK7MY5S8ZhrBu3MiVmKhz5rjkGWBeOWN
	qCXwerwl6PS0E3htjETEakipmQz+8Br5kV5Gx5q0FvmhdSMB0L18dQjPurCnPSvmJfwKqg82Wmb
	gJej4VshObcV3WbClaxDF7GH9nFkrEhAxkVSwYaihJTtSFSqMffG7HwV6GV6uEyGnVNWYJ60D9Q
	gBEdk86cT6FgSZQtEDdFyJApab2pc/pBY5+9TUaSqMjOmj7nrEVMVSne/6xVkCJdD87NMWrQOk2
	55om1ym9iDzfHSxisoP4j1sEuhMn2kDn53YDfk466AQcoFdO+H2H2JUzCFqDRhzoIPzIejoTd2k
	iZMdfOnheACK3eyMDRC0hX50dpffUTb0+3hN6acUXAT4RYStetxKa8WdzorysdWL/hJYTa9wpI/
	IETmyNge7xXbVkl2JHv6YJBFYU2CR9OZZ7LEJDdXees4AU7NrLi9cR/C4L147nYgGE43j1wGfLz
	t/j1zo/NAak8F5xk4+JT+U5HNyCAhdf6yn7IFqrGaZ8S2lizd0Tls0U5L9AAbcMuOTwweUu7bvf
	eCknsh8BeU9XWhTVzS8QC0/WncgMSVLnMQV4FvoD8vhRr/V7JKi8gpxjb/6plvXETBjYp6/HuQO
	ZLPMWLteqq83HLtYIWQ1raAuwkC8NgYgrUtdwox4SvT0kRaTgAvNcWOrE65nJnxZLve4bVUfK70
	+0MBoKg1FGt17PUWnkwy4XLQ7LdV8r1C1qEk7dXVfNIRYcYKc4dD3yIMbuZgMueQfIZpNemPLt
X-Received: by 2002:a05:6830:4aca:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-860dc8464a2mr1224823a34.25.1794283245936;
        Mon, 09 Nov 2026 20:00:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:23 -0700
Subject: [PATCH v11 8/8] serial: 8250: retain DMA resources when
 termination fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-8-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_200047_433941_109E13CB 
X-CRM114-Status: GOOD (  18.35  )
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

serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
the channels. If the provider fails to stop a channel, the DMAengine
wrapper returns the error without synchronizing its callbacks. Hardware
or a detached callback can then access the released storage and state.

Checking the error and returning early would not preserve their lifetime:
serial core frees the TX FIFO after the driver's shutdown callback returns,
and port removal can then release the callback context as well.

Require successful synchronous termination of both channels before
releasing any DMA resources. Retry failed channels after a sleep outside
the port lock, leaving channels that have already stopped and drained
alone. Keep the shutdown gate and storage reservation in place throughout
the retries.

Start retries with a 1 ms sleep and double it up to one second. This
makes short-lived failures responsive while bounding sustained retry
activity; neither delay is a hardware timeout. Report the initial failure
and ongoing failures with the elapsed time and current RX/TX error codes.
Track the five-second progress-report interval separately for each
teardown, so failures on different ports are reported independently.
Report recovery once both channels have stopped and drained.

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
---
 drivers/tty/serial/8250/8250_dma.c | 50 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index b1f2998e7735..6efeb16fd994 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -565,6 +565,53 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = 1 * USEC_PER_MSEC;
+	ktime_t start, last_report;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+	if (!rx_ret && !tx_ret)
+		return;
+
+	start = ktime_get();
+	last_report = start;
+	dev_err(p->port.dev,
+		"DMA termination failed: RX %d, TX %d; teardown blocked\n",
+		rx_ret, tx_ret);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		fsleep(delay_us);
+		/* Retry promptly at first, then limit sustained retry activity. */
+		delay_us = min(delay_us * 2, 1 * USEC_PER_SEC);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret) {
+			ktime_t now = ktime_get();
+
+			if (ktime_ms_delta(now, last_report) < 5 * MSEC_PER_SEC)
+				continue;
+			dev_err(p->port.dev,
+				"DMA termination still failing after %lld ms: RX %d, TX %d\n",
+				ktime_ms_delta(now, start), rx_ret, tx_ret);
+			last_report = now;
+		}
+	}
+	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+		 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -574,9 +621,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -588,7 +635,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0


