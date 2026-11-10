Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC043606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vCvlITDd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1XkSSy5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=; b=vCvlITDdgh/ee6
	vaOAh4DgTJDfNHjRjws6QFy+NI9UVdUM68sI+t3/4LvKtQCVvSQy5/G1PdanFhr2BubFI4zWEtSO2
	2HBh422V8oFCzq8EO4sNm/bUEH4j2zx/Qkk99qcOztrfhkuicUyhjtWq8yekFQ4H5GHK1fqKhHWmV
	Rh60fzgQdKsWthJeXKorjE/H5MEoa8PDnKbRhwTelpWxG78n55774nRIRHmSoOTUdGYqgFWcyA3gU
	/ro1XLJy450Qz+zITDm/W4IWa9E6qvEv+1F9H98sMATtxcJmMLcXfn+QeaORIlmgn1/Ktac2LE9eM
	RMAfCdCuMRteRcqTBdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIc-00000002Eqn-0ylO;
	Tue, 10 Nov 2026 03:13:30 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIY-00000002Ell-03ig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:27 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4f699fe49b3so1065771b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280405; x=1794885205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=s1XkSSy5d8aUmI96EknkuKId6K04ZzscL01629QqJR3vmgX7Xoc9nE+sn+1yi23Hlv
         AdVR87k6kQkM4XH9Z85tC3Nlox1iHDH2IDqZoa6f7kOWWBrLtmSrZP49doUN0p1+pkwe
         xSskMlAwXVDtESBVJ0jOs8pCOi1HzrVcoLq6S+Q6MbNmabpDXCun9y7bIOYAs2KvX/pR
         wmLKfP+w9LgpdNnQXjtBfoGRBbbHR2MMdYLbdTNoAaj4xc0j8I3UoOS6il1ou+PpJoA0
         6CIDX0w24Gpw7Qwx/gDvLGAMLG9uSD29z9bJj8TI1IpkEbW0U7Dh8/yyNgEE6WeU3GuT
         ICHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280405; x=1794885205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=ERHFXPnXhCnGSX9UGO1lfQs5W6EoWaT3GN3ipWmNDDQ95u9LNCRafSXdnzg2BSB1Bw
         oNTAWAnimboGX3Av9V41PHPPiQsPPBMcME/+C/NbcNukq2yQKFVbdl06LM6Xq7FupJzC
         go46EQVWW9BLTy5vMJTdSLg5ftJe3s6f2B3AUsKKUUGPB97E4Zcy0thuosWOPiW2Yx1x
         YWsJO0gUcqXk/1p0ZwyBk7RIU2BzxgnBrLRe6GZXF+5dgX/OsBmvAm2Mg9nuaVotIjd8
         sNcy+wpRjdYgv9OIiHEaJ7shOrDlBwHZhx4K5vqMlPGZXkvmwd1d56WsnjqlMQv85ax8
         DATw==
X-Forwarded-Encrypted: i=1; AL+hErEr8Jp4XqUrXT0lVm0ns5DUiZSx7pqUTwFOGuKhvn5Kw0piuVTXyNIZCjFsHaKoOIDpRaakEI573+mKANrDSjNz@lists.infradead.org
X-Gm-Message-State: APuU4Z+tgVSFc3fdK3QDbLY63DggIGabOeo4GNscTwz2Ohp97F/wQc0x
	Ki6NWrZ/KD7o6svyyL4P/FlW1Goz/lAygIxBEG/9ADpl5czf9HgZPxrfXjsR3MsC
X-Gm-Gg: AYBFou2jLBdod1x/lhgKkvLpWPPXks12U+Yiz32u10JbeQsMFYVmpcD37ItVqTajNF8
	DmdBRO3lljklqdA7qhTe1dG6VYvRPdjG2WK/erlQuuAavCDIfrmk3rC3GL0+EIo4p/qr7Uf17fD
	28N5wx6Yc8pTxXc1cXzqLFlIMIA8MYCnjGjMdXeC4vg6jc1hK52KSn++AGqbAXIWGkjvbmCGV8Y
	xZ7vzEcx+je3KkKUaWm6GaKW2mXmufbxB80Rut5rtzc0ZOsWb6NZx2QliCwrNBVeuuM+mj1Uorj
	FgIjO0kTBOdVxedihvmnlvw3ZaRtiOJuuCWwdNRxxoGiuQzt6ouuW34JevB1alMDiNtHKs7mzJ8
	zBQUKXC102/wTsvIjn2XponWp2sy6wgWEfmev06Rrxi4FJ70oxh6Qqn6fG2a+5tyvYPobcT853I
	KN6VfBd1UKwFXO/o4L43fyAXF2ogs9WXKLFMlHWDU6M3aTsoTYjYb1sW/fItBMDu/56ppVfRbYc
	2CYhhm7HIl0/CfqWr6aVdKjsiDlH3GFBsB10+w9hdDtri7CtadVGURnWNvJp7744l9rnDzSe5WF
	JkUGIRIPlP9jXrIpR2nmBilp4Sv2ZvKarYKMnMLte09xnOAUl+XV/LENY2UrbLkeQ3Nq83ufbqU
	kiYyFnwU8knn0DzlzjN1bswHeJsGt+5yQpRA7ummBDi4DFVMAomkCDjZvaAlJgqzAB/23Wp7nxh
	JlygE0aj2ivUdSKaIQVZSiYcA4v1DIuAvmbyB6HSKD8uVM4ufR11Fq
X-Received: by 2002:a05:6808:508e:b0:4d6:90f4:48ab with SMTP id 5614622812f47-5683cd1b07bmr1294602b6e.45.1794280405078;
        Mon, 09 Nov 2026 19:13:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:59 -0700
Subject: [PATCH v9 10/11] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-10-3f03961dae8a@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_191326_066798_79F3ED5B 
X-CRM114-Status: GOOD (  17.92  )
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

The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
offset 0xf0. The field holds a byte count, not a logarithmic encoding.

Read this field in the sunxi setup callback when platform data does not
provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
its 256-byte configuration without accessing FCC. The probe has already
enabled the clocks and deasserted reset before invoking the callback.
Leave the FIFO clock-control bits untouched.

Use the shared DesignWare trigger setup to validate the depth and build
the FIFO-relative threshold table. Invalid depths fail probe before
registration instead of producing zero or truncated thresholds. The 8250
core derives the transmit load from the discovered depth.

Select this setup for the A523 compatible. Like H616, this integration
has Allwinner-specific debug-divisor and RS485 registers overlapping the
generic DesignWare feature probes. Use the common sunxi PIO setup,
BUSY-safe integer divisor programming and software RS485 handling. Keep
the APB clock gate enabled during termios updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a55f60330a51..257baab5a3ed 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -44,6 +44,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -63,6 +67,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed FIFO depth; zero selects discovery during setup */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -666,7 +671,15 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
-	p->fifosize = data->pdata->fifo_size;
+
+	/* Apply given FIFO size or try to autodetect it */
+	if (data->pdata->fifo_size) {
+		p->fifosize = data->pdata->fifo_size;
+	} else {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
 
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
@@ -913,6 +926,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
 	.setup = dw8250_sunxi_setup,
 };
 
+static const struct dw8250_platform_data dw8250_a523_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -965,6 +984,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


