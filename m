Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5976E60A3814
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cWwvpl4q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BDVTh631
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=; b=cWwvpl4qg8uGIo
	sCzEUV2VA876qqnW7S5mVaQO0dwZD6esJQSipQO2xCbSRYCnmBGbWmBQQ6zcrISAtVojzYP4bSwC2
	MZEn2obGVpTzeO69Me4GaAzA391uMixgKdChNTnw7Lee6tJfEfdjmdhF6RYsQTvg/sL1WEsXr6T33
	N0Cy1+sgr/dgTe0Nvei0rNNtskGffpt2x+opavqU23a6cv1dmHg/bu6VooJa3f7GN6FazmiR6MLCJ
	nTUpFtFUhjg9qqiyhTLStZTTft8c6lLhFUwzZheY24Z5kCDQ0+iw5U+RfN/6t2EcHuwzfqnfVPjup
	enu9/S8shUVE2qj19F8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIR-00000002Eh3-451e;
	Tue, 10 Nov 2026 03:13:19 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIN-00000002EdX-1bnZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:16 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so947687b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280394; x=1794885194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=;
        b=BDVTh631MxuyECD45chaCGMR8A7JAkv3XZzw3GhRdaXqrHRxXQOd1Gd9gyOFwKWWPR
         uvP/YLJvDAwBSSEd4wKxMtfRXJ4Gc7ratKf+dU5xAGOCC6IlV2i32s4f+68/Hn1lc9Zx
         Ur4F9qRpEk23Yo4WaMa5YYab13vOnL3nGeMVwj5upKRdFTj9kAlWT2+Q4G+V1lYFpb7E
         Gg0yV02BHQpuIvBiya/wYBWgvMlJE3WkBOqlevsBPAs6dz5pbJrap/9AxKqlh5rrZxSR
         WInhd9vmYKcM93DtfwzfyjzetTK+E2OIwXLvJrRUnbvYG1Zv0B0RtRbMR0xTA3O2rFTx
         VuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280394; x=1794885194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=;
        b=fscXp9VVAXZ2Ni8AraoYo6yltNNvGo9kY5kRKphgflmkuBDTAANgB0iibLRO6BZPsj
         6NT4BqK4jItrCHtBfCtC/JGy3Zk2lqUn40/eZQ/59zGptGXgYOJti/+x74S+7EefB6yX
         dexZ8aFao2euhLQec05SBRV07nNuZ26q7PnhAX1rW7Yor+ntWPJyObenYe9A6pYJyccR
         qnUxpN8d2Z+WXlV9Spq0B8fepeWCzpRVTMt7QbVocp1gjekwKi4eYw4nJwx+sm1rrU73
         JYe0hXL5poSjmIukrieC62cnooKnFsXAT6bdU13LBhxXl3iO+5XQC6wTbdd0u9QiRJjF
         yf2A==
X-Forwarded-Encrypted: i=1; AL+hErF7hLE8Jzb+0gmMcI3WCNvp+K/9B7YG5VQGxyj7i8jeUbxrUFHmBxVXcFRRchkKKju9vMDYkAFF750HeMBpuzHz@lists.infradead.org
X-Gm-Message-State: APuU4Z914TQPqhrSyNwjVpk3LIMX2wE6N5Hxq9dHcP/PZ4ByDGI9L3Gs
	EjlJRcJGZhSlNlWiGyzTXQ4aRYDB1lxbKtmYoChn+4mg902GMADLW//P
X-Gm-Gg: AYBFou0+4O+pcQ9bNp2sR6P+3fpHO/1/KLh38TzETMe9XBrvWfF10OlUOszgp1OzCyk
	z9niJvMXDaDxOEYDDb+iy2lg/Cw72/t0PkC8XK2u2J/gkgZjbDQtTXzYYJQ3l8yg3rVI1BKYyLP
	jQ6Sm4WqwdKuQPt8F3oVAJDaWYk4v0RU20rXNJeNlNH8C4d/qOxtbov/fgwgZoUFUA/8umg0xTE
	HAzmRZRqsY28NwQzqL0U/GpT5ongfPmtOsIMgrMdX8B3fqzx1K/Te/0+wECiwgPZQoR6gvfIPdx
	Qse+9J86GGRwLERBShLEhJnKzk2IOHGpVxY0x9YLvaqEGR2Tcqfbkb8d86s+WKDXA3njoeIFlWX
	MnJIOkm9X+quIsI7qNA4lKjjvo5zCUkD8+L2t6mdyuBgQeRVbqA3uwOLzeYvZ3cPJasm4vDSzRH
	EPN+4Ev/IATQrmUWv0YDIQ6ZX/upgLz6iVv1D3ALWHhnUSABk8fCbj5T0yY+6OegYqYJUUVv9CN
	2Av7PBNyWY/VJiWSA11vtK7Ffh7JHSh/u0pOi+1i34G/5K+TH3q4O2N/IrsvfpmDmtYNl3QhMgc
	O2lbImvzZVmyyqLOZH7EJPsGUbUQiVSGS1pSVcF16r5McCjnpWB6MpMxR/2+9GRoHJ89362svpB
	bwXXiaDQP9iotOK9gwThmtQk+mI7pjfXSj1mlARzQBfYUatfG/c/sfjbQiF6Md3TZuufjQU75r8
	FukWf2YIrXjoXa49pabdfdm1m6iRJ3u3ChnagN4Nv52VoyanSap5qt
X-Received: by 2002:a05:6808:1810:b0:568:e5e:8058 with SMTP id 5614622812f47-5683cbec0aemr1136816b6e.19.1794280394206;
        Mon, 09 Nov 2026 19:13:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:51 -0700
Subject: [PATCH v9 02/11] serial: 8250_dw: select port setup through
 platform data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-2-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191315_434908_9167DDC0 
X-CRM114-Status: GOOD (  19.57  )
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while preserving
its existing conditional DMA attachment. Select the DMA setup helper
directly for this integration. Keep generic setup for devices without
matched platform data as well.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 44 +++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 8fffb1f9ab0d..613907b8a40f 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	int (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -631,6 +630,33 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static int dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO */
+	if (!p->fifosize)
+		return 0;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+
+	return 0;
+}
+
+static int dw8250_setup(struct uart_port *p)
+{
+	int ret;
+
+	ret = dw8250_setup_port(p);
+	if (ret)
+		return ret;
+
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,21 +791,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		err = dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
 	if (err)
 		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
-	}
-
 	data->data.uport = serial8250_register_8250_port(up);
 	if (IS_ERR(data->data.uport))
 		return PTR_ERR(data->data.uport);
@@ -862,6 +883,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0


