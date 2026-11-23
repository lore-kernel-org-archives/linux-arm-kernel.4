Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60AA606A690
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X8LpgU4f;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORixFn38
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OZXKO8Nlv27l8dDCmCRPLPT+qtuKAtiKetzeFk5MY4o=; b=X8LpgU4fchRu8TDBiw2kJ6FU/x
	LwXpAU0qIDLtccJQ0aSqtFQXrdIxHNOEmbP/kiOeMQy48ngOFUQJr9t5nh6YR2QTlfS9mNKouX+tZ
	3JIZ52QgrI49rrlCQNwVUGq6TQslTYyeldBFzQOB1ELwA9s2MM1cWJx5SCieM8iy2+kGpEdZpXU+O
	uZdXkE8JOLqMeaxEDdLNvWIiTo2P2pzqcd4Rz4CIYEMfOCMKlGBB134EpgNG9quqLJGVRmY1OPdG9
	lCOgJU8+KuCIMzynnGjLc/L0NNy8zSdMHDQmZ7CSDS0UC5guxztM9mAZsvJMI+nQ2ChCDeARn6CVE
	z7tdLyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ16-00000004XzE-0hAu;
	Mon, 23 Nov 2026 18:43:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ10-00000004Xvr-1qI3;
	Mon, 23 Nov 2026 18:43:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3441A40F45;
	Mon, 23 Nov 2026 18:43:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459426;
	b=OGZmdBdJI0O9tzhag8085ftK0aN3fYlUtG7QEcywaAN0DvNR6E2EUpXN8Rk57bJnc6MH
	 T6jXxNhgBzs6aN+tc3DC9+dJNjwdQePORxtqrt8syKYiPoNVb2lwVhBHVnZPdSlld4eI7
	 LBZBSAhqElKsBhA55qz4JdDQzvYtyMmdhHhwhXuVDYBV3STH9tS5BYyhzQvVIDrhKmYsz
	 RyMq7cp9seKp+TBL46rSrwRdnWJwe8d10E2MuCc/SI3O3cXqWY91uQ+2tkNNlMUxewhDm
	 JT1RMWuOjYRILDec60c56Gerft0BdRI1vupNbNlnxX9o8bR79zggaQIIGeENLe6yroQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459426;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OZXKO8Nlv27l8dDCmCRPLPT+qtuKAtiKetzeFk5MY4o=;
	b=qAaI/e/DXM42HszJYICqVoyPwqgknnOMSuZOrt7toNpYqbhV9BIMp6JEmRF6HAsAk7XK
	 Qc2kyQeyNp3WK0b2N3A3dAHSjMAcP6XallNg5ApEBa73DkstDofi2jAJqf8brHJhdZiA2
	 Kfyx3V5mgjfJ79fNNClnZu5i1dfHdFRHhH00hTewFeGb3GWaTCkeCYXDWAIZZEL/zk27l
	 CxkyOSX8Y5ptwI/PzHoP+J6TofNYx8ynw3OeFN6QuboUo07uqSPGvsI1Fazph6CVDtQ8l
	 r+UmzsjDVEL96HJ8XyTqsLYh2IsZEtyTocEM2K0gQrMfTZLNMsjljTKmeu/3a+50+zA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98FEE1F000D2;
	Mon, 23 Nov 2026 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459425;
	bh=OZXKO8Nlv27l8dDCmCRPLPT+qtuKAtiKetzeFk5MY4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ORixFn38aXMQ2DM02ZdDyRg003vO+Xm07VafMDAX6aoZzHDXahhUP4+NaUVn2RvAo
	 yX+OsuWtTn1RU0UzD20jBnSEaRaDyaurra44/EunVmWwpHzOUXW5slOPf5scHn+4aE
	 JEWYfWnnFRVXl22S2EFY0/RGaJdI4WeumQ3MHhBZubZ/bu2hfifscKSwjaS+l30qSO
	 sqCy9IXATw++UXNaXnZ6THWcu3fDzsG6b1ZCvsavpgA+Y8g7BuLhn1OKCcFRivc7QT
	 D4Zn+MbX7agE2rRl55SJ+eMicEyA/iGUyPAfGJ9AS3oiQS138PA3VwbLDSDNCUNHyh
	 IAvyn+w24DCew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 283994C5E5;
	Mon, 23 Nov 2026 18:43:34 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:43:31 +0300
Subject: [PATCH 3/8] clk: Add CS7542 PCIe gates and resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-pcie-v1-3-4cde5201d404@gmail.com>
References: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
In-Reply-To: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Krzysztof Wilczynski <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459409; l=6867;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=IQ3oYOkjhHmvjI099J9lb0QbUnLsKlUN+CsHrOCPogE=;
 b=bBrX5NDk5ovSGT+tLFaV3zfxL6wseB3LnVHHNP2SUFSz95ISHr57Dpw2LjCtsKecVU+I9kmDx
 UQjG/nzmimsB4na7FHqEBMZhC34rIaABbK1hTYE7RVDGeTgD95cMzDU
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

Use the shared global regmap for controller gates at bits 10, 12 and 14
and block resets at bits 6 through 8. Keep the AXI reset-disable bit and
SATA gates intact. Expose independent gate-only clocks and exclusive
reset controls with the vendor reset pulse timing.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/clk/Kconfig           |  11 +++
 drivers/clk/Makefile          |   2 +
 drivers/clk/clk-cs7542-pcie.c | 168 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 47b5265fe..4abd81260 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -605,4 +605,15 @@ config CLK_DIVIDER_KUNIT_TEST
 	help
 	  Kunit test for the clk-divider type.
 
+config COMMON_CLK_CS7542_PCIE
+	tristate "Cortina Systems CS7542 PCIe control"
+	depends on OF && HAS_IOMEM
+	select MFD_SYSCON
+	select RESET_CONTROLLER
+	help
+	  Enable the three PCIe clock gates and controller resets in the
+	  CS7542 global control block. Shared registers use the parent syscon.
+	  The clocks provide gating only, without a source frequency.
+	  The module is called clk-cs7542-pcie.
+
 endif
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 16b1168c8..8ebb794d0 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -187,3 +187,5 @@ obj-y					+= xilinx/
 obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
+
+obj-$(CONFIG_COMMON_CLK_CS7542_PCIE) += clk-cs7542-pcie.o
diff --git a/drivers/clk/clk-cs7542-pcie.c b/drivers/clk/clk-cs7542-pcie.c
new file mode 100644
index 000000000..c39977a25
--- /dev/null
+++ b/drivers/clk/clk-cs7542-pcie.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Cortina Systems CS7542 PCIe clock gates and controller resets. */
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#define CS7542_PORTS	3
+#define GLOBAL_RESET	0x04
+#define GLOBAL_CONFIG	0x10
+
+struct cs7542_gate {
+	struct clk_hw hw;
+	struct regmap *map;
+	u32 mask;
+};
+
+struct cs7542_control {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+	struct cs7542_gate gates[CS7542_PORTS];
+	struct clk_hw_onecell_data *clks;
+};
+
+static int cs7542_gate_prepare(struct clk_hw *hw)
+{
+	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
+
+	return regmap_update_bits(gate->map, GLOBAL_CONFIG, gate->mask, gate->mask);
+}
+
+static void cs7542_gate_unprepare(struct clk_hw *hw)
+{
+	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
+
+	regmap_update_bits(gate->map, GLOBAL_CONFIG, gate->mask, 0);
+}
+
+static int cs7542_gate_is_prepared(struct clk_hw *hw)
+{
+	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(gate->map, GLOBAL_CONFIG, &value);
+	return ret ? ret : !!(value & gate->mask);
+}
+
+static const struct clk_ops cs7542_gate_ops = {
+	.prepare = cs7542_gate_prepare,
+	.unprepare = cs7542_gate_unprepare,
+	.is_prepared = cs7542_gate_is_prepared,
+};
+
+static int cs7542_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct cs7542_control *ctl = container_of(rcdev, struct cs7542_control, rcdev);
+	u32 mask = BIT(6 + id);
+
+	return regmap_update_bits(ctl->map, GLOBAL_RESET, mask, assert ? mask : 0);
+}
+
+static int cs7542_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return cs7542_reset_update(rcdev, id, true);
+}
+
+static int cs7542_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return cs7542_reset_update(rcdev, id, false);
+}
+
+static int cs7542_reset_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct cs7542_control *ctl = container_of(rcdev, struct cs7542_control, rcdev);
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(ctl->map, GLOBAL_RESET, &value);
+	return ret ? ret : !!(value & BIT(6 + id));
+}
+
+static int cs7542_reset_pulse(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	int ret;
+
+	ret = cs7542_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+	usleep_range(10000, 12000);
+	ret = cs7542_reset_deassert(rcdev, id);
+	if (ret)
+		return ret;
+	usleep_range(10000, 12000);
+	return 0;
+}
+
+static const struct reset_control_ops cs7542_reset_ops = {
+	.assert = cs7542_reset_assert,
+	.deassert = cs7542_reset_deassert,
+	.status = cs7542_reset_status,
+	.reset = cs7542_reset_pulse,
+};
+
+static int cs7542_control_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs7542_control *ctl;
+	int ret, i;
+
+	ctl = devm_kzalloc(dev, sizeof(*ctl), GFP_KERNEL);
+	if (!ctl)
+		return -ENOMEM;
+	ctl->map = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(ctl->map))
+		return dev_err_probe(dev, PTR_ERR(ctl->map), "global register map\n");
+	ctl->clks = devm_kzalloc(dev, struct_size(ctl->clks, hws, CS7542_PORTS), GFP_KERNEL);
+	if (!ctl->clks)
+		return -ENOMEM;
+	ctl->clks->num = CS7542_PORTS;
+	for (i = 0; i < CS7542_PORTS; i++) {
+		struct cs7542_gate *gate = &ctl->gates[i];
+		struct clk_init_data init = { .ops = &cs7542_gate_ops };
+
+		init.name = devm_kasprintf(dev, GFP_KERNEL, "%s.pcie%d", dev_name(dev), i);
+		if (!init.name)
+			return -ENOMEM;
+		/* Gate-only controls: no source frequency is described or assumed. */
+		gate->map = ctl->map;
+		gate->mask = BIT(10 + 2 * i);
+		gate->hw.init = &init;
+		ret = devm_clk_hw_register(dev, &gate->hw);
+		if (ret)
+			return dev_err_probe(dev, ret, "clock gate %d\n", i);
+		ctl->clks->hws[i] = &gate->hw;
+	}
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, ctl->clks);
+	if (ret)
+		return ret;
+	ctl->rcdev.owner = THIS_MODULE;
+	ctl->rcdev.ops = &cs7542_reset_ops;
+	ctl->rcdev.of_node = dev->of_node;
+	ctl->rcdev.nr_resets = CS7542_PORTS;
+	return devm_reset_controller_register(dev, &ctl->rcdev);
+}
+
+static const struct of_device_id cs7542_control_match[] = {
+	{ .compatible = "cortina,cs7542-pcie-control" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cs7542_control_match);
+
+static struct platform_driver cs7542_control_driver = {
+	.probe = cs7542_control_probe,
+	.driver = {
+		.name = "cs7542-pcie-control",
+		.of_match_table = cs7542_control_match,
+	},
+};
+module_platform_driver(cs7542_control_driver);
+
+MODULE_DESCRIPTION("Cortina Systems CS7542 PCIe clock gates and resets");
+MODULE_LICENSE("GPL");

-- 
2.53.0



