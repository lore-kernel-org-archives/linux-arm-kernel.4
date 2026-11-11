Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D277C606A8B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZmbchmQw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPKRf077
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=; b=ZmbchmQwxjxEB+
	FauTfGXiuzWNCM+0JD6mRHDDYk3nXQRJDNnkQ4IPNoetzNXdF9IUHindiYIPD6Ma5iWv+ll8UnvaN
	T/A08YYHWssBsGcckN6Be1nzd3FpnChhX0ymY0lhMcudxXxlHGgwftPrgAn/EtCFBK/IR1niD1T94
	4jonV5V4/85cb8pjcf4C/5bDRc+u/2ePK8tGcNSmESNWn2G1X+XWBFhNMZJvtggaNLd6+63eMwuKg
	RqFEQQtDm53ENH4mY/xEzFKRop8Yi/BwJXbI6yAq9RqCQLxa7RgalLe9E7vyxtBFvyHj3JD2qOcNf
	1PDKEetx0IwIhrXYALhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGco-00000007vGX-20IK;
	Wed, 11 Nov 2026 22:17:02 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcX-00000007v2B-4AQg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:16:47 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4f488ba6e90so1365155b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435405; x=1795040205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=tPKRf077rpX35iUoBuK94citVDScUR5wqD2Pj/CSX571721OmG48UV14Hw/qCUMYHC
         nUspFI46MY7OAKAkT22FmbNUoZ3ZmgfXkL/N32v7hCGVxd746Fo/mcWI8Cg5cSYMgMaw
         sd28sSOwrdm1HtmJSqwrLMstivPGFSpmAP/L4MOTZsn71BzVgeum7X/6JWFRyWRuVts4
         Ym5ZWAW3Dg6cgD7jC4PQP3txqecPUF1imF26ynUWOlQOK+IzukzkhZ/fkWB1hnM9MKmE
         3gZoqg906+fRUot+f0/ydImyS6v+4zxiw5okIkmLU6VL9sX7TC7Kxn2NHjYNsILsDd9N
         MEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435405; x=1795040205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=HXMFHwJBGc/UhVEjW2/3+mtMZpwd4kMfAPP2LrBXtmR+xaDe/mBlYBQEBpW2zRxUHp
         RdvrXsnZfK+qP7Turxkvh/okIHt4An3zRLdE/PFiLk035x57cBdqq4z8ic/MoMUHAArx
         cmfyQPkZbn/DfX2Ps7rP6ccBBnxrofqhsIyMmzMxaFCj7slNpebh+cQ18KbWdzOI9A4J
         cq7hPd/h6fVuaWL5YIPF3r/X8dne9oOLzcovC7A3oi8afJBgEf0wwHzdl2QtTd4nIvZ2
         B5d7KpVV+ODBfowS7nAgtYtR3WhjcwzlH6+1EHKq+A/eIz5+W/hMwhHtvr+yPr5k4kj9
         dTxg==
X-Forwarded-Encrypted: i=1; AL+hErEa6OoEGkj/5dhiPSEymoJ0UkJXl/fHu2YuMgf1sKu6gV6rx1UbmYpm1YDzlmoy3DWx297oORCO50Ym3JPa6HAR@lists.infradead.org
X-Gm-Message-State: APuU4Z8azF0G4MUfFPvR2corgjfC0xQm3ZJv+2fdWB3hICTQhw0v8Y2f
	CEWRe4XmbwS4CUlp8PM8X3NomOadEpTPandgHPlp8t0k1crxIdX/6hsV
X-Gm-Gg: AYBFou1H9xrP9QBwByKUzf87HHPI+jutp27HqETdxT8cQEm7znyvXXyQSDHd4lkra8S
	7v99XokzYoMhXREsZzFmRkitQidEIGSySS0Lli7QOZAbqkwBwGWo4Gj1pO5fhqvstFDeVBLcZRh
	1qfjkR9xaGmb7JtRngAY0MfiXrN2/bhfrBJ6dSwlr7Crdyvyf6DPdrZ7ilkofTMEDN6vqe7gz3U
	aWdUJBq7FVLDfBdBE4aw2dqeFmUOKi75DqW7s3sgZJpmALk7+h4urhtARqgu2hvJtb6REhdTSd4
	0JyNjbxzHf76rfeVxtBxFyXqi8JozKVjYznPbXuohrETbDYk4FXTKQpAmTOqzQvhpwlCdk2atbh
	e+cPC4JVEclsVlzojm/WXZ5eDJ2JbQ4HPY7fSNg3CRzUNhvA8GPSW+/GhKEfnQFrW1upjT7bw54
	A5UiBjyzHxm5r+Rja1rgt5e7Z7PegIjwxztrJayhJVEtw9xXv5elvkIm4QMrHLFttaQ1idaHPHZ
	1ZMxMl1FwI1OsArmPzdxXiWBPXialGscUa3xa5GpyNPBzg/06Dfhzx7zM6hP/8CiSyjrQsnmJ9/
	l0gx7xENMbz5Nj9riA5s1DtQVCWK0DxwiRyZdON12jFwZKd5cYD+RQ/VoHY6+IR9Ne7Apv18Waw
	k5p5Qc9LUSHocZqbzI7HEKngJuLrZ6ckBTC3fX35MV8WaXYieTxnetjR1c3lRXUEZ/fH0C6396k
	VNy2WUHQtNMKskflAvZDWM1VxcgbyIc6DIgXFoaJJY40wbkMrWDtqNIXDmTzyHYUdlJTaJepqs
X-Received: by 2002:a05:6808:1902:b0:4f9:6348:cd3b with SMTP id 5614622812f47-56b97101439mr3389720b6e.41.1794435404903;
        Wed, 11 Nov 2026 14:16:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:33 -0700
Subject: [PATCH v12 8/8] serial: 8250: retain DMA resources when
 termination fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-8-9e3456bc2555@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_141646_085748_2DC60DEE 
X-CRM114-Status: GOOD (  17.97  )
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


