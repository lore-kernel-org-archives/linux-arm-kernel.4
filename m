Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F1606A89D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4R7aROUR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUCwbc43
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=; b=4R7aROURyog9bP
	10ceMFnlJnyDyDPeTE8AzDOL2w1UOgxq3EST347t01Syup3N+t2cOpBAK9mxeFZTGFliFTm1BpAIu
	aU75G43RcsQqI/7Vtb1Mmp0wvW05bDthTKukk5yCxg6y11MCjsv/JI0+mq0IlqAzdkdKokdlkM/3M
	byqLXINUkNb54uET55kCuxUSElNY6DSjESI95z4Nn6PlSimnThvLEEAQKbDGmyHYl7fIhR5vihCxX
	ObnflOcA5S4RIBa1on54rAAJiy9IICqe919OEGC8N6to7Vf2YI3wxf3wsn1+1w+ZbAzuKgA7zOyQN
	zWfCpD5HpXUbLc3TF18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcU-00000007uxX-46Bj;
	Wed, 11 Nov 2026 22:16:42 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGcO-00000007uuA-1LEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:16:38 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4ada9579947so2180927fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435395; x=1795040195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=DUCwbc43rWSs/ExGMoxI6yn1XKXNgobkREXV6BKnk3SewrqUrsaLBfBQeH4hIkuUHe
         b6njlrG1h4x387ykcFkmRMlgS45fC+UfLbdnBNRbv6zeeT5x6vC35xS9aYCs9rgxaZna
         pjpQOi5MOR1ehboV2E7gEWAZu5Riz13PcpIZHFrx0dCtLWrrht8CUWA127mn2Jo1+U1N
         QaJJqIrookOJ0AmCIfvfRPs/4DbEi2ewabKSumlGs57rl+b+Xy/dnTR2gWLLw5sNm6cW
         HLeYkeoFFLmcW8y4/o+3UQU7ajyp/F/LH+iMqIFnIBS+Mv5SeeM/UgXFUOwuCZnB1jCg
         p8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435395; x=1795040195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=N+CTEzwaCtDuHWORtv+UdpfhriweZ7AWfPYNYh5NZ/UdLtwP0V/jDEHu2ogsV4wm/v
         hC9YMcbCTEeAR18Tgyu6ZlTpBopwkfwR9V3csk5flH9413bNaU3OuCNn8xsHyVueWz5d
         eh1pgftu08DurrYwqsLHKve1aLLLD/k1OnI4oxD8UnDtx0UIe0J6h9f+q1h73pWXEd1U
         7xxkPB1hmXE3L6J49wWP7vVMkOH0nJvl/npNECWwynLFA+uq+PvtxJK/21KQEUU88eI0
         DKKsY4mXkh2n31y3/pprAcR6cJ8yIcATxC1rdpG+3XuV7X+HUZIvrPhuCqDuxIokh3gi
         2wjw==
X-Forwarded-Encrypted: i=1; AL+hErEmu15hNQHwOFDjNPYwb/E13imGvHcICDhOSfY4LzuuajrE7ouEnhl071sROcCF2/FWd90vYaLweh3MT1hW3D6i@lists.infradead.org
X-Gm-Message-State: APuU4Z/kOTRK2tDiDMY5fj+SCmLETmgHkm1HSOwj/ZwTccYZD/OCfHMr
	r5EB0F9dv3VzSsfJyx3lDgJTes8gkf+/RKusMBLBlu/lxMCEu4hQaB6P
X-Gm-Gg: AYBFou0Ncte8RJ8ccB13jN56fJmjdiAbq51vTen0sE7Tp2e7LeNr/pCP126WkXvtYER
	p+Va1tlKe4Ty28+gWG0yM/wwsGdkFcjMdQeYWQn1XySPzl25kqWyUhy/7ql9psv4nm2ts/VEj6o
	IGfbg2xOy6bcjHcJ9xplcTg1xwb/y/SZCojmYMueWuluo+edMtJKRmC3pixYRyVPUp+EOKR8U2U
	32Fc7SVOD1p9xPu61rUs+QJ3elopK/Uiy3gdYiLk7C5bWKWGFhD+xfMgorSNoexYtRHorEoxOYS
	OMG4h41G9NvO6Ek54UanCPiF00gfY5iJ0WTIhSq583S5m0ZIGN15X84p6F1D3meo73tYtPgjnn6
	xrJOFMenv39yW/fjOtl6WwR+xDhnaCVaDya/9q2pEHsDnGsYURT7GiO02ylnYkAZMEhDb4Ezet4
	Gbt5EmoQuwFKRuDTIAElgKRUdlkZTHDgSKSGHSDstFbtA/FlCgp+Af9c5tX5lLUsUFngD9i/h0T
	N6hhir1eL3GE3FtWnbcxN2H0FJgRbn/NiBGiZlQNtWhZI8XZJIqzvCo01sDhk93h5IyHJYxmxj0
	Yu+8qxm5Fp5kjNypixvGF32NyYjNuUjVXiE5o0CeUODha+d5sdC8+pRtUxDDrKIHzCg0ScI02Ib
	wglm0QjYZTGDbKNIAEt7qOaG+WF2CPnSC+UZwKoSLv5uek35qOsISgYkj3dpKOEQDzT2EAj4KX3
	XmIhIkDrU4jjmbkqg7T1y34Pc1z9mGUaEVxnN1/IDqiWgjY0zKlkdp3yMNcwt7SRgIBbqX9w4b
X-Received: by 2002:a05:6808:e8d:b0:4f1:7c39:8a7c with SMTP id 5614622812f47-56b982286b5mr3254065b6e.62.1794435394806;
        Wed, 11 Nov 2026 14:16:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:26 -0700
Subject: [PATCH v12 1/8] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-1-9e3456bc2555@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_141636_400174_D03D161B 
X-CRM114-Status: GOOD (  12.91  )
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


