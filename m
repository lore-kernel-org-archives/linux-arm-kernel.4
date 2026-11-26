Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD38606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bpumk6rg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnP9ta3A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UnNwggCwKCjSqWmbRtTc0QeuSXjE6eofUZP3n/Jxdsw=; b=bpumk6rg1GLoVpdBEOlpPgBYzy
	5wQmQQW9flhCexcC8PB98wOvP9UqAedeTAWzQxh5Ga9Ewm+A7ipDVpnbR9wdkA0oYXcrT602MjKH3
	cerPZ5vEu4hC6cq0SXqv1Iy3817vrslV/ibH8nKiL0XdHFDQcKFD2TTaiw0zuSTro8Xv+v/bgvpLc
	xPbkOHjfff/+ElTSr4U8uWpWGI+yB42J5z2InlEL/t+N7binQtBkFn8J+u6HJDiGPXvPoIz9K1Cwt
	PQ2X3UyhhD7RdQas+tp0a+Ayh0voEd+CfBv1Gd55BMj+nUaAhLLfdTPuSiV294XZK8ZcIG9ZbFnX9
	l34bRHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgAI-0000000ETFH-3CqY;
	Thu, 26 Nov 2026 20:33:58 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgA0-0000000ET8x-2F5Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:33:42 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-5722bc8ddc5so2527592b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725219; x=1796330019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnNwggCwKCjSqWmbRtTc0QeuSXjE6eofUZP3n/Jxdsw=;
        b=VnP9ta3AGAUDnhYyec5nAlcwJFX+P5Fs6ZBD00XoEin2PsdmOjNDcBD8EwFVthW1oE
         zfgCfIiFSUO10MDC5yjrE+oakZJ9A3uOBCsOZDj5svWDyrB/meGfWGtjy1HuuN62GgPE
         tbF2AazetzOOq7HMlBKmXtBaCX8gFtZAXrDo4QTcGXKrrI6dZGZqAUHnJQPz6zXXgrG5
         uf82fNYQU3f4jEvVFZwGPH6WBCf6t03lw93IwiVzo6ptRIwbnOqT5C4tsJtrWgmBLzyi
         Zl2+KXUhxkjQo63/In2HdXZFmERQDz/Mx5c0CoOAKFuWRfrNYSoOepRc7d+3U3n09VD+
         WDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725219; x=1796330019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnNwggCwKCjSqWmbRtTc0QeuSXjE6eofUZP3n/Jxdsw=;
        b=ODoHCHNfG1Iu+UdqOmQJ8uscWu0JD6XDMMsA3jEKzXPgUYlNsAGmd2DoCqKLkxPzsS
         avm7WrWGxqa67IXAHDkc0/2FltSULpiK4nLyzOLGThdft20NBs2wrJMDhSgLw01l6APT
         a56Qy+tRxNM3Ry5VsrL7+7WQ/H33gfpRWK3PzbLvnxGcMGDWoL7mK+DCZLEFt2eQoypw
         UBYW2e2zswiCDGD/NGl3qDynNdXPS+l0+5SN3a08iMeEWyLUkkjszXzPwJbUpuznA5YW
         KoSeK3H4GhHxt0/JqtcPCrn8AZ54gdQFFTiigr8ss4oarvxDZNfonveh9E+sJiPPePRx
         f95Q==
X-Forwarded-Encrypted: i=1; AL+hErE+OC7GPzrIFLcRJcsj2Xag3QVZyELdXJGnGs90ZiObYa5MNNHau5GSmdRlJcUC2pSH0VGuLii3Pc90zUjzRws3@lists.infradead.org
X-Gm-Message-State: APuU4Z//PsXMSyj6M2SH31lXOu3WJEwgmYqT8k5Y3iOaCEuBQRQhq4Jd
	iRKgx1xTjBiqkocjB1SkrzPDua3/mlzZRtay9wvOb6/QFqeCK3W0bqDg
X-Gm-Gg: AZFdTZdk8qRRRWpwaW1MAWNAG2D3GsapANDrHiz6EEkpYlYaYTQNSjh6dfpRM7/kQN4
	pvFJ/hbmxssAfkJscibN/Knok7Uf7WjUMr+F57kFk3ah6RAbP4vV+EZ8MjTF//ycl8q0o27Gu6q
	DcLD5VkPHIZOXWxo+FZkys9qnv6qCnvzPv+amGb+sjEPIgwXxB4AzgCGnbKbRi5R1jrZKloscbx
	MoXEYOvUxv9WBUMpaEMzSC12MakMQThtxt4/cBNP6/r3gfdao7aawVezQtbMOqumztUubCC6IEN
	VR8Yz2z4gfkOAiHtH4aMNN3h3kXoOAzJTpHXujjsR2J1ZK08QzdpKOCoeubHG9PSJm7Cpk2auaN
	uDA8LWsd2hljbhgLWtd1NAG4Hpk1vX7zW7DSTT6NjJH1enXPB7AmBx/jp9VtpZw6IPOCUoPv/O+
	lN6v4gectFTQxaslTjY/9CFrbYY9eaJ8t46oSTIL0aY+gwkc++bVm/5kL57pYG/+sYrETjyA6PE
	AIXiMpPXie0HOKh/henZRLGHFfW46nvN6bCqz8+6QEZxmdqIA9qWVQD4HTL7x9uB/HJwJxXF8Z2
	mtg/IVaHSyQI1DN7OI+Q6n3Dsw3lk8WqwUTswKbOeWMDbd2rLQAoT2xVzt9kIh9L2dbGtTLY8c0
	kU8m7Ag==
X-Received: by 2002:a05:6808:67c7:b0:575:7930:e650 with SMTP id 5614622812f47-57a0c9c4596mr21951267b6e.54.1795725219040;
        Thu, 26 Nov 2026 12:33:39 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61659cb8sm21247024fac.17.2026.11.26.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v4] pinctrl: sunxi: use automatic voltage detection on A733
Date: Thu, 26 Nov 2026 15:33:36 -0500
Message-ID: <20261125-a733-pinctrl-v4@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123340_600862_9122EF5F 
X-CRM114-Status: GOOD (  17.65  )
X-Spam-Score: -2.1 (--)
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

A733 uses two-bit voltage-mode fields, but the handlers selected when
v7.4-rc1 added A733 support program them as one-bit fields. The R-PIO
handler also writes an A523 control register absent on A733.

Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
POW_MOD_SEL at controller init and skip per-pin voltage setup. Use it
for both A733 controllers: the A733 User Manual v1.00 documents 01 as
auto in sections 18.14.6.1 and 18.14.7.20. Give A733-R a separate
descriptor so A523-R keeps its existing voltage handling.

On Orange Pi 4 Pro, the one-bit handler leaves bank H in 1.8 V mode
while supplied at 3.3 V, breaking RGMII Gigabit TX. Alastair D'Silva
reported that selecting auto mode restores TX.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Link: https://lore.kernel.org/r/20261107000135.6b684277@ryzen.lan
Reported-by: Alastair D'Silva <alastair@d-silva.org>
Closes: https://lore.kernel.org/r/20261125115703.3724690-1-alastair@d-silva.org
Suggested-by: Andre Przywara <andre.przywara@arm.com>
Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z
Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v4:
- Rebase onto pinctrl fixes after the EINT-mux fix (context only).
- Carry Vinicius' and Norman's Tested-by tags from v3 (code unchanged),
  and credit Alastair's report.

v3: https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
v2: https://lore.kernel.org/r/20261104-a733-pinctrl-v2@gmail.com
Replaces Andre's RFT: https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com

Tests: arm64 defconfig and W=1 sunxi build. Vinicius tested v3 on A7Z.
Norman tested on Cubie A7S with v7.3.6 plus A733 patches, this patch
and Pablo's IRQ-bank series backported, with his voltage-mode patches
removed. POW_VAL matched the schematic; 3.3 V SD High Speed and GPIO
IRQs on PK0, PB0 and PJ24 worked.
Not tested: v4 on hardware, 1.8 V SD switching, A523, pad voltages.

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 19 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  7 ++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  2 ++
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..006754c0645f 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,28 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index 456d9170c2a2..c66f57385075 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -23,7 +23,7 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf4ec4665e2b..e54ed9e0b403 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -732,7 +732,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 	u32 val, reg;
 	int uV;
 
-	if (!pctl->desc->io_bias_cfg_variant)
+	if (pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_NONE ||
+	    pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_AUTO)
 		return 0;
 
 	uV = regulator_get_voltage(supply);
@@ -1655,6 +1656,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	/* Select auto (01) for every bank, including shared VCC-IO. */
+	if (desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_AUTO)
+		writel(0x55555555, pctl->membase + pctl->pow_mod_sel_offset);
+
 	/*
 	 * Seed the output latch shadow from the hardware so pins the
 	 * bootloader left in output mode keep their state; see
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..7b36c5c2263e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -130,6 +130,8 @@ enum sunxi_desc_bias_voltage {
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
+	/* Two-bit PIO_POW_MOD_SEL fields set to automatic voltage detection. */
+	BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 struct sunxi_desc_function {

base-commit: 721850a3086d109c7ea5841673766a393747e4f1
-- 
2.53.0


