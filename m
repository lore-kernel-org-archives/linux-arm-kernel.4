Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D3606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dBpck4q8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtI95UzO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=; b=dBpck4q8Tq/AAg
	5Gl0z6e3gM+P15g1eD7E2hXYnH8mAFw32y3vCwKlRi4HUUgZxw+MC6PNmT+jAMbYfT9LIpKXuSiSp
	snP5/TtMPfma0lTGalZJvR8HHQNBtKtmDJOP633JGO/FZ70I5ymPCwSP3p69C8qoxrbtHhvOPIG+B
	Gi3BC7hK8eCunyMIy4QjBUAqXXQtnlye1eC02bgaDFobCApESOhU/TJi0ptsLz534fswBY6m9BbzN
	e/o4YmGZExX6vk84rXJd8ZzQlyGCOBDI6GkfUzbc12sw1dMrzNXWJXyLs3CiAbE4c14LTcCF//fLh
	KKy72dNQVzqbc4yx/sMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnyU-0000000CGU7-25fn;
	Fri, 13 Nov 2026 09:53:38 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnyN-0000000CGQk-1LOi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:53:32 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-4adba7b3399so246889fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 01:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563610; x=1795168410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=FtI95UzOCpFeMEXo6E23QG4GwgBjvb5IL8ZT2+p+lHG1+gtxkfWFQbdSxGNujDuE4r
         Jt30S7l5sRg06qCnA0eQTy60XJ87pW/VgfIZyjUwVYxhf5jZSwOtwAjrIbsH+xSgldQW
         TmCTkTqosJOB4vt4Yzkm6s/QRPB8Ixiv/X+vgEYKBNm1O6rz29p+djD/m134/1Ivr/WY
         knSqzAYzB6xMlK+0TdS2H2c4hRlkQ6TQBktDj/uhsgeEVmloMcL8vyY68Lo/T9OybIVk
         a2mFxQLJJ/q2No/GzmjvK7fZZs5e3LFRhFpELy8fYvEdcfnjU4c3HUvrQyX/fmxSsbV4
         4dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563610; x=1795168410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=v1T8InotPHByfzd0c3kbj4brcGvFrITvT0rW8HdGQ76LpNuhcAH3qkTzE4cWCRjh8K
         Xi9icAg5RdeDF3/t/VQIktUmxpTf/4Kwsja6eexoblWurPlqXo6HrIEs8O8o74epNdhL
         SSYI0IAYlbSrZ8qhgXbkoY5LjW07GzQAHCJoulkn0cxXwDn80LoFdgIoOpc6CzpidiZP
         q3eDPmuAQNf1cXObja3hw6tKUxnly/syu2K4opGdVhKvMgH8ci7DqARvoaOO5CfVT8GZ
         W5B28D5W3xBK3Fa9XeAcx88IiVmxCSbgMxysKZjA0p7NQJAGVMGq8VJndzoCxpN552Hc
         Ih1A==
X-Forwarded-Encrypted: i=1; AL+hErFbG3UAoBAh5J/scbjl5S+BZPBZKS3uJwgEmirtGSPYMCvqScvz82baZEhN0VoMu4827JWpHo3fN5RsW0Ojmffa@lists.infradead.org
X-Gm-Message-State: APuU4Z94eE2MNhUoFP/VBqsXFwm2HtYUagm0QRbeLgpU0pUEqR6wfz56
	d6RLQoKo3f6i0R2ncZlPqw8SS4zU1JM7Ms8VYlww3soEjYJi4lSYB8FM
X-Gm-Gg: AYBFou3v/ufWewf0+F2cPamAVNTrxAh7OBjQUGLWyl1O8Fd4vHR3tm+7PoZ74AlRM+Y
	rVjHwBbspOLhFHymoGCE+rbTGInb2obKWoKW9Uzwn1Bpo91Z6vDNDnfxFuqWAncHKffQ2KL/ibF
	B56dWzvvTpBnMRXkV3roGJ0wEi7CFvGSNc+MxZ/+/d5ld3i2C18jmBW1cc96WWiFTtmWh1vSyTT
	t1kgxruJU/XFRymjhQ+nEMa/92KcQ3BUl0AQf3C5knORw8NQw4EeIEaDCAcacHN1TXX9kRP7kQf
	det64OI6MMKdqtuf59xZyNzf/3pbwAtsMYW9m49XvcVCZcuQiOHEwZkMaWWDgBPk20D4bK8SDOD
	mpJdxX9MfShyA+RwPvmewvf1VaHtmC+lTtTZGMc58AYOObs+5nusRynFkXptgc1VimCLRWu1uv1
	MQWSmbMmHQEYqTPXKegSAssGyUPwZxKwdLsE6RXgSokOfV5n+azvoTtoc6KykCmhX7oX4lavpWy
	pbyyPX8HPLn8vdFu5bdzYzUTjxS84NrLoQm8N75tuG9OU/JMOLlbdPWrvkdkQPv8YmRC77XX87F
	d7Zo6UymuCs7btMgKKS6qlMM1UfOleiMvyNgkYcuRHt8ZnI7EFf1ocVpvRUWYXqufkq5JslTcHV
	HmP+5JBm5hnv9lSxwtFzuSJERhL/jorOXCe6OXJTCeqoy4aXQ6Ar4SjbHMJge7Ew13nVGnLi2Ql
	YUs9w4Tkas08ecjqrlYEeLLowrRGewBX7M7U1mY+0lvh0nmBDiVEgC9Gli/g+Wa9265qt+R/TKp
	Q==
X-Received: by 2002:a05:6808:2207:b0:568:c71:5338 with SMTP id 5614622812f47-56e63ba982emr1490761b6e.18.1794563609933;
        Fri, 13 Nov 2026 01:53:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:17 -0700
Subject: [PATCH v13 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-4-b857f2617ece@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_015331_388167_C38C74C9 
X-CRM114-Status: GOOD (  15.08  )
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

Clear EFR2 after draining the IRQ so an in-flight handler cannot restore
TIMEOUT_BEHAVE after shutdown has cleared it. This also waits for the PIO
timeout workaround, which updates EFR2 outside the port lock.

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Closes: https://lore.kernel.org/r/sashiko-outbox-206203@kernel.org/
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 5e114dd8f9bf..f1980c15f85a 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,24 +771,24 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
-	if (priv->habit & UART_HAS_EFR2)
-		serial_out(up, UART_OMAP_EFR2, 0x0);
 
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
+
+	if (priv->habit & UART_HAS_EFR2)
+		serial_out(up, UART_OMAP_EFR2, 0x0);
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1330,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
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


