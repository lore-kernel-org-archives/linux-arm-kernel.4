Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D017606A8A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Svmhgt6C;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uJW2vm2q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=; b=Svmhgt6C/NSmEE
	ZZ3lpfEE+s+xCpELDuIZTnK8mVhgpxZtp9CYmqGX5Sy36ABdL3ie/gEiPdcYK7NuEVMKL2LFm/GhU
	wVFYV0WE4W9t84IJdGiU7M5CFs5urXx5upPLtxMXi2jx/O97JYmwhjVY3nCjUSoziWdpAOSLFIR5k
	PqSLjTWDfSK4vRP5zV7HnmGTjpvatwnuaaZM17k8FA3p0XDZnrdbiC/souhANvNmY4a7GF7Yj5Y+E
	IqwlHUxPbYi1ffhrAFPHb/r5R9Y51Tqm2cgP8GPumyD136jOkPC5gbGB2IK7ZkqiMKE5oogricNnT
	w3C6v31MhWqGF0ac2Bwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcV-00000007uyC-0trO;
	Wed, 11 Nov 2026 22:16:43 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcQ-00000007uut-388O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:16:39 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4b28d7c729fso2327631b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435398; x=1795040198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=uJW2vm2qO3qghreHdML0Dvxd6ShGCdDH+6wduM1NZvL4HrdJfuA3VPbkUMfoGEuQhY
         jXMGqwC3U+8PCYjiuLTe4QIaQOqubXj3lg4wgR0ZFqq4cuOdpR1g2+2s9+kTrgvix5Kt
         QAUgNNU0EFOJlIcS8msVrlp20cI5Rb8kH1yxdsXsFNv9qx5Y2GATCyPvhVblx61N66Wb
         95I9ru+jiN/iiKjpYC5bDuv+j4BahyLYMNe8PK+ZRRi3Hla9p+nygFrS7Kb7ODF/SlDK
         7S9qw/TxNrvMV8b2gznzES5Bi7QmG35un/GTfH7Jsd0u62NpKuLkimxm7YkxFZ6UAIlC
         T1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435398; x=1795040198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=QuHR4dd43o5392quvMyqEPEnoLx9VX1/IZV/r+pwQT6nueXpKQ8VLEjN3T/+xBih/w
         yPijS2B9KhtGqciTDc0680fLT77jDRcWb1GbWA1yWsAE0x3dGtw+YkE1xiYG6XiIBCrZ
         PbxA+SOMBpWqCWWNzWHJNxmSecOnUVkN0tLi1tbjxNIFL7ZhxNd185yNjDM8p25hkKYn
         U1rs3CN9jIAE/2mcz3v9z4G7jD6hbLlOAyp4o/wdHnv3Jnvc4khN9UxzkK/oTvqDwPM0
         ElfNHvFdxHi49nyM0wYuTJXf5L1vQpdEYp5BXo4vU18Jrju/8p5RNsP6avOqN4V+w7tT
         wz0g==
X-Forwarded-Encrypted: i=1; AL+hErHeaA+X7a+UHeqHS/jYzp/Pkw5dUAopCpOIXvfYYNyBXoobvWELfs3lvYU14JoYB28MA4S7nl89cU9PtSpGiRGp@lists.infradead.org
X-Gm-Message-State: APuU4Z8vaRKXxBvqf8aZu/kw7f50BOirU5WLfr+6SXBnJJ9YdkaZcYwl
	O0ofaaSC58KDRbTMDygNKDZ2wpbjUwFgXySK5UBtPIS+/b0GYRZ+DCo8
X-Gm-Gg: AYBFou1KrVLTG7w1+CvumpGjRglHu+lUDGay6/q8EhkadixgTsNByt8uVLxBS15ZBpm
	4JPJT1VfuL2GJtmS3mEOGb3MBkf1DSwAEAUOQoRUkSx4uNNKYeT/h/BzRb8SvaBwJlN4dfM0G/d
	PnyKDbiuocuVLlST4voQzas940IUZHEWuAV5QMmN3xZflBXSunqTnZMJswwYHc/nr1ilWR9QwaI
	QjQQduI7iNwxpYI61taRSfYJBcicI8zHxUTYv9zLoko/NNAFq0l/SLrlQjXXQzBdQoKTpEz3OFc
	GHMohGC9yXvDesH/crzvsJoyZeeuDZOIB778h7CfYHeZBFj/XLIp1e/njS/6yP+TjE9Sqt4o3KS
	oaPOeC5Kc1pPClXdgdamJfRpapJYG/6uh+WfTDS/uy/3AtYYGyLs71vHX2xGMwNUm0qEaiDs35N
	brVr6fk1u4w+aV1oY+SA2RqV5zt/7NPGNM3SYuTFcfFbyScniWTMZ+CxFb/H8pp5+vE5oq+HLNh
	kWkwaujKEOaQ2vBkUPA90Ecs8uyBcy1F0IbMXP9RM3UHcq2dNgV5PlNSk9xUPqRW7NzhDsrKAQS
	FMymw5MjKuikHsM6qobsRW0lbUaGmsypDNNXoBR/LZ6pUTtukWipxjj2C8yCy7pz8XOk8xyFfOS
	mNMZfYFi6P+kjA+3qTgvjECHNhobDqcyebkbf7ctPRQILex/fypB5SRngb59pcOukeP2ppJ0hhJ
	+5v2mKSnY8YytZE3+wJu1lgSin5JbjURoL6rD4CXfUYkeswVwARWA=
X-Received: by 2002:a05:6808:1a01:b0:4d6:92d4:c806 with SMTP id 5614622812f47-56b987289b0mr3147119b6e.62.1794435397786;
        Wed, 11 Nov 2026 14:16:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:28 -0700
Subject: [PATCH v12 3/8] serial: 8250_omap: serialize RX DMA completion and
 flushing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-3-9e3456bc2555@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_141638_806650_C5DA5A23 
X-CRM114-Status: GOOD (  13.82  )
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


