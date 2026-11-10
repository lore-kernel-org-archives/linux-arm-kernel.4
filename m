Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93058606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ykYsQcj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBG8ZMsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=; b=3ykYsQcj1mMDzK
	h+/qmAM2u0+Xnmsm8+ICc48NQCYDd3KqoQ2TV55alO0bPcjkgWte6irXWqh8xEqFbv5FanW5VIPhk
	tdN2U8WK/oOgEpHMeA++VzD9eoE6kCSGAyGRHU0NnM+TJjylcYBxxlAFfZ+ZeiQocQr534Vlj/dfz
	EWy0rnbGWOZAhFVtlemrFUaDVUVR2VFaHkDtrg1UvgGS1C5kQTdKuKOr+7HpFUux+LjrPubklJKp/
	TdTB4ahR2uL7N2RUVWNQWAARJrchlYMgCcyyW1M81sL6HKqmw72fvoq/vPTgq6wdF4RlNfs7H5Xxr
	JNW202+8qk0bchQITzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQd2I-00000002Krz-1Psx;
	Tue, 10 Nov 2026 04:00:42 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQd2C-00000002KpY-1WvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:00:39 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-8470d7d430fso863698a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283235; x=1794888035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=XBG8ZMsyrDBrfXRBdeSgNGnySJfh6VtXt2UbyGXrpxtH8QgOf/EJ8LUQWgRnRv+JCF
         DT2hE4JLLg5Io5Qy9iyI13h9uIaPFtC1VSOvnIgM9mNgpCabneYWV3WmrEakZcFCNc7b
         Oq+MXoKx9mauhV4hbHN0cwYjRESN7r5aqnUxPPiT5aCq9zC69UtrVpZmRWtXFLK0EXtY
         wt7s7XB9lngl/oapmd00Zkx4BTlv8Qcl25l5UrOTSj7Yk/SEzAZsGWWtb1uAZkybr+we
         /wr+JfXXEl2lsGXymASvmeMzl8OP1YWgVRngLS8nJSZ/QTC7Kytsj8osuYKe7X5Kdzc3
         K98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283235; x=1794888035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=Ntl02mO8QDgIOYBbSA4MZyfANSQ7RtwnwsFIG/7AewcuwF/C+QRM6cC2xyShNOw5pc
         33b8agOUgHzCOI/BCerZ/mMCFfQ0MV8lMuE5OBSu0yVpXMve1mi2Q1Korv0N5rM20yH1
         NFCg4KhZ8ejukcSu6PcmmlQEoaiqMtm1OkAjBUJ7wKqIRqwQuoF0PsOonNMQmhwTVa8D
         8XtwvwiWmqfnvncm2E+lkOlFTPlqvVBr2jivWaG+wuZOE2CPbFEhw0LxHNF6dPCSqd22
         9b8Fs9nfhRkqB1hz3B9hOH5meZTxVObsnRWCkFJlRooxUSwhla+N+MnKz52DR2oaMYAA
         3GBw==
X-Forwarded-Encrypted: i=1; AL+hErFaA/JXViJpDMipS1vqAi6EezCJ4jXw2N+UjbmyFetLkElyGse8oV3AIbGm1Ge1zBv6rCqrjCYJkYiyIz1kW1h4@lists.infradead.org
X-Gm-Message-State: APuU4Z+F7Ynek3q9rf0EO6u11TJrRINrCiBUy1eROyp5J+/0nHrcwPTR
	XNql361quBizh2kJllOuzEci/MnRI8CdI+pFQ8ovCRvHre8j3Dab8BDY
X-Gm-Gg: AYBFou0zaVlShvfHLe8ynLYiO4b7wAudX3O73cIWlYzlAoSjvChrXL/hsqv2Cvr1i7n
	8lXAt2seIATezQnNYCDdUCEoOwS4gfrVsIK3miCRYcV9ATuROrNz7bM3U+9Tb3R7HNr7uyyHtKE
	Ar56MFQijpYIDaBMNgm3hwgn2WLACk0wyH5QDLnGkpNzPpI54rFJoBxUW1utZRSIkYFvoAZVlc+
	nHl+eIZq/kuQfJHe2xID/l0ONGgLC6FOQfOBYtz4B2so6aaoFRw1GsvmYJXK511/+07KQpP1i7v
	J/Rw/iYIZnQav0J+6MFp3iYVReF64IZg0oqNc0XS9WqE2wikbBeUKdoiVtN7V99vlpWsHjkbO9k
	BNIK888b+fxn5SY6Mx5jAvt0XwRZQjjdxqCLzvaUqAktV/e/a3Rfz6D9sWYqKvU+C0JKE8bwFMa
	bAW/wypOlR2fuBxYlKIRacNKrCPcdzuVOBQr8DCyrAcikSn4oFtqr9fWyvL/a868ANMGfCa4DQ6
	YOZ9CmeI2ZDS3OTLRMx0QI+JaiBGID8h6Xjfp8t9N78rZ3a7KKu4vEmhZ5KqJMyDNsbbFMPdKbi
	NGeSOIL4bnUcrj9DN65SKjqhY0ZNrWLx/h1wcxWa8zSlFbBopxJVXmuqKW6wxIcB+0j5xjgkGHj
	4/p+sl3CKfPgjkea/CLIc0sDfptgdO8162j5n4x9rGGtGx5GtGgoW0xeMNUal5r3vj1iHCeM/Qu
	a86JMn5QeqHMynO8/AXn1t7SxQM/D5wwC1pBGAd/hXpEE+cJN9R+Zb8KXurFczf8rOX9iUC33L
X-Received: by 2002:a05:6830:906:b0:844:4959:e856 with SMTP id 46e09a7af769-860dc7c3282mr1426887a34.11.1794283235287;
        Mon, 09 Nov 2026 20:00:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:16 -0700
Subject: [PATCH v11 1/8] serial: 8250_omap: separate locked TX DMA
 completion processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-1-6364edca63d6@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_200036_402400_7F2AB9B7 
X-CRM114-Status: GOOD (  13.24  )
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


