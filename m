Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAFD606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUUzKvsZ;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VJWxlhqG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LIu6WsJHKJFRsOsF3GE3b4oKEPTpD1wZCTNjz/N1DdI=; b=bUUzKvsZFkslqzxX2IBWFDiF/l
	GJk4tA3jM8r7knAjXUdsme9lGNNVAqvA9HSrF9Y1Tby61l8AVz/HOwbL5ENlbdJQAc3ytqr4VXCHu
	Po+DCTZ9qGyT/L1rIrqw1h3xlWPtjLeDAguh/bMWdzXILvJsBQr/yIlJ/cFRLasQh9Xbq43JoH/OW
	tbUH42pGnxK1EXotvCc2yBzjF7kPfZLMS5QU4Ag8RxH/ClBKnwEFnZYj9lz/riA9LUDIvQUbrCEww
	YjX8rJOzKWQLweK7cNX/9YHwFsMk36tMZCxyWobnwCEkoiKsTMw9g9UG24Ia0Yd2oh8XVG+1NwXks
	cE38c+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWSh-000000046p8-0jTH;
	Mon, 23 Nov 2026 16:00:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWS9-000000046as-2l5X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:59:47 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so568553766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795449576; x=1796054376; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LIu6WsJHKJFRsOsF3GE3b4oKEPTpD1wZCTNjz/N1DdI=;
        b=VJWxlhqGPBiN56lJWN0oEu3NCgX5KteKxtFd5zlix88pTAEXcW/rFx3xfWoy4KiwoF
         uMXdBzejocWEysl9uBnEpPCu3jcxvaIenlRQd+KJJm13KMiojnrATSu8M4mFKYYn7/H9
         7FGv3hDRvxfRlQmSw64324u7ezruDFLvtQhkm1c/NLmisSoNf1/Yeu2WKVCeI4MvyaDT
         Dlt41bfcJVdkqFgSbECXgGEYlm6j9AX9Vpequ9wXn2Vsw1vIKdn8XJrUk67l6pywAptO
         ryhsq+nTZppZYW/7ak8Fcfhsu7/MAygYTaVQWQHBcUB4TB17BlKW2bTTb4ZdClo6X9Fl
         B5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449576; x=1796054376;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LIu6WsJHKJFRsOsF3GE3b4oKEPTpD1wZCTNjz/N1DdI=;
        b=zSnjX9J4Ba5jwXUK7Kcrjg3ovtICnQwl6kiA5lM7+B7T5WRTnPq2pOeuD1SlwiM9ZF
         d1t/20CIFBNeP3HShoLRaQ3W8/HkDwmeWXYsJip41TLs3W/d1xrDTDnMjd6AtFdrX3SY
         T6vf04y+ROKgrWm5Sdg82A2+f8jG0J7YkA6xysVrWZq7K/Nu8xh5GexpcN8zsVM0TLN5
         iKLlBTZyX68CgoQXbGwXWL3Mg6889w0piZTxH9B1JKCw+/KZt0LwrLPjgU+aRC8AIZcy
         cClChBdrROjky009DOw8VOPxb3rMHu3bW2Z+P1GBWFAEreSmr6K3W1wm1acHkX0mFGF8
         6vhQ==
X-Forwarded-Encrypted: i=1; AL+hErFpBmUId7VELr41q757kgZJI3B/sC3r7BqeipXOYcc9FlHyA0wkENJVt/todLbZxpAc8elXQVc1zDg+MjCFw3uV@lists.infradead.org
X-Gm-Message-State: APuU4Z8hDrVfSM4tIsiWkCwRVgwnbGp8I7EU8EwnDp2GjL9cgXpkhz8W
	xPMFxB31hy18ocKUBc9/R0V1PNghsMmsOsfzCcGfNFu0YVHO5sopPNbL1nfEHJpSfjw=
X-Gm-Gg: AZFdTZeU+jg1xZJH05kIEOE5SRHIyePYK2oV+LJ2oHTfPBQ9PuksJEYBcWnfs6jhhRE
	ZMjcZEpTIvY3h0kJIFZXG9+9r/6P+MBM8ghddGzIx4f/G80VAfs9dspPEzxdRUddOwEfD4pXZBI
	KV2kzX38KqTe6/KrqeYWqUHB7SObm9K8JSlyHPqZr2jzPTeNTSssMxZSTApYg629R2wafW1KfPe
	BiMMBzUV/0NDabGXUB4WyhDTD33ltRAAkecr3gYWibvSKms0vCRyFDPCKaiE1yMZUoOpZMffYGW
	JwXgYqJBgd71Pj42a+dMKPV7c250cboPHMCo0UekI2PsBBcg2YL3BqkjQJv/RbiD39HJPwpFvQ3
	fo61GXvEq7sA65pYsJsP8s9YNIqEkhH1ZuX3PJckx3InO5hE+iSYlbnBYnnnY0ocNDq4hMwNWhc
	QAAYMaWsMxq/8Y+1PFAhYQ0Y2bCl1SfTFjx3mmPb9GuVnxE/HQJdwoT/ZgGG4PgziF8aiIh+7oW
	hoiweoBIos+Nhu5rTWz1zJ1wLYfcM0DBlLs015sh2vBmQ98ThN8ciXylmrKCmhqEGSiXfLaGwfx
	V0Hz+rKmGB1ggx7DDZFvCcK3i0YbjTbeBLdfb5svlgapw5+JB0m+VBPIXeOh5DJPxzmH/hWatRL
	OWWaTZvyG6X2uTmfHWLrg0Tb0XuuZ6EJG/0sJXZo=
X-Received: by 2002:a17:907:4d0:b0:c51:f6:216a with SMTP id a640c23a62f3a-c513aaa8eebmr811622866b.37.1795449575576;
        Mon, 23 Nov 2026 07:59:35 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc5396sm419467766b.58.2026.11.23.07.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:59:35 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 15:59:32 +0000
Subject: [PATCH] pinctrl: samsung: keep bus clock enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-samsung-pinctrl-busclk-v1-1-6732c10a7f48@linaro.org>
X-B4-Tracking: v=1; b=H4sIAORiBGsC/x3MQQqDQAxA0atI1gZMxFa8SnExTjM2qFOZqAji3
 Tt0+Rb/X2CSVAy64oIkh5p+YwaVBfiPi6OgvrOBK34QcY3mFtvjiKtGv6UZh938POGTiQJ7rkL
 TQo7XJEHP//jV3/cPa4YQQmgAAAA=
X-Change-ID: 20261123-samsung-pinctrl-busclk-7211f2c20f58
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_075938_136881_93D1F3FB 
X-CRM114-Status: GOOD (  20.87  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_PROVE_RAW_LOCK_NESTING=y, lockdep reports:

    [ BUG: Invalid wait context ]
    irq/130-1-0025/196 is trying to lock:
    (enable_lock){....}-{3:3}, at: clk_enable_lock+0x68/0x110
    other info that might help us debug this:
    context-{5:5}
    locks held by irq/130-1-0025/196: 1, on CPU#0:
     #0: (&irq_desc_lock_class){-.-.}-{2:2}, at: irq_finalize_oneshot
    Call trace:
     _raw_spin_lock_irqsave+0x60/0x98
     clk_enable_lock+0x68/0x110
     clk_disable+0x34/0x68
     exynos_irq_unmask+0xd8/0x1c0
     unmask_threaded_irq+0x58/0x80
     irq_finalize_oneshot.part.0+0x98/0x108
     irq_thread_fn+0x68/0xc0
     irq_thread+0xd0/0x1e0
     kthread+0x118/0x138
     ret_from_fork+0x10/0x20

The driver enables the optional bus clock ("pclk") around each register
access using clk_enable() and clk_disable(). Both acquire the clock
framework's enable_lock, which is a spinlock_t. On PREEMPT_RT,
spinlock_t turns into a sleeping lock and must not be acquired in hard
interrupt context or while holding a raw_spinlock_t. Most register
accesses happen in such contexts:

* The IRQ core invokes the irq_chip callbacks .irq_mask(),
  .irq_unmask(), .irq_ack() and .irq_set_type() with the raw_spinlock_t
  irq_desc::lock held.
* exynos_irq_demux_eint16_31() is a chained interrupt handler and runs
  in hard interrupt context.
* The gpio_chip callbacks don't sleep, so GPIO consumers may call them
  in hard interrupt context or with a raw_spinlock_t held.

Lockdep reports this only when enable_lock is contended, because
clk_enable_lock() tries spin_trylock_irqsave() first and lockdep
doesn't check the wait context of trylocks.

Enable the bus clock once during probe instead, keep it enabled for as
long as the driver is bound, and drop all per-access clk_enable() and
clk_disable() calls. Also revert samsung_pinmux_setup() back to void
and drop the now-unused pclk member of struct samsung_pinctrl_drv_data.

This reverts only the per-access clk_enable()/clk_disable() portion of
commit f9c744747973 ("pinctrl: samsung: support a bus clock"). The
driver still has to acquire and enable the bus clock: without a
consumer, the clock framework turns off unused gate clocks on kernels
or DTs without automatic clock gating, and gs101's alive GPIO clocks
don't set CLK_IGNORE_UNUSED.

The in-tree DTs provide this clock for Google Tensor gs101 only. Since
commit 298fac4f4b96 ("clk: samsung: Implement automatic clock gating
mode for CMUs"), the gs101 clock driver registers this clock as an
automatically gated clock, for which the enable and disable operations
are no-ops, so keeping the clock enabled doesn't stop the hardware from
gating it. Without automatic clock gating (in older kernels, and with
old DTs whose CMU register range size is not 0x10000), the clock stays
enabled for as long as the driver is bound.

The DT binding requires this clock for Exynos8890 as well, but the tree
contains neither a DT nor a clock driver for Exynos8890.

Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  |  80 ----------------------
 drivers/pinctrl/samsung/pinctrl-samsung.c | 106 +++---------------------------
 drivers/pinctrl/samsung/pinctrl-samsung.h |   2 -
 3 files changed, 9 insertions(+), 179 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index c45da9f13411..8adfeae96566 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -13,7 +13,6 @@
 // the Samsung pinctrl/gpiolib driver. It also includes the implementation of
 // external gpio and wakeup interrupt support.
 
-#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
@@ -69,12 +68,6 @@ static void exynos_irq_mask(struct irq_data *irqd)
 	else
 		reg_mask = our_chip->eint_mask + bank->eint_offset;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for masking IRQ\n");
-		return;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = readl(bank->eint_base + reg_mask);
@@ -82,8 +75,6 @@ static void exynos_irq_mask(struct irq_data *irqd)
 	writel(mask, bank->eint_base + reg_mask);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
-
-	clk_disable(bank->drvdata->pclk);
 }
 
 static void exynos_irq_ack(struct irq_data *irqd)
@@ -98,15 +89,7 @@ static void exynos_irq_ack(struct irq_data *irqd)
 	else
 		reg_pend = our_chip->eint_pend + bank->eint_offset;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock to ack IRQ\n");
-		return;
-	}
-
 	writel(1 << irqd->hwirq, bank->eint_base + reg_pend);
-
-	clk_disable(bank->drvdata->pclk);
 }
 
 static void exynos_irq_unmask(struct irq_data *irqd)
@@ -134,12 +117,6 @@ static void exynos_irq_unmask(struct irq_data *irqd)
 	else
 		reg_mask = our_chip->eint_mask + bank->eint_offset;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for unmasking IRQ\n");
-		return;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = readl(bank->eint_base + reg_mask);
@@ -147,8 +124,6 @@ static void exynos_irq_unmask(struct irq_data *irqd)
 	writel(mask, bank->eint_base + reg_mask);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
-
-	clk_disable(bank->drvdata->pclk);
 }
 
 static int exynos_irq_set_type(struct irq_data *irqd, unsigned int type)
@@ -159,7 +134,6 @@ static int exynos_irq_set_type(struct irq_data *irqd, unsigned int type)
 	unsigned int shift = EXYNOS_EINT_CON_LEN * irqd->hwirq;
 	unsigned int con, trig_type;
 	unsigned long reg_con;
-	int ret;
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -192,20 +166,11 @@ static int exynos_irq_set_type(struct irq_data *irqd, unsigned int type)
 	else
 		reg_con = our_chip->eint_con + bank->eint_offset;
 
-	ret = clk_enable(bank->drvdata->pclk);
-	if (ret) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for configuring IRQ type\n");
-		return ret;
-	}
-
 	con = readl(bank->eint_base + reg_con);
 	con &= ~(EXYNOS_EINT_CON_MASK << shift);
 	con |= trig_type << shift;
 	writel(con, bank->eint_base + reg_con);
 
-	clk_disable(bank->drvdata->pclk);
-
 	return 0;
 }
 
@@ -242,14 +207,6 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	ret = clk_enable(bank->drvdata->pclk);
-	if (ret) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for configuring pin %s-%lu\n",
-			bank->name, irqd->hwirq);
-		return ret;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	con = readl(bank->pctl_base + reg_con);
@@ -259,8 +216,6 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	clk_disable(bank->drvdata->pclk);
-
 	return 0;
 }
 
@@ -275,13 +230,6 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for deconfiguring pin %s-%lu\n",
-			bank->name, irqd->hwirq);
-		return;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	con = readl(bank->pctl_base + reg_con);
@@ -291,8 +239,6 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	clk_disable(bank->drvdata->pclk);
-
 	gpiochip_unlock_as_irq(&bank->gpio_chip, irqd->hwirq);
 }
 
@@ -342,19 +288,11 @@ static irqreturn_t exynos_eint_gpio_irq(int irq, void *data)
 	unsigned int svc, group, pin;
 	int ret;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for handling IRQ\n");
-		return IRQ_NONE;
-	}
-
 	if (bank->eint_con_offset)
 		svc = readl(bank->eint_base + EXYNOSAUTO_SVC_OFFSET);
 	else
 		svc = readl(bank->eint_base + EXYNOS_SVC_OFFSET);
 
-	clk_disable(bank->drvdata->pclk);
-
 	group = EXYNOS_SVC_GROUP(svc);
 	pin = svc & EXYNOS_SVC_NUM_MASK;
 
@@ -729,20 +667,6 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	/*
-	 * just enable the clock once here, to avoid an enable/disable dance for
-	 * each bank.
-	 */
-	if (eintd->nr_banks) {
-		struct samsung_pin_bank *b = eintd->banks[0];
-
-		if (clk_enable(b->drvdata->pclk)) {
-			dev_err(b->gpio_chip.parent,
-				"unable to enable clock for pending IRQs\n");
-			goto out;
-		}
-	}
-
 	for (i = 0; i < eintd->nr_banks; ++i) {
 		struct samsung_pin_bank *b = eintd->banks[i];
 		pend = readl(b->eint_base + b->irq_chip->eint_pend
@@ -752,10 +676,6 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 		exynos_irq_demux_eint(pend & ~mask, b->irq_domain);
 	}
 
-	if (eintd->nr_banks)
-		clk_disable(eintd->banks[0]->drvdata->pclk);
-
-out:
 	chained_irq_exit(chip, desc);
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 0c91e1124a46..16980f4ef3b1 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -370,8 +370,8 @@ static void pin_to_reg_bank(struct samsung_pinctrl_drv_data *drvdata,
 }
 
 /* enable or disable a pinmux function */
-static int samsung_pinmux_setup(struct pinctrl_dev *pctldev, unsigned selector,
-				unsigned group)
+static void samsung_pinmux_setup(struct pinctrl_dev *pctldev,
+				 unsigned int selector, unsigned int group)
 {
 	struct samsung_pinctrl_drv_data *drvdata;
 	const struct samsung_pin_bank_type *type;
@@ -381,7 +381,6 @@ static int samsung_pinmux_setup(struct pinctrl_dev *pctldev, unsigned selector,
 	unsigned long flags;
 	const struct samsung_pmx_func *func;
 	const struct samsung_pin_group *grp;
-	int ret;
 
 	drvdata = pinctrl_dev_get_drvdata(pctldev);
 	func = &drvdata->pmx_functions[selector];
@@ -397,12 +396,6 @@ static int samsung_pinmux_setup(struct pinctrl_dev *pctldev, unsigned selector,
 		reg += 4;
 	}
 
-	ret = clk_enable(drvdata->pclk);
-	if (ret) {
-		dev_err(pctldev->dev, "failed to enable clock for setup\n");
-		return ret;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	data = readl(reg + type->reg_offset[PINCFG_TYPE_FUNC]);
@@ -411,10 +404,6 @@ static int samsung_pinmux_setup(struct pinctrl_dev *pctldev, unsigned selector,
 	writel(data, reg + type->reg_offset[PINCFG_TYPE_FUNC]);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
-
-	clk_disable(drvdata->pclk);
-
-	return 0;
 }
 
 /* enable a specified pinmux by writing to registers */
@@ -422,7 +411,8 @@ static int samsung_pinmux_set_mux(struct pinctrl_dev *pctldev,
 				  unsigned selector,
 				  unsigned group)
 {
-	return samsung_pinmux_setup(pctldev, selector, group);
+	samsung_pinmux_setup(pctldev, selector, group);
+	return 0;
 }
 
 /* list of pinmux callbacks for the pinmux vertical in pinctrl core */
@@ -445,7 +435,6 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
 	u32 data, width, pin_offset, mask, shift;
 	u32 cfg_value, cfg_reg;
 	unsigned long flags;
-	int ret;
 
 	drvdata = pinctrl_dev_get_drvdata(pctldev);
 	pin_to_reg_bank(drvdata, pin, &reg_base, &pin_offset, &bank);
@@ -457,12 +446,6 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
 	width = type->fld_width[cfg_type];
 	cfg_reg = type->reg_offset[cfg_type];
 
-	ret = clk_enable(drvdata->pclk);
-	if (ret) {
-		dev_err(drvdata->dev, "failed to enable clock\n");
-		return ret;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = (1 << width) - 1;
@@ -482,8 +465,6 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	clk_disable(drvdata->pclk);
-
 	return 0;
 }
 
@@ -574,22 +555,12 @@ static int samsung_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			    int value)
 {
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
-	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
 	unsigned long flags;
-	int ret;
-
-	ret = clk_enable(drvdata->pclk);
-	if (ret) {
-		dev_err(drvdata->dev, "failed to enable clock\n");
-		return ret;
-	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	samsung_gpio_set_value(gc, offset, value);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	clk_disable(drvdata->pclk);
-
 	return 0;
 }
 
@@ -600,23 +571,13 @@ static int samsung_gpio_get(struct gpio_chip *gc, unsigned offset)
 	u32 data;
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	const struct samsung_pin_bank_type *type = bank->type;
-	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
-	int ret;
 
 	reg = bank->pctl_base + bank->pctl_offset;
 
-	ret = clk_enable(drvdata->pclk);
-	if (ret) {
-		dev_err(drvdata->dev, "failed to enable clock\n");
-		return ret;
-	}
-
 	data = readl(reg + type->reg_offset[PINCFG_TYPE_DAT]);
 	data >>= offset;
 	data &= 1;
 
-	clk_disable(drvdata->pclk);
-
 	return data;
 }
 
@@ -661,22 +622,13 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
 static int samsung_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
-	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
 	unsigned long flags;
 	int ret;
 
-	ret = clk_enable(drvdata->pclk);
-	if (ret) {
-		dev_err(drvdata->dev, "failed to enable clock\n");
-		return ret;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	ret = samsung_gpio_set_direction(gc, offset, true);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	clk_disable(drvdata->pclk);
-
 	return ret;
 }
 
@@ -685,23 +637,14 @@ static int samsung_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 							int value)
 {
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
-	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
 	unsigned long flags;
 	int ret;
 
-	ret = clk_enable(drvdata->pclk);
-	if (ret) {
-		dev_err(drvdata->dev, "failed to enable clock\n");
-		return ret;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	samsung_gpio_set_value(gc, offset, value);
 	ret = samsung_gpio_set_direction(gc, offset, false);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	clk_disable(drvdata->pclk);
-
 	return ret;
 }
 
@@ -1028,7 +971,6 @@ static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
 	unsigned int value;
-	int ret = 0;
 	unsigned long flags;
 
 	switch (pinconf_to_config_param(config)) {
@@ -1045,19 +987,11 @@ static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		return -ENOTSUPP;
 	}
 
-	ret = clk_enable(drvdata->pclk);
-	if (ret) {
-		dev_err(drvdata->dev, "failed to enable clock\n");
-		return ret;
-	}
-
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	samsung_gpio_set_pud(gc, offset, value);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	clk_disable(drvdata->pclk);
-
-	return ret;
+	return 0;
 }
 
 static const struct gpio_chip samsung_gpiolib_chip = {
@@ -1257,6 +1191,7 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	struct samsung_pinctrl_drv_data *drvdata;
 	const struct samsung_pin_ctrl *ctrl;
 	struct device *dev = &pdev->dev;
+	struct clk *pclk;
 	int ret;
 
 	drvdata = devm_kzalloc_obj(dev, *drvdata);
@@ -1285,9 +1220,9 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 		}
 	}
 
-	drvdata->pclk = devm_clk_get_optional_prepared(dev, "pclk");
-	if (IS_ERR(drvdata->pclk)) {
-		ret = PTR_ERR(drvdata->pclk);
+	pclk = devm_clk_get_optional_enabled(dev, "pclk");
+	if (IS_ERR(pclk)) {
+		ret = PTR_ERR(pclk);
 		goto err_put_banks;
 	}
 
@@ -1335,13 +1270,6 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 	struct samsung_pin_bank *bank;
 	int i;
 
-	i = clk_enable(drvdata->pclk);
-	if (i) {
-		dev_err(drvdata->dev,
-			"failed to enable clock for saving state\n");
-		return i;
-	}
-
 	for (i = 0; i < drvdata->nr_banks; i++) {
 		bank = &drvdata->pin_banks[i];
 		const void __iomem *reg = bank->pctl_base + bank->pctl_offset;
@@ -1377,8 +1305,6 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 			drvdata->suspend(bank);
 	}
 
-	clk_disable(drvdata->pclk);
-
 	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
 		drvdata->retention_ctrl->enable(drvdata);
 
@@ -1397,20 +1323,8 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 {
 	struct samsung_pinctrl_drv_data *drvdata = dev_get_drvdata(dev);
 	struct samsung_pin_bank *bank;
-	int ret;
 	int i;
 
-	/*
-	 * enable clock before the callback, as we don't want to have to deal
-	 * with callback cleanup on clock failures.
-	 */
-	ret = clk_enable(drvdata->pclk);
-	if (ret) {
-		dev_err(drvdata->dev,
-			"failed to enable clock for restoring state\n");
-		return ret;
-	}
-
 	for (i = 0; i < drvdata->nr_banks; i++) {
 		bank = &drvdata->pin_banks[i];
 		if (drvdata->resume)
@@ -1448,8 +1362,6 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 				writel(bank->pm_save[type], reg + offs[type]);
 	}
 
-	clk_disable(drvdata->pclk);
-
 	if (drvdata->retention_ctrl && drvdata->retention_ctrl->disable)
 		drvdata->retention_ctrl->disable(drvdata);
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 7c60375d5924..5390c6d1d7a5 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -302,7 +302,6 @@ struct samsung_pin_ctrl {
  *             through samsung_pinctrl_drv_data, not samsung_pin_bank).
  * @dev: device instance representing the controller.
  * @irq: interrpt number used by the controller to notify gpio interrupts.
- * @pclk: optional bus clock if required for accessing registers
  * @ctrl: pin controller instance managed by the driver.
  * @pctl: pin controller descriptor registered with the pinctrl subsystem.
  * @pctl_dev: cookie representing pinctrl device instance.
@@ -322,7 +321,6 @@ struct samsung_pinctrl_drv_data {
 	void __iomem			*virt_base;
 	struct device			*dev;
 	int				irq;
-	struct clk			*pclk;
 
 	struct pinctrl_desc		pctl;
 	struct pinctrl_dev		*pctl_dev;

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261123-samsung-pinctrl-busclk-7211f2c20f58

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


