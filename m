Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2546460A2622
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zK3CDiL1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vx9jm3rx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=; b=zK3CDiL1gf+B42
	vFl62inj1XDmcpFMOJpTAUPvEheB1FraACNWlZQLmeiQ9/EQ8mo6xA130FIqz/CpuxKBjt/DYtl/N
	8oKFNxOkv/DSIoek0C4PDUL6U4nuKgoeyQy478ksuYSJg72oneH/jloJSyR28Mvkw4tztEn/Xxh8w
	z34PVRoiEgX53wcXpKYs/dYUE9T84OykE8sRWw773hw5NVfzdtDoROp0up43zD/jzYxl4HhdJx2sf
	kcyoEq8jqEk7tIH8Xh61kkhvfPRZ3GDAQuFGl1WyyK57lh8ZwXfEnd6hW4LJtPsQhy0Ww/OxEtyK1
	JcJlh5ap1s/1YR12SiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnyK-0000000CGPm-3C8a;
	Fri, 13 Nov 2026 09:53:28 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnyH-0000000CGOp-1nEr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:53:26 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6aa9606ddadso967174eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 01:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563604; x=1795168404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=vx9jm3rxn43vn0LRY0JKJ4ANTnGYDCXtUJvLhg4JG1pxu51Xeuqa1HKmRWvxiLj9Gs
         3VIZV46Om3FZS4so/J192t0Khc32Bad2Fdk0gYCd3b2x0AUBuCck+Gs26zvzJZLzJMpY
         OlXQDkqhoaoTKy7bTIHsW/pTRI2V6UklzxAUlTCS+ocL9kB8EAZkZJ80pMZJdxX6ZBBn
         57Pdb6+MYCUA1WaQM45vFlPFYQvU4QS23jeFqbg5Z/kI9YBR1x22HMe3qo8u+rcPb5cV
         3jXef+jtwHupDgxLCG8C3oDcJArnmWdV50zSjQyPtKi9rNODZSLrJOkqFlutkCV1nPeh
         Xy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563604; x=1795168404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=iAV0uKyXDf6h16JgUPDVgUz9j14xug8y0i3z0eNibZkom7AI36OT0sUF0T+stQBjKg
         1HNmUIk1j/fs30ALh/+/VutBX2K7Uxbg1D8rYUr85rQn5h1P6OV3LohhlVlwv16NguZp
         KpfIi4X+abuMEqxgGwLMs08cShFPCmaKfcdWaeUPqXaBNItPEEoF4MEkeaUnbABOp7Xa
         vq34fIuijM1F0+uiYnuZi2Z2/rhzgzZ80Ml67SCktJ5CYcp4VlaBG/kwLNTXWmm1tty2
         RQRvaERuxUobCFPa6fCJ6DL0YkDXAqSW8vk7UWbizu11AYYSxwuBlP/iWWHEiLnfUF2i
         n0FA==
X-Forwarded-Encrypted: i=1; AL+hErGsBSZaBZ0BOyjPkQpUHXRaaRzpKUiXFHGxMJTFrlPJDXLI8SDNhtHyMHxnG7GgQR/hLtFBfwElaN5n7Ga74Efa@lists.infradead.org
X-Gm-Message-State: APuU4Z/JeoPVRwTMxWH08T007a+5iaeV9NyLZ2jDlG+Z2tXRoYbOhpKV
	EDH5BnzDaxVbGqoBipQEnO93ZUmT7iv8FOLq5T6ZLmOnNLv9t60OU+Uy
X-Gm-Gg: AYBFou0BXM1aHHg45CQfXCtGB5ikU0DAeeG8AVXq7lA5St8gaYXa6NN6Alka97jVwYf
	ZQBx94lM9W27MNvI/lERQtyNOC9QMQ+t1c6+Icw59DfaJ7k3JaBy3Hj+3T6IqLhVnjn3lF/ZJ9V
	/WmaLtSuFRUnNZurOBtQMw2GgnGtIK7k5qTgmOSJuGKBQnsZjV42f6NuZ0hLm3fulDfBWgSVrPD
	rE3P6i9gIP6stwr1VLOC5CD2ZEudZRh7X1vnlHaergDqeW6wNpWbw0EzO9xO0BhLjpnLuXQrGrY
	yZmPuI3lIAYsFhx/JUMO0dqPpM+Z+QrD3HG/47tV+IHyhTBv8EdCUzv3d4O3LK2VkFgQ0bRsyya
	FWK1vhw9OndaE/9nTjjTO/5g0/QpOBf2b9BBjc/MqmbJSGLDDcJ4ckjcelGsL6tuWUNLz+kZeN5
	lk14RD34WW+CplwBvUxjgKNKweSfs7P1FZHrVl3F71wAvcrs8AV3jU1D+Hv4dqK4d0Awpys8w4K
	cZdKF/LfOuE5uvAxmdKISV6m0HeuSZ/hlyH4ytzmZ2F9YtwIczUTv62GgwkB08sWKiO59GDYJBV
	pYUS6XrkzOh99tb5kVp6fio6nZbTuSk1hz9dF/gJRG8QW9+Q1dIxrVpuuQBJ3mH6Xh3gh7xjM3h
	96KtWPuZaJjTWFJA5Q2p6YETiV1KJH/zA1qfAYqAKYuv4+ScA1qDdM6jp9EVtDye5uw1Yytfx7x
	8hjfAH9lPL0Sd8zpBcjW9Kk2LkhPyujoCQZXWBC42XnYv5hQxJID6UfAVkLBsiyYvN0qL6aFMi
X-Received: by 2002:a05:6808:c1b4:b0:4d5:27da:a492 with SMTP id 5614622812f47-56e65a26806mr1379942b6e.44.1794563604182;
        Fri, 13 Nov 2026 01:53:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:14 -0700
Subject: [PATCH v13 1/8] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-1-b857f2617ece@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_015325_477754_EB105B62 
X-CRM114-Status: GOOD (  12.77  )
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


