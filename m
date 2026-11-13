Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEAC606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0dJINoDK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=myq547si
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=; b=0dJINoDKEU/ttJ
	6AADunMQurqxA5AVh9gUfQKtEXkwKK9OIs7ILbFn9nljgd43Yqn3t0H0AlDVVCRJb90Fyxu2iYjUe
	U3MgmYSlkTi+goJTYZuFnUeJQgFruQJ/nmUSE9koOTSkdfN4LwLyzmDAtjevJFdBm5DPjs9JW8NMG
	CBALilVRTKp5z8I9gKpTo7BKD81lZAQ3JMadgXlkx+IaE/z6j217Jgc98C/HsgcPN5T5b+PX+xLn9
	GQzQurOWBVcZ1lXskQ/jicf2VGXE85ca34geV9GPvEbM5dI0KDKC3nOUWRQxIK++GJROZSx037tAA
	1O5w+P42P5PWCq52FoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnyU-0000000CGTx-1aUd;
	Fri, 13 Nov 2026 09:53:38 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnyL-0000000CGPl-14kh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:53:30 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-55651e7de9bso831772b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 01:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563608; x=1795168408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=myq547sip2yhWa74ZcJbNyoKBz2Z0zh3OHJK/jgD+9S2lifcluwjYypK+I34XamlCN
         W69XfWmRSIr8+GohhyH+xxvTJPLXwcZgGOgAn/W7eSUwMGG/mQbwDplg3laLMgLqhFlA
         9p6ndWGORdZeRvW0hzE2kzWihMlCJEhsatxSv3AUc47IGKdZYgxP1O2iASEQaqPf7cen
         IxojY4DVhrQg3F+Yj3YhTLdh33zL/u9YPIwq4UmIRZUGii14AJfygajaisUnGA53JTU2
         HQ23HHNGu3+6/FDjVsu7UCPa1p5mGDLdphFzoYFSRhCNNJoCp66bFhREcPtE7sDF14hC
         qGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563608; x=1795168408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=eQ9bUyvyggZYvfmJOQMyHJEMI2o5IuSEErTKpYSNpqYSuxeWqXXDo8PLW6trwtz0Py
         Js6Zolb9X62zjIOZIF74NzRt6y7N7aQ4hePVLHAAStsl6Na+iADOLURArxaUI/C+xv7U
         plGRLBxslgAcXGucF/mf8vmRp7fctzYtt2NRQqhbQaIAvNCcroObnJlv1n7+Czcnts/g
         Kpr1aTKqsZSv1uFYXSQZEPSnO6tgEsF7LeGTHa0D4eHZ5rlkpxQTtCCjWGeZd82NlrjR
         uKDYBUUDu/A3UsUe86nV0ynTyS6p/eYR0kuUQgjiSKn+IhNPbseMp5AnkcxqhJpWqdrJ
         oflw==
X-Forwarded-Encrypted: i=1; AL+hErE9TFtAezquZqUwdFl9a5qoMbam2XAC8OYbWuo28bzEjXnL23HRp2xP8ZyOxAqfSbqR/OI4Le1al44BOVtzsr/y@lists.infradead.org
X-Gm-Message-State: APuU4Z/30u+yp39wDNm4CxEaeLJkhXxrHcXwM8qHub3f88vOMPNQIv3a
	hXA6Ckq3joe8oYbGTX7FPR74diXqDRgJPvF8pBbMi7Of6ZYRdmLgvQPa
X-Gm-Gg: AYBFou2nPtcDSSpvxvh472kEzNkkq3hZ9KIhV2yCujU2IOLeLZ/zjJw2piNuWmAkrYF
	VVLpGMNYjVbwBlFkHg/kiwpJ+LulKVy3QHPsJ2I5oQnLkE+T4no6MSY+zJIPpc0A73KSaOIlF4A
	wtVDRp+NGHi7xH0MDPSgx1XJBjuAbdLENLFUfGNCl241eJ91NlflKA2Vap2eeypO87ZN9Wahsy8
	H39jLm0jh7gC75jCbn7MaDGpq3rF1dzwkEZq99QCkHYI5U1J/QcZIo82mS00DPE6ka1F/lib865
	4nQHNdCtKba4N0sf2Qt6Ug4L7vPPvZ6dmrusE/3pE0DvXVYWx8qiWfapvKVx1Qshso6OswLZhrS
	IiK31xcKhEMsbiR0okYXNXpvb6sOF6r2NaUiTtRn6IVbCzzEvQVp6n0UDp46tQ3WqmfV5e0+9N3
	qVTWkGiyEEf5dykfQF2EMSgFAudEVqmBugMpRdS1kFID3BGBy19K741pvn/6BTQz2bNl/hQsCv5
	Xh2nHYGpl1kuy+EkaGG2tyOP7/eJNLaP3th9QD4Zs+IXGPSSPoqcCYKRS8U8CZ9s++bPGdB1buL
	5psN8/jzxeEep+TROnxnlwPenh3ch9PqIYai/dg5FNaYdPgPbtWDO1SR3hQ41F2czPNyUSpaBYK
	XrJdPQUUAec8NQtAzZLH7j4Uc4XhPPCp8KN3FiyJaOEmQ6Kd10h83Wvnh0U/fBLK9E5dUIReefR
	FXAkEriI29eI0IWz1v5H+EnEeP8W6px3NXQ1GH1lWh3Nk1VT9cv5U=
X-Received: by 2002:a05:6808:2220:b0:4b3:7549:d3c0 with SMTP id 5614622812f47-56e648e778dmr1355898b6e.18.1794563608017;
        Fri, 13 Nov 2026 01:53:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:16 -0700
Subject: [PATCH v13 3/8] serial: 8250_omap: serialize RX DMA completion and
 flushing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-3-b857f2617ece@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_015329_334289_3C575341 
X-CRM114-Status: GOOD (  13.69  )
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


