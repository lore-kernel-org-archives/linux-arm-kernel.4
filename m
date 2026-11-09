Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF6606D811
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cj52FaWE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obwsHo3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=; b=Cj52FaWEYyrogJ
	nk3dmlnbp8GkGncvD5slIli+KpHSTjiFFdIxCDPwcSOxcCeSxVCA9nlf0fDVdIENdEUmbuYC3yHKF
	w4sGKcehywsslCx3avmeTX/fQlQkXy+CcFLUMmJYApl+gjiNkzSBoTWikd69YvKK9XAklHVe1EBkj
	x+PKFbeDDi292bpl61dmDvbG0VE6H8+GvoQSNiXIgdVGf8wb5vlo1JoCQIeHanlxqs+1LHYbC+rRv
	2utdSbnxXnpTZIGiukPOw6hE3w7/MCmDbvSxZILoVk+FkMUPNipqbzAkrJY1mGnnwzQNlgUQ++zDn
	mqKfekv6T5gguB3qGSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGPg-0000000HGN2-0kUT;
	Mon, 09 Nov 2026 03:51:20 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGPc-0000000HGKy-2A5C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 03:51:18 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-823e4047037so219402a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 19:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196276; x=1794801076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=obwsHo3Wb/hcIjj6ZkBGlRC1oPGwGt/CpyysHuJ2IkMk4tVWEij1MUuRNwghiFTHZm
         +wMbCDOzkyjZ/p9OmtCXsMeAab+/9pW2cJUd5p+o2IEnuA8ejDS4y0qHPKKpSs1Wr09M
         ArgO4PJd4dfsFWXw8TslObtq8YtQeGci9UTS1GjBhURWmJvfw0IRwE5sTkSUAirOgNWa
         NulW1faXm0cZgxM8y4xmHhmL0faRh7AcdIMRxg7lNNlRTbFweC261ibNWoL4H61tBu02
         coWya1H7NKao3G0wILICCeasAW1SynbhGSfXDRRbbSUgdRFw5u+sPJoSQMfOk+KI6JQZ
         zLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196276; x=1794801076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=ZvyVJrCm/Ar5+ouaTmivDxXHsv+RLs8xwD+1F1oKiLp7RS7NtPH4yoypsrvvwL0hl9
         k/lqxcXG2ktNEc3H/sroM9z9IQNYUiO5qYDDrbujIauaGIX6M26PBxnApp0k/bEUQAdB
         +t24S8u+Zg//6PVGR4k1x53oj17EhJ8xwxse4WyMqitXQZfxVe8quMzo10fJAWEoZpPy
         hj+MLmQOR4M1Rs/8V7yQApe3MCj1WOmwkNggtk/vLqGX7wLdRnzdyxa+14tZcA0BEQjA
         xKh2nQQqPIVVEvHES2KN1cRytqntEP992UeKjgFa517HlzvHgjJfhC+nnv06oVvCNd44
         Ae9g==
X-Forwarded-Encrypted: i=1; AL+hErFoou6ztiDsOkJtnQ7tyTdOam/AF4+QMUNxTHtKheZa6pGmTaY3QS5wxWROw3/aCpCrvBNakh4detO3aaI15o+b@lists.infradead.org
X-Gm-Message-State: APuU4Z9EcLWSuTk2EmZiVWW8pH1m9l7G5FUrPfDQlmEHEl7TG3qs4smK
	/g/cagUrIXwHIjSl36lD47ssQlZDAxvJedbzn/c7N4qfR+ySqsFKzlx6
X-Gm-Gg: AYBFou1y48mszCwEzn2k5rg4Jw8Gdc39HC+HAYY6Y0swjZrLQ/PrZaf8HImoWEbssdY
	2fU6/HcX3qwyUUnrqjluNpZ6+hVUVGlLztNNpWcVIIUmRguFn0KNBeLAJ6F3HPvPRvfk1eAKLKC
	W/NtdfIWruF3tBL69ino7JZjZOZrvy1kXffLoc2P76zd3rzMWfjTfjlJvzPqldWH4M/7hUjb9IA
	274zPdHQn684R39IMraSMBXGXI73ErDE40mCCSDwmmlCm5Euu658d5W0a9CWe8+RR+8mkCppS5z
	d+ylxb7xwTZDwTJvsyMMFRgXDb7TSnsCJcGu6WGBwdsvglBdYsROQWW9ALAZ5KwiVekcIJWqW4N
	dLUE6QKaimrJyS+81D20/nTKD8duG1AsjNHm3iE76rXa/6Sxgajji8On3V1zc2jsz5NjTA+U2LX
	UpOXObBjXuZHF08mGiz/nEStNYNYsyqWBstdE4TkKbrm8rRs8V90s5q6BTb5B8hBw71Zc6Fq7yn
	v3DRq67Qe5AYTFswlUEOcMt9Tje88HaCkpDHiKIRPZ26TtrZu1AnaTqwB3r7wVE50vQpRjs7yHu
	W1bwoDO2FbPDNOdtWOIkdb/qWx9eDRupqEf1hNpG6iofEB5hV/56AIG16CjSmfWFDfF91Ral47N
	hvw5wxACC66JERho7DkdynVKUHik1dcwDBYtNJLcqVgx8zcvbYfQp2o8Gt7QW9zyPJrk6/ACwH4
	TVYwcsoMPJBjysX6Yxe9oZmZBiElCjZDi3UolJZJe5VX9L+ejAc+GR
X-Received: by 2002:a05:6830:2b2c:b0:821:c75e:5309 with SMTP id 46e09a7af769-85f506ac2damr2072062a34.7.1794196275699;
        Sun, 08 Nov 2026 19:51:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:12 -0700
Subject: [PATCH v10 3/8] serial: 8250_omap: serialize RX DMA completion and
 flushing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-3-e6227ddb95b1@gmail.com>
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
X-CRM114-CacheID: sfid-20261108_195116_581219_AA1F564F 
X-CRM114-Status: GOOD (  14.00  )
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


