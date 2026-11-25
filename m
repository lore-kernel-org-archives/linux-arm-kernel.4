Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E74606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c519ddZv;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h1b0F57p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=; b=c519ddZvBgkG3n
	tGK5YXvDRdYHcB/nuxcLD00c9YYKynSYkpR5pxSf34MgCQuSTpKv3R7V0/POPRCRqGaodltocZ7xd
	AxKb75LK73MafhFzgc2ZhXscCdaa3fZ1dtCnoqIqoLma8D77aiuc9N3CUbCaX8lTwxxgOFM1lpQy5
	3nDziV8xIU/21ONiP4bm/Zv6DqxdrwvD7uqKpH2rTWSl9OcsawlAnff3fZFqu6EtCDUyIYTrmxgjh
	rEmynC+IMK1MY+7aSBTYXVPDjYla+GhpGDgA8lG2P9X+z/oobGJihWkywYLsUDx57xDkVE7y493Xz
	Y0Eh47l26AdghbjSWwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0XO-000000087CD-2oLI;
	Wed, 25 Nov 2026 00:07:02 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0Wx-000000086v3-3Tlp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:06:37 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-386b8f2f671so2345078eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565195; x=1796169995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=;
        b=h1b0F57pixVJRlbCSDClWoRMNJycylvOf/Mx1mcDmHRK9/7RauMnCMY96J4zCpL8NX
         rcNts9HN6OupPtGpr3n2easCWwVc/ILtLoeDgq+FuYMaJz3z4VL6N8df1C5mgeIxoLOe
         DULpG9ox7UAftnn/r+dw5d1NVqC10fRA5o88Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565195; x=1796169995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=;
        b=qGfAMwTvH80sRqXy7F+HTPMMpBFgma+4PSDJPwvDol8W9RUUZ6rI9jcwGBH6cKc5GZ
         ZDMu7V1QYjB/4uRcafcjec6XqJYwAB5KEw0wkas3aLMVBFlcZM+geyCSNp2/Rgi4D+wD
         cbhfPfEBpdQAz9kYQo+8rxYpoSaVFU5Kxe7DYjaxjQtwmezRse2T97vw3ZwVk9bM7Mgk
         IzphZAaJC4uVO5CqLurMZWTAz+mF62QkWnFjKA6FutoP6FV/MbgPsIUCZvM71LV9tl5f
         UNKRT0sXTEATQD8gxuFTgftGTlXNzPih0YxlxL8iBtPkR75wjZ9zgHvieO/pGljsQCx9
         AKYQ==
X-Forwarded-Encrypted: i=1; AL+hErFDBTjww5h9MVCxkKdQdAtF9cKx0FQYBlgr2aip5WphyrUsmilTOsY6LBe3iwofyOC1lyLc3Jmjl3xtCz53zoiI@lists.infradead.org
X-Gm-Message-State: APuU4Z+DKomwgoS8PgAM36tbM381Xts18RYbbdxFGIg0rC3w+WeqsbiA
	ZKANJPOvcRdvl8r5ceQ4V4QUv6ezjidIGVE1Imc5gAuBSNU81cNIBUKVjbR3nEDLvg==
X-Gm-Gg: AZFdTZcsaudxzaUZGNblQ1BvKz6xtJwG1hAqDzJd8AR0H6MkDyO/YMtvxtYpPy3APtb
	R0IlLbT201gRf51BfBMQixYYLmg2oTeLwfjyxpnwyMnoHya8XaOYqFVlzD2r7oqTNK7q+e3TcMz
	TK8HZCD6V3oHMFaUXXinn7BfaNhvUNzlZqAIYTq1Dgcz6l0hXDDGOVKfAsFaCKrIhIiPdXkrrhG
	d6nOZZWGizynB7q6ZKZCzYINktUFZOTz8uodEHfTGYmnYgjDKMNtaa1D5SEZwfuKCjzLGnmnNcu
	uoJ/FKNRiZWcfFjv0ScZGlMwbx0IcnatOSscydTRe6Rd7t5jj9yiuCNAnLxjQgZghO3dZB3f3hZ
	l46nO3nnaohd5NRRJFd6gwO+9xguwqI2uOg9Gt+thRGN7r9KeRqV445qIZxIFqvBgCZZfKXiV8k
	sm3kyyvwAfWgmO0GNMpec0r6AlrI4ZEqO9OmH+hlrvk2HT+SqC5C6fp9CrsDT3uZ7uXSH4etkvG
	BboZHRyiA5ixY2HVRdPwpFZP13zzotsziiXej5OpRZhTlp5K4seyZp6nol0sZ8WKVveeUPCQYc1
	yWriREa0yNBuKM5stoajfGqrulj7AwlHU33xT9xRiB35lPAhKVDSS7GGebmH23QO/aayXA==
X-Received: by 2002:a05:7301:78c1:b0:386:a3fe:44de with SMTP id 5a478bee46e88-386a3fe4616mr10456351eec.28.1795565194862;
        Tue, 24 Nov 2026 16:06:34 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38567abb870sm40418219eec.25.2026.11.24.16.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:34 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 5/9] reset: google: Add CPM reset driver
Date: Tue, 24 Nov 2026 16:03:39 -0800
Message-ID: <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160635_890600_55519FD4 
X-CRM114-Status: GOOD (  24.69  )
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

Google Tensor SoCs (used on Pixel phones) manage many resources
(including resets) using a Central Power Manager (CPM) co-processor. We
communicate with CPM using mailboxes, abstracted in the
devm_cpm_get_handle(), etc., API.

For posterity, I list a summary of changes made relative to the
downstream Pixel driver:

* Switch to auxiliary bus, as a child of a CPM device

* Use devm more heavily

* Avoid representing each reset as its own Device Tree node.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Rename symbols from goog_cpm_rst_* to cpm_reset_*
 * Moved shared protocol details to CPM driver
 * Remove custom reset debugfs interface and .remove callback.
 * Remove per-SoC table; we only need naive translation of firmware IDs

 drivers/reset/Kconfig            |   1 +
 drivers/reset/Makefile           |   1 +
 drivers/reset/google/Kconfig     |  11 +++
 drivers/reset/google/Makefile    |   2 +
 drivers/reset/google/reset-cpm.c | 154 +++++++++++++++++++++++++++++++
 5 files changed, 169 insertions(+)
 create mode 100644 drivers/reset/google/Kconfig
 create mode 100644 drivers/reset/google/Makefile
 create mode 100644 drivers/reset/google/reset-cpm.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 673bca1e594e..64c12b479b2c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -475,6 +475,7 @@ config RESET_ZYNQMP
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
 source "drivers/reset/amlogic/Kconfig"
+source "drivers/reset/google/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/realtek/Kconfig"
 source "drivers/reset/spacemit/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 2fe527a7be8e..a151fe63905e 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core.o
 obj-y += amlogic/
+obj-y += google/
 obj-y += hisilicon/
 obj-y += realtek/
 obj-y += spacemit/
diff --git a/drivers/reset/google/Kconfig b/drivers/reset/google/Kconfig
new file mode 100644
index 000000000000..38431b4f9001
--- /dev/null
+++ b/drivers/reset/google/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_CPM
+	tristate "Google CPM Reset Controller"
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	depends on GOOGLE_CPM_MBA
+	help
+	  Driver support for reset controllers found on Google Tensor SoCs,
+	  operating over the CPM mailbox interface. This allows peripheral
+	  drivers to assert and deassert resets on LPCM hardware blocks.
+
+	  If unsure, say N.
diff --git a/drivers/reset/google/Makefile b/drivers/reset/google/Makefile
new file mode 100644
index 000000000000..437c19459464
--- /dev/null
+++ b/drivers/reset/google/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RESET_CPM) += reset-cpm.o
diff --git a/drivers/reset/google/reset-cpm.c b/drivers/reset/google/reset-cpm.c
new file mode 100644
index 000000000000..ef0863f25cac
--- /dev/null
+++ b/drivers/reset/google/reset-cpm.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device driver to control Google SoC LPCM resets via CPM.
+ * Copyright 2023-2026 Google LLC
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/limits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+#include <soc/google/google-cpm-mba.h>
+
+#define ASSERT_OP_ID			0
+#define DEASSERT_OP_ID			1
+
+#define CPM_RST_LPCM_ID_MASK		GENMASK(31, 16)
+#define CPM_RST_ID_MASK			GENMASK(15, 0)
+/* Object fields are 8 bits */
+#define CPM_RST_ID_MAX			U8_MAX
+
+static inline unsigned long to_rstc_idx(u32 lpcm_id, u32 rst_id)
+{
+	return FIELD_PREP(CPM_RST_LPCM_ID_MASK, lpcm_id) |
+	       FIELD_PREP(CPM_RST_ID_MASK, rst_id);
+}
+
+static inline u32 lpcm_from_idx(unsigned long idx)
+{
+	return FIELD_GET(CPM_RST_LPCM_ID_MASK, idx);
+}
+
+static inline u32 rst_from_idx(unsigned long idx)
+{
+	return FIELD_GET(CPM_RST_ID_MASK, idx);
+}
+
+struct cpm_reset_provider {
+	struct reset_controller_dev rcdev;
+	struct cpm_handle *cpm;
+};
+
+static inline struct cpm_reset_provider *to_provider(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct cpm_reset_provider, rcdev);
+}
+
+static int cpm_reset_send_lpcm(struct reset_controller_dev *rcdev,
+			       unsigned long idx, u8 opcode)
+{
+	struct cpm_reset_provider *provider = to_provider(rcdev);
+	const struct cpm_lpcm_message msg = {
+		.cmd = LPCM_CMD_SET_RST,
+		.opcode = opcode,
+		.lpcm_id = lpcm_from_idx(idx),
+		.obj_id = rst_from_idx(idx),
+	};
+
+	return cpm_send_lpcm_message(provider->cpm, &msg);
+}
+
+static int cpm_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	return cpm_reset_send_lpcm(rcdev, idx, ASSERT_OP_ID);
+}
+
+static int cpm_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	return cpm_reset_send_lpcm(rcdev, idx, DEASSERT_OP_ID);
+}
+
+static const struct reset_control_ops cpm_reset_ops = {
+	.assert = cpm_reset_assert,
+	.deassert = cpm_reset_deassert,
+};
+
+static int cpm_reset_of_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *reset_spec)
+{
+	u32 lpcm_id, rst_id;
+
+	if (reset_spec->args_count != 2)
+		return -EINVAL;
+
+	lpcm_id = reset_spec->args[0];
+	rst_id = reset_spec->args[1];
+
+	if (lpcm_id > CPM_RST_ID_MAX)
+		return -EINVAL;
+	if (rst_id > CPM_RST_ID_MAX)
+		return -EINVAL;
+
+	return to_rstc_idx(lpcm_id, rst_id);
+}
+
+static int cpm_reset_probe(struct auxiliary_device *auxdev,
+			   const struct auxiliary_device_id *id)
+{
+	struct device *dev = &auxdev->dev;
+	struct cpm_reset_provider *provider;
+	int ret;
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->cpm = devm_cpm_get_handle(dev);
+	if (IS_ERR(provider->cpm))
+		return dev_err_probe(dev, PTR_ERR(provider->cpm),
+				     "Failed to get CPM handle\n");
+
+	provider->rcdev.dev = dev;
+	provider->rcdev.owner = THIS_MODULE;
+	provider->rcdev.of_node = dev->of_node;
+	provider->rcdev.ops = &cpm_reset_ops;
+	provider->rcdev.of_reset_n_cells = 2;
+	provider->rcdev.of_xlate = cpm_reset_of_xlate;
+
+	ret = devm_reset_controller_register(dev, &provider->rcdev);
+	if (ret < 0) {
+		dev_err(dev, "failed to register reset controller: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct auxiliary_device_id cpm_reset_id_table[] = {
+	{ .name = "google_cpm_mba.reset" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, cpm_reset_id_table);
+
+static struct auxiliary_driver cpm_reset_driver = {
+	.probe = cpm_reset_probe,
+	.name = "google-reset-cpm",
+	.id_table = cpm_reset_id_table,
+};
+module_auxiliary_driver(cpm_reset_driver);
+
+MODULE_DESCRIPTION("Google CPM Reset Driver");
+MODULE_LICENSE("GPL");
-- 
2.56.1.831.g720f3f5937-goog


