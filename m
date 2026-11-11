Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51C606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S2/Uq6ZU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ek9Ov7Az
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=; b=S2/Uq6ZUJN/f3R
	Je5XnqWG8qnGTRuWp8KQDQ+f5WaysMHYflyKhR6if4UyZFicd4mRf/FCk0u4xURvPFqd0bMECm4Uc
	EBxKuCGOPHvhR8gbq6XZ6oCYZgDLMNRky77gZRnL11dRuy7neQ+VnQ7t25/PTQ6VuA07+5r/4vyGn
	ul8fRGRrAkfthToIEHuG4sqGrDFwGhwC2iVK2N1SaIQN3nHTEtZaZO7+yturF0lfpZ0oEeaP9ksNM
	NlBz+9HSrRqXJArER8yFlLrd9tplNRZJ6RYQIEAY0hGiNu36NEjZNa+0kA9NvW63dNZULC79k2khk
	NPkipVEHJf+006H+10Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcV-00000007uyi-1iBI;
	Wed, 11 Nov 2026 22:16:43 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcR-00000007uvw-4BH6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:16:41 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4adae187d94so2294655fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435399; x=1795040199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=ek9Ov7AzR/4aO4ClW3RB7cGcNNzakgfw/5e7Iq8CcMbF/6L+QtBhWHIQj3uvlZWZ0j
         zxVp69pA4D/r5M24JjilOY40VkKm9pwA+Fqq2zqPLDrlAUFnO/APvATMUyqWTChm6sBc
         hh8MyAqP9w1eIUuuIBRjpjettuAKA1iHsTEgTi0Y7DEWERH0ck3RDJlrU02kC+Th643z
         Nh6qeaJJsigfJd7XU9r6xsmfFE72swBJsaE/MQSARblxvHW9/SEl4+UgT/bb4jkRj5pC
         2WwfFGVvdteD7t534efz/a4q8SMpy3DBobVUVtDaBKRJh9amh006xyQxvikcsBz2ZRGX
         VmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435399; x=1795040199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=u/dpjTe4R/6jOpwNd0IA36+3sPAsQj5m+J7kFYt60uc4Srh0rxPjJGFPQGNrha61RS
         /xbQR87Hqezq4DmPMuqw58eKenxDM04wxqo2YBIYmLS/qBtboCh+kFAASXYm45tsOPeD
         w/dwUoSHb8FhVzg6x9Mu9tl+G7HP1WZe6YrkgOxMXjU7fxFuT1hCo7U0RODUVAgR5+9p
         OC4sE7MJNyHEHXlFENLd3YK7+4QoXDkdOanFW1Ifv3Qo7lqPocQBV2nnNLSpS5l7nSrr
         qJDioYFMy8L16burORkcDlrpKDSqIyFaqhspXuEBsL0rtqSiD0Ui+1h4r5a19aCYIDQR
         aJ4A==
X-Forwarded-Encrypted: i=1; AL+hErG3osBQTSPLT9iUvPmE9oBM/U6R09c8A0+PeLoWwDzhKKZah0UXww4me7To8vTfwA5OC8NK7COHzvKVLCPUbYlN@lists.infradead.org
X-Gm-Message-State: APuU4Z/IBmGHnAE5XYMAoMIx7aX49ORvbHzlfaCsP9nV7AcbwA4ArBKx
	SwG8mp6y1aVHzFCKAFdm/+gVIyXmLh2Ewt/Xe6J4XXBRUQo78yHqO+uG
X-Gm-Gg: AYBFou0s1prJQ3mEMTVR8eXlzQq30T0LC+F/fRNGPgkOp32EZY0DfTYTgx1DAkIfW3q
	rNJ3a4coVlUFbgEw1YL56l4UMvYSPIEGHVgOcF7TnJAi2BV5BUDo6VDf/CTFUXPWt/JQyIfRcqr
	d1RrUAjDzNRVXZQqntCjVLhQcxnoLyGT/PgRabHh2R8T40dlHievTU86ea8xPOwnY8mPoWLI1pY
	L3qiJ1mz6fu8rYP1WhLsenpbFJsVZ+Mr/kXXXEzBYWz0bXNnD4nBmP8Js6SEmeuDshNImw16Hjz
	rtt2YJLk2qSX1blauJJq41da0pwZoPVXfErMknrdsd41F8athu8FUHaSUm4283whBOht9Sc8M71
	wS+4yt4UYckfKBfYO9yUTBviclanSJdJcOOVlcRfSfR5YG31o8dpmI6cVARUMFXhKInyTVKEB+Q
	cQr82MIEWUm7+F0odWRPKJaQYD0quBHZa5MuOY5bHA2gXoqbvzMBrp5nB0CLS/KaifuikU8T8IQ
	/XAD8SCsVkXSC/JLvjX4O9HyJ++jno1miYRpoO7zkk54mpwrqPxVTJS5xMfGE3VN/2KRSjoKY/h
	wRtwHcS/LHOwgmtA5gaY9aIYOWY5XiMBVDGE+PJRzkSl6THgDbKcMrLk2OCpffXTYd7bOv+8GhS
	lczjoX6PA4xKe7FOpr7mVzMGDdCQ8DX1obR1CVAmbkoehQhTNehumk0UNN/s4NMvesTOMTG13is
	93318PB1AmQL8H1PZl/uVxRlKFHL6tCwpkpgsJ6MWstijmcblfM34=
X-Received: by 2002:a05:6808:c123:b0:4f1:a873:6efc with SMTP id 5614622812f47-56b98c19490mr3627751b6e.64.1794435399114;
        Wed, 11 Nov 2026 14:16:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:29 -0700
Subject: [PATCH v12 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-4-9e3456bc2555@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_141640_056080_C5AB3E59 
X-CRM114-Status: GOOD (  15.21  )
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


