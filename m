Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y9t/noae;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjdELp7n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o723m0djv4llTVaMLMWyJBdlGd6TGnVmWvYWsA2QBxE=; b=Y9t/noae4LVq7B+RZu+OFVWREO
	H7I2NPbS/V2FFu4u0sgyY6V1oVr6LKg495UR+yJKDxk9iP5uQrq1lqe8JcLjojek4O/5fKTCTzLLN
	8lXtRN5Pe7FCBWA5JGffM3YAT6szQcXQ59KEYbbxFDt58Qr4lQb8gw21/g+bckSA8uCEB7wQwXAdM
	AAkTRx0rdW6ef9JW3zKK9rFQwpLiBSmM0a1HYc6NQ/NbewxRwEHt8VCF1/xvPivgJIxJwGQXhCp2Q
	ONJI0O/u8rorWYcv32HCVQB2ae5yn1QVIvqNWhrl/rcdUFewP/cnLme8hsrTS2vgTE+KqK4j8MgyN
	viTq1WjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ2K-00000004YwV-2J0k;
	Mon, 23 Nov 2026 18:45:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ1e-00000004YRO-3YUq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:44:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D5A4662455;
	Mon, 23 Nov 2026 18:44:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459465;
	b=FAg3B6bouq3U+ydWXpOhDHsbouVTsvWSLcnpIQS+GTb763yBw1Ii00tuoam7ckyhkpoW
	 eOJI+1NNlW7wBbdqEmHYJEYE4Hx4M2F6fX/H0rimIbz5Yw8LCxOkJOyTSBqkdQ0Esd19j
	 ZecO5Wi/9N6FbzVJmryssT7WAWjvxJ+IU4ISFNrw7fN5Es3wNqnGjsuWlbx1n0aNrMnur
	 QqfGLA2wqww3Ea03E9tV1Sfb8bLrNLHIzmYURgFRCOWXP/zr5YRL5/kMO914MnFuyYMbz
	 T4OIzm0E6JlI/ngAVuv1TCe/kroOtHzz3f9y2SCsUR0iQ9mHzUSMwv2H4K0w+kX7cfw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459465;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=o723m0djv4llTVaMLMWyJBdlGd6TGnVmWvYWsA2QBxE=;
	b=aMm/l40pQ6j2r2Vqhnx5Um2h4vZ9DKIQcOybm4IlwdQA+R7Agkw29SoXRlMbVW4MOE3y
	 m7+3+HAPodjFr+ba35Ky1DM57umnki9VQLF6HegGvragPSImfj13bfAn0l6q2uOkmdthW
	 dYLUdMqbffSfolqOdQ0/P/q7jRh03UprovQBo4xWm8doWrR8t29WOrP+bDZRAUgyPqBJ6
	 P3N8d4J98/2H0GGwOrl8XLDonpcpbPD35/X5fSuPlPkc+zgp/q3Dmx2rSNQaCqcZd8FDv
	 yUShuBSdDyo/wfygNLq+7OQU7ci7S35FKQ0v41OXQkPIvJrdZ2ubsyj2NkWG+5xfyaQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F05881F000ED;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459465;
	bh=o723m0djv4llTVaMLMWyJBdlGd6TGnVmWvYWsA2QBxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WjdELp7nmuH604FdNWK/Lf2muE6pEPhUmUCEAn/9lMtnAObRVyLb/jBf58faUGQE6
	 kbYFpN8MvaX9+w91K6kQlfG51TcW9AanwRzTkPUxWwneVK/Hy4pGcjiWLkvDf6eDtH
	 vcrrvPyuxL9ycSXQ2tAz5u8WDeDkx9IMZ+aLyMYjQACurvE5MBq8MRIZfSgOjJVoBi
	 mDwQL8g+QhOn4vwFRd4Uz6bnvymxJRm8jPVzCOxoyLio9GTreVEM09WJJIDugA+F6Y
	 ePHGWar9FUhIfInmxUAiLGUt++73yV4AnCZvQ5mjj0kSRVF0sOt2FB7v9M1DvjuTcA
	 hYaVrTyz0PEtA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 53A454C5F5;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:44:11 +0300
Subject: [PATCH net-next 2/5] reset: Add Cortina CS7542 network engine
 domain control
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-ethernet-v1-2-fdb5e8c2d508@gmail.com>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459449; l=5565;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Ad0mfeyBbvzfZar0R5EFFyw87GP4uLfbc0CLfuGkDwY=;
 b=Y1kLU2a4JK6H4FID7LfLwqIXJMTjXZtgobCgCmdZNXVXcHeu66v8erxtssLMEV41yW1On2LKq
 lqixskegE8lDwvyNATBw6iPbcMb6q8Dc0iuW5yK27rjhuvNSIg/p89w
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Expose the NI, FE, TM, scheduler, QM, DMA-LSO/SSP and XRAM resets as one
exclusive logical domain. Change all owned bits in one masked
global-regmap update, preserve neighboring resets and require bounded
hardware readback. Return an error for a partially asserted domain.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/reset/Kconfig           |  10 ++++
 drivers/reset/Makefile          |   2 +
 drivers/reset/reset-cs7542-ne.c | 114 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a..8218d639f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -15,6 +15,16 @@ menuconfig RESET_CONTROLLER
 
 if RESET_CONTROLLER
 
+config RESET_CS7542_NE
+	tristate "Cortina CS7542 network engine reset domain"
+	depends on OF && HAS_IOMEM
+	select MFD_SYSCON
+	help
+	  Control the combined NI/FE/TM/SCH/QM/XRAM and DMA-LSO/SSP domain.
+	  The consumer must exclusively own the entire network and DMA block.
+	  Use this with the network engine driver when no separate SSP DMA
+	  consumer is enabled; the NAND controller may operate through PIO.
+
 config RESET_A10SR
 	tristate "Altera Arria10 System Resource Reset"
 	depends on MFD_ALTERA_A10SR || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6b..c24b8e281 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -55,3 +55,5 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
+
+obj-$(CONFIG_RESET_CS7542_NE) += reset-cs7542-ne.o
diff --git a/drivers/reset/reset-cs7542-ne.c b/drivers/reset/reset-cs7542-ne.c
new file mode 100644
index 000000000..81442c6a9
--- /dev/null
+++ b/drivers/reset/reset-cs7542-ne.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* The network engine and DMA-LSO/SSP reset domain has one exclusive owner. */
+#include <linux/bitfield.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#define CS7542_GLOBAL_RESET	0x04
+/* NI, FE, TM, SCH, QM, DMA-LSO/SSP, NI XRAM; never reset SDRAM (bit 4). */
+#define CS7542_NE_RESET_MASK	(GENMASK(3, 0) | BIT(5) | BIT(16) | BIT(17))
+
+struct cs7542_ne_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+};
+
+static int cs7542_ne_reset_update(struct reset_controller_dev *rcdev,
+				  unsigned long id, bool asserted)
+{
+	struct cs7542_ne_reset *rst = container_of(rcdev, struct cs7542_ne_reset, rcdev);
+	unsigned int value, target = asserted ? CS7542_NE_RESET_MASK : 0;
+	int ret;
+
+	if (id)
+		return -EINVAL;
+	ret = regmap_update_bits(rst->map, CS7542_GLOBAL_RESET,
+				 CS7542_NE_RESET_MASK, target);
+	if (ret)
+		return ret;
+	return regmap_read_poll_timeout(rst->map, CS7542_GLOBAL_RESET, value,
+				       (value & CS7542_NE_RESET_MASK) == target,
+				       1, 1000);
+}
+
+static int cs7542_ne_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return cs7542_ne_reset_update(rcdev, id, true);
+}
+
+static int cs7542_ne_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return cs7542_ne_reset_update(rcdev, id, false);
+}
+
+static int cs7542_ne_reset_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct cs7542_ne_reset *rst = container_of(rcdev, struct cs7542_ne_reset, rcdev);
+	unsigned int value;
+	int ret;
+
+	if (id)
+		return -EINVAL;
+	ret = regmap_read(rst->map, CS7542_GLOBAL_RESET, &value);
+	if (ret)
+		return ret;
+	value &= CS7542_NE_RESET_MASK;
+	if (value && value != CS7542_NE_RESET_MASK)
+		return -EIO;
+	return !!value;
+}
+
+static int cs7542_ne_reset_xlate(struct reset_controller_dev *rcdev,
+				 const struct of_phandle_args *spec)
+{
+	return spec->args_count ? -EINVAL : 0;
+}
+
+static const struct reset_control_ops cs7542_ne_reset_ops = {
+	.assert = cs7542_ne_reset_assert,
+	.deassert = cs7542_ne_reset_deassert,
+	.status = cs7542_ne_reset_status,
+};
+
+static int cs7542_ne_reset_probe(struct platform_device *pdev)
+{
+	struct cs7542_ne_reset *rst;
+
+	rst = devm_kzalloc_obj(&pdev->dev, *rst);
+	if (!rst)
+		return -ENOMEM;
+	rst->map = syscon_node_to_regmap(pdev->dev.of_node->parent);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst->map), "global syscon\n");
+	rst->rcdev.dev = &pdev->dev;
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.ops = &cs7542_ne_reset_ops;
+	rst->rcdev.nr_resets = 1;
+	rst->rcdev.of_node = pdev->dev.of_node;
+	rst->rcdev.of_reset_n_cells = 0;
+	rst->rcdev.of_xlate = cs7542_ne_reset_xlate;
+	return devm_reset_controller_register(&pdev->dev, &rst->rcdev);
+}
+
+static const struct of_device_id cs7542_ne_reset_match[] = {
+	{ .compatible = "cortina,cs7542-ne-reset" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cs7542_ne_reset_match);
+
+static struct platform_driver cs7542_ne_reset_driver = {
+	.probe = cs7542_ne_reset_probe,
+	.driver = {
+		.name = "cs7542-ne-reset",
+		.of_match_table = cs7542_ne_reset_match,
+	},
+};
+module_platform_driver(cs7542_ne_reset_driver);
+
+MODULE_DESCRIPTION("Cortina CS7542 exclusive network engine reset domain");
+MODULE_LICENSE("GPL");

-- 
2.53.0



