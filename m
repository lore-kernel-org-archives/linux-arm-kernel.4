Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872B3606D807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 03:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eO2+U1cv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svzP2lon
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=; b=eO2+U1cvnADkYy
	2opQni63MXvM57xlC1Rs34ep6tiCwop9jIRuw//VjUf4K79h57soR/bLC9EDTkAFwRDBaws7FHMEI
	m92UWaf0p23bu9c1g2UWcYUkQD2MzQDsbMlgiCW7DhU0C22wgIjvqqw2uux60ZH1nIqXjh9GyD1NF
	CTVjXQIG6vPk3IpyeJHU8WpSNty6jSDo5KUNj9JY8BKw0HPGQvdvq/STS4D9+dT0lubOUoZkoGx2/
	zBko7QCjDBNIqteEBolegc9C87JOm8sLkLsS8b39gJSCJfqOZUYVPCz00eu47M6rTbCd4yb+MhBm2
	nh4DCTPZ7dx60MaLCfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGPb-0000000HGKg-3JcP;
	Mon, 09 Nov 2026 03:51:15 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGPZ-0000000HGKD-1UL6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 03:51:14 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-845788309b4so173849a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 19:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196272; x=1794801072; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=svzP2lonall+ytWT9eSVQGs5WpiWfp0N980YWAvnKosyeqQFl8ir68NCjC7fsiCHIN
         xa5UfYvhSlhUcxVj8LzgSaj1Eo+7aIRUZKRxPhSznoqG17g/8c4nPfK0+dCrnhuBCRKG
         UkxaqP2BwHg6SXMxjy3UvMKAj7D0GwWO8l9FM7QT6dltrl/am6gi4vGmHCftjZYG2RBl
         YawsuSMoXOUJfDrshEDlJh42QDxx+4fBpk10huZX94uAsNE+lS+iOAw0Z/UtAZON3UdU
         0IpQpVBSwp4mtIUwzvcJK84CtFbFdZOsFxvU1EmUlkaugYOUsh9nv2MsrsnMUhONzvR7
         FGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196272; x=1794801072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=DRhdCRgNcTZuxAaSLavHbcTXQ4zlpTF2rB1NtKliCOSQHrArrMlAWpVFCQyT53wryS
         PHriWj7Z4jm+6hTAijfcDC9xSRksH48IAO9L2CsBzTDNEf1rq1hIl/b+f3mpzIUJbl5K
         0azsV6tcLSfCXkpj0x3cphSOJinmUI79YfKQVW3wf7/+lNQjNgqiPZzX2YXGt9DG2rIy
         E15e7H18zsadTdUUMVRJkD5cS2PnVjjOXgPnGBb7+KwJ22STaaVr5XwZLKkbigmoE2ff
         yAnwBXhgJDRErIfc7nNMRNZ87mUOGO74Z0yuodL+2snZmiSJNJn1NKl7rD5rERDST5BP
         S8sw==
X-Forwarded-Encrypted: i=1; AL+hErHnO9d3y0cIteqz5oEUFe9pJefO168NzE2Y9pwyJmqTf2Z+cChCLHkmjckOgeaY4SGwnLe2/o9s1XZmwHpd34TF@lists.infradead.org
X-Gm-Message-State: APuU4Z+V5kFgeUwDDjyH4WIpo1RzjhsHOelaY6LmMOPr/yMuctCs2F5+
	FWl3SRjPdla/QBqHqHJWIT2EU6Wie+5egc58qtOaGtsDEuK58aUBpNfZ
X-Gm-Gg: AYBFou1qTtefX3K5/JVviO29BQ44Yj6WbqlPQiF8g+eOrfaJ7jx0fZEaSjgCoq0bDuk
	IKjjkVThpnG+ucPub4TF26usSL07TGNGOOgYkHamuWJk2t8UHvuvIyE8LXJADlyv7myNw+6W3OP
	bn2yigAjzKrYd8yKFAM8f49xqsMSTCoPDz04p5XVTIplTNIiWlG5/f9ZFIOT09A13N2acsbvHNW
	vlPrYN7dzX1kzTZwowFN6X/C0U8OAo8NqMPI9BJuf64W4VFefMaM+pFtxSIFsHFDAYT4ZEDJHI0
	2IxoyYY6rQGy27lI5AkhLYH7iANOSiJTGjA15Vqd0RRNeI+c4YrMTqhqUoDmAj0BeNTlUYhlwOR
	93qqMFGmWuc6fpoLPuytjEK6HkoxRxvOfHt8Y/T7l/3iO26FCkxrowdDdxFoAHaKIqRkNR7fCfc
	vB7qZr/8n53buiht4EIPvNUWKPr9SK23YRwhbhh/sFVgKHS6n9JXvJFdjn3nS5OBHiyZzOod9uQ
	aM1McCCHiMe242b3GyMWuc+Qwz6Z/0RDR4U8uqBFTxI3bmjsKIRCc/V3w5Puid9rbTEHD/H8lXg
	K2S6qs+eZpByq6Kjs5HgrlBZPV/o/qZy0dANMqblAIHYH79hqVBuui7dQTOF+kPxmDjtJvMC2wE
	7H8oWuuk60RH3DeCqtaJxMunH8HryAljZ3912SAWsfuPh0ZdypvshYhpcw+9MJq3isAeLJquo0s
	/H8tbuFEeYZET/O4QX0pQ1Tyr2jPMOy09ZBgFsUSmJgR+vyoduohR6
X-Received: by 2002:a05:6830:2b22:b0:85f:49ec:c96b with SMTP id 46e09a7af769-85f507ef5eemr2216062a34.16.1794196272163;
        Sun, 08 Nov 2026 19:51:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:10 -0700
Subject: [PATCH v10 1/8] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-1-e6227ddb95b1@gmail.com>
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
X-CRM114-CacheID: sfid-20261108_195113_404740_3C3A8EC5 
X-CRM114-Status: GOOD (  13.08  )
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

Separate the port-locked completion processing from the DMA callback
wrapper. Keep the shutdown check and locking in the callback, and retain
the existing FIFO accounting, delayed register restore and THRI handling
in the helper.

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 4805b644ccb1..b6f108d34854 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1080,18 +1080,13 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 
 static int omap_8250_tx_dma(struct uart_8250_port *p);
 
-static void omap_8250_dma_tx_complete(void *param)
+static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 {
-	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tport = &p->port.state->port;
 	bool			en_thri = false;
 	struct omap8250_priv	*priv = p->port.private_data;
 
-	guard(uart_port_lock_irqsave)(&p->port);
-	if (dma->shutting_down)
-		return;
-
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
@@ -1123,6 +1118,18 @@ static void omap_8250_dma_tx_complete(void *param)
 	}
 }
 
+static void omap_8250_dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (dma->shutting_down)
+		return;
+	omap_8250_tx_dma_complete(p);
+}
+
 static int omap_8250_tx_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma		*dma = p->dma;

-- 
2.53.0


