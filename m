Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860660A263D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E+dUGHWt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gk4OmyjL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=; b=E+dUGHWt4tuKra
	iiPOrnwbeZn880nOm/rfyswBb6fPhJiVY6cifa+gTArGITcaGJF5ejpX41pHjxvei/yGDAx1BxV5s
	NMIfWH/i9o82f7lFGNytIg22LfRvUGXbCXdyx1d0UZGtSVNs+91nHinAsG+InMViPvK8Es++3D/Al
	g+Y/4Gm5eAbCimJ1DqW0wjvspqOQYtjHCg8GNPu3L6CCnchoaTgVUegajaQMR10FDfnNxnJATqc+J
	YcdRBt8KZ6GrIfAdSkI7XiVBbG3tDJ/PDDKiO1aaLsMEbP/hLRbbiuhS4JF33ag0/5I+Gl3u6zSzm
	St8F3MW/2DSwaKDOuwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQd2R-00000002KzT-3qjx;
	Tue, 10 Nov 2026 04:00:51 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQd2H-00000002Kqx-01Iv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:00:42 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-717034b331dso916822eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283240; x=1794888040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=Gk4OmyjLhO6QkmL4rrLHqCpYl+kQlPfDB07jMD56Jm2qzLhxTfUWiGYGipma+FpcOt
         5mw4kZHfbddGyJReqe3Wl/bud+tQA4b13JIkfMOih4jbwwta4H1hWrtdf3/P4+AvveYL
         7AX1tXY0XFm/9B5/2ovdskWvQ2JCifkEjUmeNtqKXrSDh9bRpQss5rrk+FbCPCW3hDFb
         UR5FSmJkG+bwKzjI8E/4g1G0Z49IqBK1r0O9yY9Fcx6hCpgoSlvXqVFsMS3neMqlifsW
         joAXefXhvQzMV0eVvj6e5x+K1O5KhXQB1xDAfNUawYIBzAI91ILhPCsSq4MP7BWv+NfR
         pAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283240; x=1794888040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=HPWBSC7hpoTMkH2HPGYOPZIXRsK6YNLTi8+3rkpcBJrAgPz37lXCbOM5ovfPgquPcn
         b5nHl5QLdLYgepYCRwBQL+3l/jjQzzMBDa2uVuVPQjokB1RIMHtbA173Vs7tLlkZuguV
         +ZEb9cNxMUVPnBWxnX4aEYHJQNJaDacWKoyhZ2Zmqv5imFHa25Ix9B7m6NU7g7TOPBXe
         gpebe0wqT2b7cznkKWAwIA6jsCX8b8F+jvwcBFGUH3ndJ3Iv3JBfpVK+LrRR6pov4Z6H
         MgvZ4tkcy6/e0N5O33m5esN+NXq8ST7l7Tc+a2jAsDNyigG26Sw8Amgk+O6xtNYQH96V
         Tbzg==
X-Forwarded-Encrypted: i=1; AL+hErFLDKWchPyS9c1vfcowSjUENwsTFzzuuJCCIKNBN8mB1bcJq2HoEqZjLvoRLCNBBfQ6mebs6q4D+dsRhzy08NQs@lists.infradead.org
X-Gm-Message-State: APuU4Z81kQvR+Tkerktj/LIHGpEKRTLy22eD3WpnaaSBw4VRE2EKxA7U
	znuvTIkVod8wMjsvEj0CA9S9emoD7UfKWmxwytt+Ks72vsb10AIrrGzW
X-Gm-Gg: AYBFou0W0XFQrmCngIDQjsqsTMvZ7ZdAxtBk365sibCOzeUJO2nom6odANxzXjCRgqf
	TjoOGSs5AuSBEkZaHLWu86lIVKFwsdBMUxmLnJExKhBccZ5S5HuHtLwC0TMW90kCrjY5EXZcnBh
	5s+MhT2UZAELK0vj2i8TUxTDoy4mhjnRBTx+L0l4A/0IeZHMbcFGsyLtSKYLMSZUOnS+feFoCHN
	NFDlAOsyurmeyzsCmOIIjyK3E9dF+nZUFO/lk2CPIRgy8zNC1K2fe6JRTr+o3DHb8VL7PzIzDib
	TKslCkXFivU1fSb1a+QZgyviwBh54FGJfXfDMHcD1uly54g7bsE6flv3ZNPSGtMqAgulS6WaZqJ
	cdnboIH69NoM4Ej6iSIh7c/qjLK3WlDHIB3mQQYJvylpC7fujAG68TDORi9QkT7ou9H5aHMxpXg
	Loq87zo9MoScjC0200pY4nKlZy/+aJ9dqu9zW7c/0Rg6qDx4x63aXuXRx4SPtvxbOLFhMjuZpcI
	M77QF8E063z6iTS3FBob4uTJgjJh11MPuVJveBI49D7+XFG9GzpLdpy6I8Kp/c+U6/51LB7cP0A
	l8Ye+UZac/10LkIFSMFoP82HiKvrA1vhGo3HSZCdNUsVZ07XZPq552iEWF8ZukTYsyBVUHonHLc
	APgQCVUqnOX6T9NzGZ7ySa+6VYQ6MPboUP8QQGXBWzIVEQcLnEuOEyeklTlupTlPpwJ1hyU61Mm
	ddKAaPLVfz6dWuO+DCSDDLWrY1yveqfAd/FqFXlXnzKiERn+H4O8BTXjIxwhpWG9CqbukELPho
X-Received: by 2002:a05:6820:f02a:b0:703:3ff5:ddc4 with SMTP id 006d021491bc7-718a188120cmr678015eaf.11.1794283239825;
        Mon, 09 Nov 2026 20:00:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:19 -0700
Subject: [PATCH v11 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-4-6364edca63d6@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_200041_056729_18BBF9A5 
X-CRM114-Status: GOOD (  14.66  )
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


