Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C953A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4YY8uirI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yp5rf01q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=; b=4YY8uirIQs/VRP
	lIM2KZn86aeawz5niLcVHYmvQqvqiHMfdpe6V1k2VXm0bt/mI1ohJKFWkZDKKcNRPCC1EUHZdYsQB
	71ALrXk9WGBZyb4d0LXvJr0cfvMfU1SIyyoVX325+Ht1m6YuufalpTddM5idYFPt6iNR1cfMVQdRK
	bp4lgLqeXf2haFqwHpXIGY4sMyNM5Ym6c/hoAa6b/s1dO5sKiTPpcNJUXLn9iB6QQ8KIYQKh2NpWL
	AffvhcnAwNfIHLZwqiil+9IPM4xSfhvsbmcZJD7vDyR/PygQcdTbDIRAsP0j3rQ7bcLmrlLpyyyxn
	o9xS5vkLKqz54IGjYxIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQd2I-00000002Ksl-2xi4;
	Tue, 10 Nov 2026 04:00:42 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQd2F-00000002KqC-1brF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:00:40 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-85a5455bd3cso874796a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283238; x=1794888038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=Yp5rf01qCFZZDhDZZV8p1ttcqBDGAfwTYvLl0IgFl54YgWGguWIX2OFw3Tc6+BIz+x
         qSOc7Za5QJ93CIIiKesAeiirPJhfWrVrPfc82ApCqH35gNevc1ddL3GvuQLA2dBaxId6
         xjcwj63EFiQwU24ABQ9/WD/Sw4rZFQsGAKv82MEeOjSjjKh+LF9oEtVC+fn8EvyY2IlW
         dJkK35d+KDdJOJlUl26VZ6WhHCFuPJBwa9ZS+/NOQoh00Q02SCrxpYaQYjn6NwT/XZ6Q
         hJGGlMdV/2FqqV0VFp2p3fufvlSH41uMYDJheLWeCH/0yy3SvWrgZrdWAvf1UrzpY+ty
         qw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283238; x=1794888038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=Yd5PsdEGwvEqRhRV+xivQMXEYS0i6tpa0r3LuT7RgQDp2Cr1OnF45LsMDe4WoD4L93
         3J3EEH3I37FZ7IxrRzvuNGO3RxW+15wmEppttHq0u6Ulr01Zpmrz5Yp9gRG4GkpSpHup
         GvwkigsSRt75bRYka21Hm7651UcscKzTi709qbuapSxpaPlH9++viLs95msNraWurpl/
         hSSPBvfPQjEuB5TYnbG3sTBu/XMJgay2GquFDl48B4xfZYpxw61Pn0HIOOVoj0Q3kOjn
         r6II9T0WZ4vPzcUKcczgAxeBb4GMgLxjacJjM+/iQIOOrAaiQMhdPXztWEov2kk07wCB
         FvTQ==
X-Forwarded-Encrypted: i=1; AL+hErGuSxs7GAjJ+9M9INrnzYeAHQNnUO53asBHnF9i7muxknjUOSIgntkm74plex5X1ZjSFvGUdOJUwVd8MwVRhMiz@lists.infradead.org
X-Gm-Message-State: APuU4Z83tDar4bJHxAEBCJ0Xxm7eo4nby9kYXwEbEul06AccUb+dyf3W
	ZMYk+CYT+2I5jUOG3nK8j/P9JUyXZsV2DaFvrx8uSaFkll7XLFzFNZtx
X-Gm-Gg: AYBFou2SpIH464h33YqqfNGzfhh0SQkjNvNuPxvmnthPO83xWfLwLV6LX5BLZsLhLUa
	ofHajNc2WcqTEhWv4T7v2ckHBsEzjymX6lUbDWakjtNJUBaxhjct+s+C6DcU7XuhX1AflWLafvO
	+6ncfS/nXcDhedzgnlSjMG+z0WIcbfGq49gkMtHYhu0QsrMJhTDlERBkPgEfEM1A8QgocqYOQu1
	5FBIn6+MbDnXtJaJuVmf3trVFXGMjBJBo9mbeg0RIns4KI4FB+laq33L32ThVktW16y2vhbp20p
	+3PR5NOU9g+XdzrchSbJYeLKcsSK+BFcwvDlL+D3wMZHoi0S3kZD8EheJjQzeedWPfMP+EPbiNB
	hF3R/rBTktS5VosCk1OxJOu3lh4CcWoc8RIrBN5SVQZQCxbwUoPN1cBC7Vo4SVO2udDTh9PeBZE
	92xc0OkWerz0fjYXTRrzpsyhr0NE7LY0AxJZ6tekRnvjjuzn3XRGbHpRY/Z0J5Cb+/U5dKIRJkC
	J0w2yozval//vjroS059MZhdZi0tvCQ2miwGJXUL1Ef5aajcx9ZyDGsaL1yhVU32XhwH3EVp2Ac
	iSCpaNCxDr5ujIBanV1QGdhU495FCwluUvwEOlib7kXTOTIsscogjYD1T0cWHqFkJBDfy3Dbb8v
	qqB9zBABJ24MP6GF/4SVXWUppdSuySP68wFRyTHctUVncKcXDQfpO6HU/hwK0bh87HYH9nJOfEd
	lxnswkRIULqa1UphjT0+yUyYdQ9eoM9O1N2ivrcODAlv4f5Sfn2IY=
X-Received: by 2002:a05:6830:2693:b0:843:cc20:9d03 with SMTP id 46e09a7af769-860dc70cd38mr1124080a34.6.1794283238334;
        Mon, 09 Nov 2026 20:00:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:18 -0700
Subject: [PATCH v11 3/8] serial: 8250_omap: serialize RX DMA completion and
 flushing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-3-6364edca63d6@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_200039_438803_78837028 
X-CRM114-Status: GOOD (  14.16  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Moving RX DMA locking out of __dma_rx_do_complete() left the DMA
completion callback calling it without rx_dma_lock. Shutdown and runtime
suspend flush RX under rx_dma_lock but without the port lock, allowing
these paths to overlap the callback's buffer accounting and flip-buffer
insertion. RX submission and UART interrupt handling also require the
port lock.

Take rx_dma_lock inside the port lock in the completion callback. Hold
the port lock around the shutdown and runtime-suspend flushes, matching
the existing interrupt-path lock order. Assert both locks in the common
completion helper and the port lock at the flush entry point.

Fixes: 789898416749 ("serial: 8250: 8250_omap: Move locking out from __dma_rx_do_complete()")
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index b6f108d34854..5e114dd8f9bf 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,8 +771,10 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma)
+	if (up->dma) {
+		guard(uart_port_lock_irq)(port);
 		omap_8250_rx_dma_flush(up);
+	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -898,7 +900,7 @@ static int omap8250_rs485_config(struct uart_port *port,
 #ifdef CONFIG_SERIAL_8250_DMA
 static int omap_8250_rx_dma(struct uart_8250_port *p);
 
-/* Must be called while priv->rx_dma_lock is held */
+/* Context: port lock and priv->rx_dma_lock held. */
 static void __dma_rx_do_complete(struct uart_8250_port *p)
 {
 	struct uart_8250_dma    *dma = p->dma;
@@ -911,6 +913,9 @@ static void __dma_rx_do_complete(struct uart_8250_port *p)
 	int			ret;
 	u32			reg;
 
+	lockdep_assert_held_once(&p->port.lock);
+	lockdep_assert_held_once(&priv->rx_dma_lock);
+
 	if (!dma->rx_running)
 		goto out;
 
@@ -977,7 +982,8 @@ static void __dma_rx_complete(void *param)
 	if (dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state) != DMA_COMPLETE)
 		return;
 
-	__dma_rx_do_complete(p);
+	scoped_guard(spinlock, &priv->rx_dma_lock)
+		__dma_rx_do_complete(p);
 	if (priv->throttled)
 		return;
 
@@ -995,6 +1001,8 @@ static void omap_8250_rx_dma_flush(struct uart_8250_port *p)
 	unsigned long		flags;
 	int ret;
 
+	lockdep_assert_held_once(&p->port.lock);
+
 	spin_lock_irqsave(&priv->rx_dma_lock, flags);
 
 	if (!dma->rx_running) {
@@ -1811,8 +1819,10 @@ static int omap8250_runtime_suspend(struct device *dev)
 		}
 	}
 
-	if (up && up->dma && up->dma->rxchan)
+	if (up && up->dma && up->dma->rxchan) {
+		guard(uart_port_lock_irqsave)(&up->port);
 		omap_8250_rx_dma_flush(up);
+	}
 
 	priv->latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
 	schedule_work(&priv->qos_work);

-- 
2.53.0


