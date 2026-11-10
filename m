Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8196606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Au4wgDWp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LB9Au0ct
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=; b=Au4wgDWpVM9pOY
	aNcFlxi15KLkOIFRfOfVV5ma2rWWmubFc/yhYINQnDsU6KX9WLRQ1Zf3tw9c5IQFY4g+XPzlqtfIj
	ySDxnGarAJRN4yn1AS3LTUhT5QeXpw84ONalgdUt3NamieiIi6YtRJBgn57EZkrqtq4T6YPS8mUmN
	MTDDUTvbWFwDPQPcvbus+sTyAbgN926Q3+r2GqRr8oXDU0RG10gAN/9s2C+QTIRaoTLYD1xq+9Cca
	p97/VKCUAADwLYJUTYaR/zO6PT0OBduJ7CkfK5g+6AgNl32Rgl3R8FOwPvZ/3uJ8yRQKPV38o/ZWd
	J0nl7A4GXXPpx70yPcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIb-00000002EpV-3PC1;
	Tue, 10 Nov 2026 03:13:29 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIV-00000002Ejl-1Fxm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:24 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6df5e315bd1so1167111eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280402; x=1794885202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=LB9Au0ct8pEPw80w1GFC1N0msqWe3y9a0O7S//xapnHTkFSEX/p2bSsZBUKpva7b4T
         k2teKqA7IYjtpn4qA0M7E9i1jNAqpzZ5VP+BaWK+OlkmOiMB64BphZ0Y7ADCLBnlvhf+
         t271lGAGpnx7EmTr/UlSmCr/Jux9e2jkTJjmsb43AxJgwdrH0Mmm6SMjbJF71+YtvwNR
         9Yri1XrPYMzrkgdVOgyhqe92ChK3p+v/VS+dDLWMFxUY7AiiHhd3woxdtgJYe+T80Ynz
         1psMA6yLGK+FoEKRv1f0uJ5epRmjCXtTXT/U8MLMYNFnAGGRkDulQhbfR+3q/va1zW93
         tSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280402; x=1794885202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=OF98wJKgYSw8pICfD4vaym3V6YfHHuFj874sbj0TP7lBirA3HrGHyWBCMbXFbHQl09
         5KIAd6WvQ19yEJKtRAth+s7Nj0TufkFb93H9qGS1UdmGwyVVP+DEiP0Z+/SHP5LGG3SU
         CxCjX35oXL4hD/301swXql7HG4bQ2KgSDe/8/JGyaIDr1AJZ49/9Hqm7O2ji0acwRzEC
         Dtm4ejJaWLREX+OUjCTdVGLDece/NCnsz+7ryWP3WxsF//8Mv66XbuZspQxFAIvqlxiF
         j6lSqOa5s2o6ahopdfcckfefwkzQO9kKrhnETe8fb2sseRZTJPsRp2hNoL19OLbqkEe1
         tn0Q==
X-Forwarded-Encrypted: i=1; AL+hErEK+85RBmQZIaqts7y0UzWwHSNYJRZpDMsvp2GFfO9sM0+8MJg+Msb5bk6sQBArHvwz3Hzn8Awg3JE9NSRObdqT@lists.infradead.org
X-Gm-Message-State: APuU4Z9BBiRn56YoKU4ZMK1DyTrK5uNRBnsTfVF3d6LxBEDk0llgMI64
	Y/kPZu59VdMSuhT++sGj6bJPy9GqQXhkOxTB0kfhVazGnZZgJcXcJXVM
X-Gm-Gg: AYBFou2AcDcJPis/A2+Im+T68QjONuGFrTBAdCxvqxcTDt4bADvSh0RIQPL/WTthsTO
	yfIrw9J6H6bzNLhw7U2HsyURdJYURWt9H/Az2nI4Sku5mcnizl+9hCnXZD42WOHUmZYv92WnTsh
	g1nu7h8OErxu/r8UkZZ0InvFAIEcvYBlXBXEw5sD1/cYS/SxjxizGm91jXYlCxR5Q8qRhqHtut3
	Fa0pMHXJaYr6Bv6aAYXePrvzZQYMGPpSgnmfk9yL1j2oGOMr2FhO7+fTDdAlcmaJibFAjc67g8e
	AQUj0bNu8ydBkBnqLGWVbYRcrsZxNkkuNVAxD1iRU+9syfJZZIbDxOA4uGzWXGIYsPAdD0yrZSh
	YVKYUMbv7sy417Q9FmRtvbvroCWaENa3zyvojpS8AhC//7l6AmVGdS8G/diIsoNwjTEEAYWLNiU
	Zt4gj2Z9lhl166KWxUrzpmJ2TpTYu8n+8unH66QBqWHAypEllxqO/AlrAmsfcSgOphYoXV3pAzi
	5r0FparZ9TJccz0ruGSx1TDgau/WpQKdphW/Zxhojkcy7boqmOyMQ4faQCjcklHZekyKO9JBVIF
	Xo3qtQaPZzS+EBvYF9BvOzQfNAnu11HPt1rQXeZTWsZejq5xVvgGI8W4+ZXLOUBUuQojpWgWrdr
	w24DzPtqf4hoXY0wFjx6TKJbdFab+Eg8U3S97hROEUKnePL8l9JWg240UV6TPffYy9keUDkQvok
	31Sm6H99zQZ/KbwOAIezURZCtCP1t3pr+m/FnxXDimWsc2DEMpuKTvU2sWi9h9rkBVKOibeApNt
	w==
X-Received: by 2002:a05:6808:1713:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5683c945eb5mr1088933b6e.19.1794280402120;
        Mon, 09 Nov 2026 19:13:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:57 -0700
Subject: [PATCH v9 08/11] serial: 8250_dw: configure the Allwinner H616
 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-8-3f03961dae8a@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_191323_360660_A239995B 
X-CRM114-Status: GOOD (  17.23  )
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and supply the fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth. Use the shared
DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
thresholds, with the normal half-full FCR setting selecting 128 bytes.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path for hardware CTS handling.

Select this configuration through the platform setup callback. H616
has debug-divisor and RS485 control registers overlapping the optional
DesignWare feature probes. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..a55f60330a51 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -657,6 +658,31 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	ret = dw8250_setup_rxtrig(p);
+	if (ret)
+		return ret;
+
+	/* Use software RS485 with the Allwinner register layout */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	return 0;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -880,6 +906,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.fifo_size = 256,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +964,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


