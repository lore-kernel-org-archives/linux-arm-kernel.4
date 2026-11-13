Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DA4606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HhUUUCb+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9Y+cEHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tKw63yp+LNfG2M5Iosvm2af5QjVi5+/3H0IZittDmk8=; b=HhUUUCb+mAoTCn
	rJNwj2AbwD8zER5IHqnv7PhtjxuwrNCao1ScROUI82K0oncC6pIQlpdX0d1SniL2AWJzQecFGgjVP
	nF+2hC18/UVqJ3xwRnImqN/w0tfSUwlIKf7fqnMLDCCHZ57WzCKHy7w6XTsv5l6hsUi7NiGVRsJai
	L7wI7jVq+S3I3hz6RkF0/NftnpUtcA2TQs/nwA4EPjw3Y5nk+X1n5MTtZwgJiRrWS+t1IWMgvNc9k
	h3VucEjBjIOhb5u38z5qDRBC7OblUBiRN29wcJMvGeG6NjpEOQUoDf2rPp/8zSfM927D2mpXdXeOf
	RW8PreFnx5Up9o9H/+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnyu-0000000CGeB-3Xwt;
	Fri, 13 Nov 2026 09:54:04 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnyU-0000000CGTo-3GUh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:53:40 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4b28d9537bcso1046482b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 01:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563617; x=1795168417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKw63yp+LNfG2M5Iosvm2af5QjVi5+/3H0IZittDmk8=;
        b=i9Y+cEHWDvDodQ8wy+1/SCol12WHbvZk0aSG2/04R+Zbs/mwgCtNYTURH90A8u8pz7
         OVjgwIePy0F5cdDeiBJPhMX0IkRcZT2fsr45ccWa54pklchSp2NLbUEae0OqucYDJ/tV
         A01eMmjKiYt5dbfHmuu4ioJKVGmDhcvzb1hepCJAWcYvlK75nO2Bx7KeBGu0Xc+2/SuG
         nd3HqevNlRDBu11suAcztnGvD8m9FybhhU0709EKrLlyzdcxt6zokUq7urtpHcG9Ugx/
         mF/Fo6Y+D63SRluLyzjt/CLQwo38PYbU65xlOjLDkrw+nb+zMf83sl8OFV1UvrD70PsH
         Mlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563617; x=1795168417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKw63yp+LNfG2M5Iosvm2af5QjVi5+/3H0IZittDmk8=;
        b=wTx7WtsYa03J38/KyKhNAEniF2/diTTc2zrLZtq3FxckNrfZY7JLVNIcbD1oaFGKar
         dj0CtTFu4sKCdyeGq+YN9D6CSl9zHtvpRsd3j9Fk0EiYgaeK+ArZBf+ZKsysx4OFwxqi
         7D3boaYe/tOabkJHDIJYgOaT8GozoHKn9hDEUw107r7JqA7JGiNE9damoXqPHu038gSP
         8zEfXI4coH9zpJo0rtUUHl+guPWxr4YW1uQqOwc/N9dAhgV/rbqzSX4tmoE4z53t1bxF
         SQBw57Bis1xacWoCweZc0fj1Bk9b0/4Hz9Br7d5s9zV6v2219YZuIhnm30ei/KWHmOR0
         bYTA==
X-Forwarded-Encrypted: i=1; AL+hErEP36XpcUGnL9BYKB6xCqjUm6lEt8GOjsqOktDhTQ9wSfNq5xNQIeIm67RXbVu1KcO/dYBq2i+bdEhO9c7S2gLg@lists.infradead.org
X-Gm-Message-State: APuU4Z+4ua/GMXfCkqXkNBX14zNVT0zh/E1YzL+b1jisLqzDn68o1xYE
	Dv0SCSkYJTSRXbltzbHxbkAJ+O0IwRBhpioS/IOIcQmLl00M35sr0zNX
X-Gm-Gg: AYBFou1X5pG3SO1iHhMI93u5i6kfmaCgiEYlIR+R/9MJ8oEHlrGBe6vcj3T72qvg3Tb
	GZx5rNKA4+BR7GQz0qf1J2c8WtJnDeWwFBODLZEp04rYLa8ML9tnXfrufqBFrz0RIbK5NKWC0qc
	U1WzFMUnsTrcSGqet5H6Yj2pTaoBTshVbELlc7NDFjPv0hBE4osophYOx1JPmEZDgRCMFjV3Qcr
	GtAFf4WvWEqozjrkmKctK9WEZIKs4dj/fjgoY/fxV7N2ElgJj495YtNdVSJObrGd1cCM4SgCMld
	nZpyBB+LXlJxPK4Vm6sQ1tS+RBqcskB3jiUKMOMlAsTbZ/bCub7wH9ii3hbRSBR5dsKUEeGeE1V
	ILJ5/yHZc46vDXsy21quYeAz954igPW6uSbZJQppvtz/fV1w/oN0F5Qu0jUpif9p1HCeOthmOfy
	8WHno1oKNdAMTt2YwpkX4bin86Qux5Z0IWkSLCxyGrIbX18K6jZRf1aLc5SAnWa27DNS+GGKN6d
	Xew+ApTzfzNNO1IPPSPZlIbh3nt5H2vQOJf+Z2fm6N7+rHKE7V8tpQ8a44MRKFoNppVicOER7D4
	PUz5DrBviZvYFURoESpjZzO+CK8vOR7MmwRvT984QuU17vjogiECXW47vA3BzBet03E0pQ/cZkU
	fCUF4qq3fmDVzDFHfe9CbJO2qaviisPnwZdhBVb/6nVCdfbaAX3bkVkCkHkqcjlob8shR1De2Ih
	HFHVnBTlc71sBm3tHepyVNVhBKLVBCRcl3bAfV8uKYI/ZZTuaxkzk=
X-Received: by 2002:a05:6808:3383:b0:564:3e9e:b498 with SMTP id 5614622812f47-56e65624042mr1138531b6e.22.1794563617554;
        Fri, 13 Nov 2026 01:53:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:21 -0700
Subject: [PATCH v13 8/8] serial: 8250: retain DMA resources when
 termination fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-8-b857f2617ece@gmail.com>
References: <20261113-submit-serial-8250-dma-cancel-v1-v13-0-b857f2617ece@gmail.com>
In-Reply-To: <20261113-submit-serial-8250-dma-cancel-v1-v13-0-b857f2617ece@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_015338_900231_48D92646 
X-CRM114-Status: GOOD (  19.76  )
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
 drivers/tty/serial/8250/8250_dma.c | 48 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1d7c3c5b7564..0719fd4c3129 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -578,6 +578,51 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = 1 * USEC_PER_MSEC;
+	ktime_t start = 0, last_report = 0;
+	bool first = true;
+	int rx_ret = 0, tx_ret = 0;
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	do {
+		if (first || rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (first || tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret) {
+			ktime_t now = ktime_get();
+
+			if (first) {
+				start = now;
+				last_report = now;
+				first = false;
+				dev_err(p->port.dev,
+					"DMA termination failed: RX %d, TX %d; teardown blocked\n",
+					rx_ret, tx_ret);
+			} else if (ktime_ms_delta(now, last_report) >= 5 * MSEC_PER_SEC) {
+				dev_err(p->port.dev,
+					"DMA termination still failing after %lld ms: RX %d, TX %d\n",
+					ktime_ms_delta(now, start), rx_ret, tx_ret);
+				last_report = now;
+			}
+			fsleep(delay_us);
+			/* Retry promptly at first, then limit sustained retry activity. */
+			delay_us = min(delay_us * 2, 1 * USEC_PER_SEC);
+		}
+	} while (rx_ret || tx_ret);
+	if (!first)
+		dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+			 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -587,9 +632,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -601,7 +646,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0


