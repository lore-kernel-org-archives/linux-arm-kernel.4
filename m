Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12194606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 03:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qFnfFnhz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTAy0myP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PCXVp3TiouFUBp+9ys/g3hrJvGOqhB12mNnRiK6VjhQ=; b=qFnfFnhzi+VIPk
	i6PlC4kQ0FseyltdB4md8zKln3L1AyO3n0CYC9OcXTrjGodPvmaz0SZlesQrjZ1w7wSH4DS9EAEbA
	WueRFjKS/LdVisjbeLzPtLLPTJXM1IMck664pbuGWrDCbQ+KMJLJgQp8c4iGxkEt+sA3h6fR9gPAI
	xHjAPoNn+s8GSZMQ1VCLbJzAdo6p4D6mdCwfl7+4+LezlvyFKIKkyuPmgwxn95MaRieImrNFea8C+
	Q5NgMAkLZCeKc0iMjj2yGfobOpWYll+QGKdkH2/fbz39giFVr0GfZ6T7qgLtUehUDzc4xUnUDSgaM
	/asbJep4UuPhKRiNkFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGPp-0000000HGVz-3dnd;
	Mon, 09 Nov 2026 03:51:29 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGPl-0000000HGR4-06w5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 03:51:26 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7f84a55e31aso210237a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 19:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196284; x=1794801084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCXVp3TiouFUBp+9ys/g3hrJvGOqhB12mNnRiK6VjhQ=;
        b=kTAy0myPoMObjqpQp0mQHDQ47lhIDXFn4cd3PvXhXnkoCbcDOJzYHezE8vKqFZAf0i
         rN/tSYwhpFJubyJ+LmLG2NMJfmQ6CFphiQAlTJ3vaAtzP6Jq3v9NFSrLvbIzzKKpa/nx
         ikz0Kc/zBrTwV9+lTQ5ecJty1ZDGShQsNwDpfva64w+dVAbrMdoseLJ/zsZEMrPnn+eg
         ta1pJsCbEPKfNsK4OVwRDB1VTcvpJLevHgEUcyRY7teGvGX00jw2JqYCVAfjJCOeRnvp
         B4RvCPbdXhEWi9a6+NiK/w2BJ3/BXa2iKlWwqGq/p9Elv4c+fCFNz11eRACOUUefftrm
         qW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196284; x=1794801084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCXVp3TiouFUBp+9ys/g3hrJvGOqhB12mNnRiK6VjhQ=;
        b=ajdZ06sXenq1FbzvbS+CGZ0slgEUgNXe0LelO34D8/gMd6B4h6RhmhzoOvp82iOs+3
         rVWydE6Z7WE6AtUIAUempbzarWmhIQzplKClU7MgJmAM9NLzGdTjvsuJigfw2omZy4IL
         NgRLFlbsYDlekPen5mhoi3VotDcd0Zrf1FoVl+NuL6SkG+EkyvhV5rhprKe2C9lKsDAH
         doYChr6hHMA0wFkjIR5USKMhkapEsts56/fq/TE5TbmkhFjX9qxK1/hwp1COFE5Pheti
         66T2lClSCy8UPWeJXk/AdDLHow177D79qDN40nZoMebjnXIAxH27IwBaHZN4ujTwRzbU
         KC8Q==
X-Forwarded-Encrypted: i=1; AL+hErFWAQ6E8/WEu0KW3hFPCmSZEXB8sXPCtmPsTl5dNMUhMMXwuWopuT3JKEG/xaBHQUb49AAgZkFcFOl9Lk+V9GoR@lists.infradead.org
X-Gm-Message-State: APuU4Z9iH+XedhJDMqp2l39NRzYHRp1pYm7sGus01TUd4nUOicswxw6R
	L8G9jzfz79gFw6GCRH306r/YzobbwFXvS1owaT7NoLDvkwh4Os4fzH/a
X-Gm-Gg: AYBFou1OvOq0ERS3I9YMNsj+tzX4Qd6jvO+/nGa60Al56cx0LzFkURp1yIm6q5XaoGe
	QwjUsizMEN7lNnftZmzYXiv6Od1edHm4UgfXdzYwrhOc9noRb/1O85gyPFADKq/tPgwbK7XenO/
	cxbGMNShpGJxj39Lpg1egwfYgZjsttj+E+NGX5KDCtkD2ZP/yWQ7lVSfbhIz1k1ewOf7nUIMsLg
	AbXDvg1tAmak2eV5pOUA4CDzTXTgutglUNAN9I5Nw+NQE0s5VFiXHaApwdhOLo6c1peA50Xwz10
	/sGIQonS20ejMllKXDjKXvb4bjAoW4bOhVY9o/tOmrkNJqpgiEBruro412aNRb5tJmEft3nL3wQ
	zEoqOmVaLnQYhYMqsX9iAu9j44Je/hy54B45ZeG/daxkRt/7y+t+lvY2Wd625XABZIn0EUXnVxi
	5W4BJOFZFC+MsIoNdlG5iScxeqqk43/YNa9SeRbdgpBiGF1FJ/Z0vEvSbNKIFz8NNjTDSD1leSg
	KRWrPlQVt4cvl+4uChvAF+yQOhnjPh0r80Tpeny3P7p/ZrqY1xD3aW4+wDbCzqa1zds8EcO4++k
	k8XU9DCLP++GR55coQwijoxEN8knpBJlElbL5RhxMTFTc98z8nybr/VbDWjoB67KyQFORjdaE0q
	Sxe4pDxpGAKUaOfcnainvVnDe3PVQEbEcUDFrLN3TQzT7GFZ1WS1i2LKaA438CcimYQuJ5wx7rs
	WbcsXkl6HxTkD6s43E+b56Mt649FSPnQU+na+QxRodRtKmA/zLbKj2
X-Received: by 2002:a05:6830:928:b0:845:156f:58b1 with SMTP id 46e09a7af769-85f50847937mr2643447a34.24.1794196283700;
        Sun, 08 Nov 2026 19:51:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:17 -0700
Subject: [PATCH v10 8/8] serial: 8250: retain DMA resources when
 termination fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-8-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
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
X-CRM114-CacheID: sfid-20261108_195125_084670_36EFF728 
X-CRM114-Status: GOOD (  18.29  )
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
---
 drivers/tty/serial/8250/8250_dma.c | 50 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1ea22954150c..a279e3a1a845 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -528,6 +528,53 @@ int serial8250_request_dma(struct uart_8250_port *p)
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
@@ -537,9 +584,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -551,7 +598,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0


