Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA3B606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tUjVxJJm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lplu+gP4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PdwIhtMyh/Zj8GrfiHHSk6eMRax1ynu3bKJ4+ALvLjk=; b=tUjVxJJmEfRR5UPDy9NHwjhpOS
	L6D1DvHdom5fpx3BYx9Bl8DGD+EZ0w7gjJQGJsqCmbarlVzYZAbJJnHH2Jr4ajOAgjpNUpNLRoN+L
	cOgVjVekEhZ4KRvDSyDMNyQP5Avq50rhXPQV9hVGMqFRBVBKrGc8VhkjGr8vv7K9LkiNAqvAqjquS
	eoIvPtEspBHr5P3O/0jZXEoHLjZyiRp2Q+JgKw7vjG/aXEmT2kGvg0ttSlLi2VQV2HTTaffiY+VRJ
	okh1I0f+rHrcsxJQlLhlrsR2/0A9aWZXadw0bXo2xjh1ajReQ4GJT3LsC54uKRVbo0ysXWETtE0KW
	/CBwqTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBKu-0000000DdhK-0QX6;
	Thu, 19 Nov 2026 23:14:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBKs-0000000Ddh6-3nHC;
	Thu, 19 Nov 2026 23:14:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD548600D1;
	Thu, 19 Nov 2026 23:14:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795130073;
	b=ra38V2xtOVnO14qz4jRkkb1maAMR6Ilt2gHuk1oa651AvzcFoLCzN9CHYEsArsVYKIYe
	 xemgrrs67/C1AzXKxj4zRcNnqPqswAg7TQRwsznI8s3RY8iVG2HZ7DzdnB+pUhWjq+TAW
	 fjCcWkZnaD1VC9fm+rDNYiB56VufhiRk29gc25+GF7lEIG2isa/FpvsgBfYo5Mo+ZoOrR
	 AyGKc0DoeF41JWOcv9Cb1OqMfDG2sMfFdtBTrI/HxJyAVZOZEGBwoqi7jsV07QtcNZmYj
	 m9UeGz1/By5R9CvvFQMwUAJ//K35+h1M85svKJglUtmdDqJk04drmej2ymoHHVD+pqw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795130073;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=PdwIhtMyh/Zj8GrfiHHSk6eMRax1ynu3bKJ4+ALvLjk=;
	b=oY/K+vDsYSjKbg5L03JAFkOeCwRk3RGx8LnJP4IB6XaOrPVTj2R5VFlqRraZEuTybSby
	 l/O9unXiYr7gpjPW5pHoixGFJIL+KMAri4IZ9t+60ltwV3vNQrcRfB45WaNn9cv8ScHxc
	 QmZw18SdGF+ofWtUnvztd44qT1nnRcXNcTW1q1YUCpc6xLT+0AYkwchMjeo4vgiB06rKy
	 Hl0CWNVbhbgsYwPmLkj6jOo65fKvSHMlFCIkxbxic2hbJV16cNBbkmMc8CEX9FVTW0KOr
	 agREQPg3NpMICx72ce0pOuKvFWcXLP+G4JeDtB/HI5MVXM448qWU7adQpQavFB9eYJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF95F1F000C6;
	Thu, 19 Nov 2026 23:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130073;
	bh=PdwIhtMyh/Zj8GrfiHHSk6eMRax1ynu3bKJ4+ALvLjk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=lplu+gP4tTydtQI4+wOPjb28uLAnhg5GnjcEwGCbu61xvSqSyPDDCE51QaS817tZT
	 3tKUykI/feDqLLIjFAjIvkq3IaraXSZCZaV6FmZC7s+J8C1NflQk5u/A92pK2/P8Yd
	 1KZ2K66KxfCBJZML4HCZ+2fdEbAKFTYHRu5nCPGtwuLP+JMfeDDRITfzPJEtYyMnHy
	 M6fAPntt/XAYvwhxHhaD7SQfOAD9o9WlW7X4cFBc2stUBhgcwgfHOfbIWyXdA0qXVj
	 6+xpxptv9COjixBZ8kmlIeZsKaHDM5snHw/S5RxgJQmWvRWcwpXhATmpFCLzUhXqEM
	 k5JAvzH872L4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 84A0E41B45;
	Thu, 19 Nov 2026 23:14:32 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 20 Nov 2026 01:14:30 +0200
Subject: [PATCH] irqchip/meson-gpio: Restore the channel setup after
 hibernation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-meson-gpio-hibernate-v1-1-462fdd55810a@iav.lv>
X-B4-Tracking: v=1; b=H4sIANaC/2oC/x2MQQqAIBAAvxJ7bkGFhPpKdChbbQ+paEQg/b2l4
 zDMNKhUmCpMXYNCN1dOUUD3HbhjjYGQd2EwylitjcKTaooYMic8eKMS14twEKdHv1vvLEiaC3l
 +/u28vO8HycQ6aGYAAAA=
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4669; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=8E657J8E9V1B6VWAcIoFiF9rMDrYJrYzKUQ3uwXqqLM=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn/m64f63MT/NzBfF2X+ZPwo+Qez9ff7eay8zz+kydnm
 GI1RXJqRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZiI2yNGhuZkx9wrdnwaKcGS
 pY/F6rbxG+3UO+IQJJuibnAnfVJMAsP/guTL9xgy1gTd+r+b54zcKbYJh8PvWNnf0N31hD3Ch8m
 VEQA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The GPIO interrupt mux takes the first free channel when an interrupt is
mapped, so the channel a pad gets depends on probe order. A hibernation
image is restored by a freshly booted kernel that maps the interrupts in
its own order, and the controller may lose power while the image is on
disk. The restored kernel keeps its channel table, but the hardware
routes the pads as the boot kernel set them up.

On ODROID-HC4, after a power cut during hibernation, PIN_03_SEL changed
from 0x54521a3b to 0x001a523b: the PHY and RTC channels swapped, the
PHY interrupt ran the pcf8563 handler and the link was never reported.
This happened on 7 of 11 restores.

Save the register block in syscore suspend and write it back in syscore
resume. create_image() calls them around the snapshot, so the image's
own setup comes back.

Tested on ODROID-HC4: 10 restores after a power cut, the registers and
the network came back every time.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on ODROID-HC4 with v7.3.5 and v7.4-rc3 based kernels: hybrid sleep, power removed while asleep, image restored on the next boot.
---
 drivers/irqchip/irq-meson-gpio.c | 53 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index e0329ef5e4a2..009576633ff7 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -15,6 +15,7 @@
 #include <linux/irqchip.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/syscore_ops.h>
 
 #define MAX_NUM_CHANNEL 64
 #define MAX_INPUT_MUX 256
@@ -245,6 +246,9 @@ struct meson_gpio_irq_controller {
 	u32 channel_irqs[MAX_NUM_CHANNEL];
 	DECLARE_BITMAP(channel_map, MAX_NUM_CHANNEL);
 	raw_spinlock_t lock;
+	struct syscore syscore;
+	unsigned int nr_regs;
+	u32 *saved_regs;
 };
 
 static void meson_gpio_irq_update_bits(struct meson_gpio_irq_controller *ctl,
@@ -633,6 +637,35 @@ static const struct irq_domain_ops meson_gpio_irq_domain_ops = {
 	.translate	= meson_gpio_irq_domain_translate,
 };
 
+/*
+ * The kernel that restores a hibernation image routes the channels in its
+ * own order; write back the image's setup.
+ */
+static int meson_gpio_irq_suspend(void *data)
+{
+	struct meson_gpio_irq_controller *ctl = data;
+	unsigned int i;
+
+	for (i = 0; i < ctl->nr_regs; i++)
+		ctl->saved_regs[i] = readl_relaxed(ctl->base + 4 * i);
+
+	return 0;
+}
+
+static void meson_gpio_irq_resume(void *data)
+{
+	struct meson_gpio_irq_controller *ctl = data;
+	unsigned int i;
+
+	for (i = 0; i < ctl->nr_regs; i++)
+		writel_relaxed(ctl->saved_regs[i], ctl->base + 4 * i);
+}
+
+static const struct syscore_ops meson_gpio_irq_syscore_ops = {
+	.suspend	= meson_gpio_irq_suspend,
+	.resume		= meson_gpio_irq_resume,
+};
+
 static int meson_gpio_irq_parse_dt(struct device_node *node, struct meson_gpio_irq_controller *ctl)
 {
 	const struct of_device_id *match;
@@ -664,6 +697,7 @@ static int meson_gpio_irq_probe(struct platform_device *pdev, struct device_node
 	struct device_node *node = pdev->dev.of_node;
 	struct irq_domain *domain, *parent_domain;
 	struct meson_gpio_irq_controller *ctl;
+	struct resource res;
 	int ret;
 
 	if (!parent) {
@@ -683,10 +717,21 @@ static int meson_gpio_irq_probe(struct platform_device *pdev, struct device_node
 
 	raw_spin_lock_init(&ctl->lock);
 
+	ret = of_address_to_resource(node, 0, &res);
+	if (ret)
+		goto free_ctl;
+
+	ctl->nr_regs = resource_size(&res) / 4;
+	ctl->saved_regs = kzalloc_objs(*ctl->saved_regs, ctl->nr_regs);
+	if (!ctl->saved_regs) {
+		ret = -ENOMEM;
+		goto free_ctl;
+	}
+
 	ctl->base = of_iomap(node, 0);
 	if (!ctl->base) {
 		ret = -ENOMEM;
-		goto free_ctl;
+		goto free_saved_regs;
 	}
 
 	ret = meson_gpio_irq_parse_dt(node, ctl);
@@ -704,6 +749,10 @@ static int meson_gpio_irq_probe(struct platform_device *pdev, struct device_node
 		goto free_channel_irqs;
 	}
 
+	ctl->syscore.ops = &meson_gpio_irq_syscore_ops;
+	ctl->syscore.data = ctl;
+	register_syscore(&ctl->syscore);
+
 	pr_info("%d to %d gpio interrupt mux initialized\n",
 		ctl->params->nr_hwirq, ctl->params->nr_channels);
 
@@ -711,6 +760,8 @@ static int meson_gpio_irq_probe(struct platform_device *pdev, struct device_node
 
 free_channel_irqs:
 	iounmap(ctl->base);
+free_saved_regs:
+	kfree(ctl->saved_regs);
 free_ctl:
 	kfree(ctl);
 

---
base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
change-id: 20261120-meson-gpio-hibernate-561119fd6fc6

Best regards,
-- 
Igor Velkov <iav@iav.lv>



