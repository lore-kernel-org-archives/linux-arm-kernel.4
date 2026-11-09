Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA54606D813
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQ7PfbpB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HcBquicb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=; b=PQ7PfbpBkGRMvg
	4Qxn/FBnUCE222jRNm2UBQvnro7wCxKRvN5LMaOP4sIxdEm1R1BFKqzWPa4Faq28sjIdZcgjy7Y0B
	GblPBLZnoz2KFU8z+XpkbO4LKWojC43JVk34gRiTaosQF9pB2tyE0FKiQFfS+ozK5FpHnjRL4gXf6
	kdaTSFKpIxGsbzaxDxndIxPVfO2N0Zw5Swf8s22VZ/mI79C3yltMsMFHt/nXHIMWVi2/4rNAVmpHU
	e8QKA/lL1qA/FFeCySN/cwdOPJveylEw+ie9QgID2g+skPz5CURj/repB51ytVzUNtGBUI+FFJz+9
	UgPrdUcCmrk7d716qo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGPg-0000000HGNM-1HMs;
	Mon, 09 Nov 2026 03:51:20 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGPd-0000000HGLX-3Xbi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 03:51:18 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-843b6f8e2c7so618486a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 19:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196277; x=1794801077; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=HcBquicbM/X+AybEX6s9d7Tcztq9pawz95FZORGxJYmp8Pb5mYkuF9Q5s+8U1AWu5c
         BB8yY2CEwLbONN1tCkp8FyOBHbUrD0Zdw2xMIB9fWQofTbsKi+8z9YHDsCfNTijgk/kT
         /lk4+J0O0QEoWJHzop4t1prisGbLtUIO0C25A92F35cKF202vuEUtM3VvaW1lb9aw9HK
         utUu39bShkdyrICegoNCbRu8baIQ9iiAMpHEnIZiz77vdf8efZ4duUHaiPZ/RoD1dhvG
         EjD9WRw94+EjlGXJ1XI9afJefgFLeeGXZqOj7uLrT0rc/cLd+5jY5IRXCoyIz4jOvbJX
         iTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196277; x=1794801077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=faHGAHE81KYRtaPbgU3nEoenv/7dwJKzjnysPY/s0NY6bjpliWjzOaHEIFUghuhmrr
         rYQKRyZftXxcIUV757P97zayiaMEbboMxS6VIvRVxe+VtawIbXVFmJpoYUY7fzCbn7W6
         ICp4JsydoLDLfHj533OKNPlEHJ6UJeVeeBfHxmUO2O9m566VkUKvZMirO29Ypx/ATqNy
         Qp8hhOQO02WhG0EOAduaepHSuz+ipzN1EuU4C9jmeSLUXy3Ngruw81lbHA1FC9HC4kSN
         /YCd6UU+RzGNZGDJl32Qdw8VWPFHfaCim1civTWCxNMHs447DfpE59qAXCQ31pgQavB1
         /Lmw==
X-Forwarded-Encrypted: i=1; AL+hErEhUvEZXkNEr81Cv8hh5J2ME7Fe51j8lwoHPfc7+mfBFU1/Z920T7JmE70YWswrHbdIOlogiQqW7UuRrud+ZOA0@lists.infradead.org
X-Gm-Message-State: APuU4Z8DKHE0hr6uLnzHTSsrEi5WlPeEgMSu09QFNTTb85ZxxWihJN+w
	OPA9asA6LyGZyhncrpAjXY2uX4DrO7zUKzKSxLHMgoa34A2biv8645kP
X-Gm-Gg: AYBFou2uneT57cqecYpZrBe00VBIYZXs4mUVkCsTTpYnyvueR2OpTSdbOOiWQdzzBYn
	hDppeNgTCUvzO6kta4YqICM3nLi4jinwJNvTzInDV3JPkkbmcQAhWLlYhzj/H77A59Nb6vuB1eM
	UWEhqmYJplQ47rZbAzaLg7ldhOvaHQIZjR8EtjsCuLSOmpftjGzRSurvtlQHxIvYO99maDoOsT9
	Hqtxtat30LyrGx57WaaIC81D/ZE/QxBA8DqLc1U4kms5OylBlA0Be2/XHDth3vHi3fS9WuWTfah
	RaZFDW2X4ydLd8PlpbcnI+ZstABIL8GqEHwGHQA3ryClPShydSzdreb7QR3e1gDYbGjKA0PgGKe
	mkxTy2tq0aGpmsaP9IJ+zJGtKwNjeXIt3ujMP5NNzmxayNnTidRpQzRLpyOjL9sxhoszH6hAJZI
	5atCF8mVVC6IgIatzD0Gtl8vJrfLdqpVHnjjubbP/0eKCAXYAuPlD5BPXbCBs1a8SGnIBD4E32A
	YrDe5eddQh3IJ2DEvSIze491/wlBoOwL1PW9B2pvLU2Nu6DkCQ/cArHnZy+i7NM2K6j+oG677ki
	rSAvhYrf/in8BEwUgSWoQSuZRoaTxuZg+B1hOJyqwu7thx3KsRDz/+Lskd8NyxROkMXHtxE77uK
	RsB5UxxkUBZRSnbEr6UxtTHgkSa8liuxz2DVac4iRuBSdXDKUMHH/FJ9Ix3MPn0emEJpWlxlMsc
	CgNxYYGLTF24jlN4J6QbuqL0tDpcsnMzy1sT+VH+UfPqNxbopuvOggLQ==
X-Received: by 2002:a05:6830:34a8:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f501a3163mr2198462a34.0.1794196277001;
        Sun, 08 Nov 2026 19:51:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:13 -0700
Subject: [PATCH v10 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-4-e6227ddb95b1@gmail.com>
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
X-CRM114-CacheID: sfid-20261108_195117_904249_C95D6E4C 
X-CRM114-Status: GOOD (  14.49  )
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

disable_irq_nosync() masks the UART interrupt without waiting for a
running handler. That handler can have observed up->dma and continue
using it while shutdown releases the DMA channels and clears the pointer.
Synchronizing the IRQ later in serial core does not protect those accesses.

Publish the DMA shutdown gate under the port lock before the final RX
flush and interrupt masking. Have DMA IRQ handling check the same gate
under the lock, so a queued interrupt cannot restart receive processing
after the final flush.

Drain the UART IRQ outside the port lock before releasing DMA state.
The lock excludes competing RX processing during the flush, while
disable_irq() also waits for a handler that observed up->dma before
acquiring the lock.

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 5e114dd8f9bf..51013dd2d851 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,10 +771,6 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -782,13 +778,16 @@ static void omap_8250_shutdown(struct uart_port *port)
 
 	/* Synchronize UART_IER access against the console. */
 	scoped_guard(uart_port_lock_irq, port) {
-		if (up->dma)
+		if (up->dma) {
 			up->dma->shutting_down = true;
+			omap_8250_rx_dma_flush(up);
+		}
 		up->ier = 0;
 		serial_out(up, UART_IER, 0);
 	}
 
-	disable_irq_nosync(port->irq);
+	/* An in-flight handler may still be using up->dma. */
+	disable_irq(port->irq);
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1329,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
 	uart_port_lock(port);
 
+	if (up->dma->shutting_down) {
+		uart_port_unlock(port);
+		return IRQ_HANDLED;
+	}
+
 	status = serial_port_in(port, UART_LSR);
 
 	if ((iir & 0x3f) != UART_IIR_THRI) {

-- 
2.53.0


