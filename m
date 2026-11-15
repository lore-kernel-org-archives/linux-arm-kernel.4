Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54432606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CKqF/EK2;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MXuOuoFA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S8oxBCeA8Oghldt3N0nXLd2NY/itD3Apvq3baor7tNU=; b=CKqF/EK2fgt5itJaFQVoiVv/dJ
	JjEw6l+7N0iWDx6yJZmZxev8hnmD2w0/7sDQYbQ2mD0gHxnnMuyTKsvG24ggcwCIeVNIPTsb4H+hW
	4lOXpYskJga98fQ0GcjWWfulx/vyC4gy7gB9rlRIuI7fspLN4cyujzT0IkbE2WSOX0kftVlibU8dq
	K34t2JHhlS/bwBEkIGkHoUhwDVaYxvVT49neyR8jY8hNkMTp5U9ORK9lcz/GZ3BgEt3xwIlg83X9t
	Gb0P2pjn2uEuNmsAuznu1Xsa5OD4rRJOldomYD3M05VXhTWwGtwangCaILFt4EfgKT2fj6FT2ro8S
	AaRbzQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYI-00000000IVA-0TLI;
	Sun, 15 Nov 2026 18:02:06 +0000
Received: from mail-dl1-x1246.google.com ([2607:f8b0:4864:20::1246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYE-00000000ISy-155z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 18:02:03 +0000
Received: by mail-dl1-x1246.google.com with SMTP id a92af1059eb24-1383723dfddso2662774c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765721; x=1795370521; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8oxBCeA8Oghldt3N0nXLd2NY/itD3Apvq3baor7tNU=;
        b=MXuOuoFAz86RAeVIZrpg9lgy72nEh/Li6e2Ev/4zzl2WZ/AUG4kYdrw7AFhKRhbaPj
         X7r2oZUSiQtjnqdgXMaom97sg/VfqY9Ayv4DtcRUhPlo4w158Dl+yLffFcQEggrC7Hxk
         txTM9mxuosaQFLa61KSz2hsm9Yqde65yx26HnISU1lEUd8C31vyCN5zrIDRNRBLf6aR0
         LISxtU972lxxJJvsSDbCab3QFw+WqeHguKntcza8JdwAYwN26Ctc8t/aoFSdFNHnFuaZ
         2Es7FgH+4qduskKznfP0Yh9fg/Eg6vVKKCSuA5Qgwv0DRRiWg3rOX6rLSvrha0hKzCfF
         7w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765721; x=1795370521;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8oxBCeA8Oghldt3N0nXLd2NY/itD3Apvq3baor7tNU=;
        b=ufan28Iw9m4wOZogLnUtBuIut9yAgjwCeqU9R6wxermBqB7aGSoR3woOpef2pbIOY1
         ztB7q8PKDmU4z8eLfabOvf4HxmrgyFdkB06XoNP1Sj+Mt5Y1xMQo+T+UbzQnltjZ4Z8s
         83QBRRsvckZc1ocwUlIlFg1FPC5rbGWBfLykytYPppdLwYlZma5gbl2q11jHUPvWHCMP
         hMmHk5DXVGwQO/KvMeXJ9+JWhpMLOPj1NRxAWFwMvJ3uNy5ab09XL6Oz+AZ6WZ01Qr2s
         30Ea53NlTEag6GH2MMxh7DYu2vfMhFgS8Llhp+v6lyDfCjgt/Rdjs4eKlqOEuR+3v2dA
         YTCQ==
X-Forwarded-Encrypted: i=1; AL+hErEYVO21Y+SgfgFk6lB8Ne0QiYJm7g3yZt6lnCkIcKBSDySwAYugEHqx40MfQdxxdiOKq5bPVljS6zmp/XGTgGOC@lists.infradead.org
X-Gm-Message-State: APuU4Z8/PwMnH5MytpvfsPSR1Z98xhjOcIiN3Npc6U7kB/5IHwyqmD1x
	mOgUtHCGxgsFsRaYHfMcKtD9KawRjfkOjiQqnP6Lk/H4TKd0w+73EtGay5e1EtEaazG3Ay35ynU
	VZLgJKlEr4cKVzlPj8n+JB4N9yXr/pq/8Cw==
X-Received: from dlam9-n1.prod.google.com ([2002:a05:701b:2089:10b0:184:b43a:63ac])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701a:8148:20b0:143:8860:afa1 with SMTP id a92af1059eb24-1b50316df64mr8677061c88.46.1794765720321;
 Sun, 15 Nov 2026 10:02:00 -0800 (PST)
Date: Sun, 15 Nov 2026 23:31:47 +0530
In-Reply-To: <20261115180147.1208082-1-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115180147.1208082-3-vamshigajjela@google.com>
Subject: [PATCH v2 2/2] spmi: Add SmartDV SPMI controller driver
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_100202_334809_815FD89B 
X-CRM114-Status: GOOD (  25.80  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vamshi Gajjela <vamshigajjela@google.com>

Add support for the SmartDV Technologies MIPI SPMI master controller,
starting with the Google Tensor G5 ("google,lga-spmi") integration.
The controller supports standard MIPI SPMI v1.0 and v2.0 bus commands
(RESET, SLEEP, SHUTDOWN, WAKEUP), register read/write, extended register
read/write, and extended register read/write long transfers.

Per-SoC controller parameters are supplied via of_device_id match data.

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 MAINTAINERS                 |   1 +
 drivers/spmi/Kconfig        |  10 +
 drivers/spmi/Makefile       |   1 +
 drivers/spmi/spmi-smartdv.c | 488 ++++++++++++++++++++++++++++++++++++
 4 files changed, 500 insertions(+)
 create mode 100644 drivers/spmi/spmi-smartdv.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cd5ae89b4f03..aa9b65d931fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25248,6 +25248,7 @@ M:	Vamshi Gajjela <vamshigajjela@google.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
+F:	drivers/spmi/spmi-smartdv.c
 
 SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 M:	Steve French <smfrench@gmail.com>
diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
index a80cf4047b86..e20fcc9f2c68 100644
--- a/drivers/spmi/Kconfig
+++ b/drivers/spmi/Kconfig
@@ -54,4 +54,14 @@ config SPMI_MTK_PMIF
 	  This is required for communicating with Mediatek PMICs and
 	  other devices that have the SPMI interface.
 
+config SPMI_SMARTDV
+	tristate "SmartDV Technologies SPMI Controller"
+	depends on HAS_IOMEM
+	help
+	  If you say yes to this option, support will be included for the
+	  SmartDV Technologies MIPI SPMI master controller.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called spmi-smartdv.
+
 endif
diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
index 38ac635645ba..34f6d6487604 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
 obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
 obj-$(CONFIG_SPMI_MSM_PMIC_ARB)	+= spmi-pmic-arb.o
 obj-$(CONFIG_SPMI_MTK_PMIF)	+= spmi-mtk-pmif.o
+obj-$(CONFIG_SPMI_SMARTDV)	+= spmi-smartdv.o
diff --git a/drivers/spmi/spmi-smartdv.c b/drivers/spmi/spmi-smartdv.c
new file mode 100644
index 000000000000..d4671667596e
--- /dev/null
+++ b/drivers/spmi/spmi-smartdv.c
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SmartDV Technologies SPMI controller driver
+ *
+ * Copyright 2026 Google LLC
+ * Author: Vamshi Gajjela <vamshigajjela@google.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+#include <linux/spmi.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+/* SPMI controller register address offsets */
+#define CONTROL			0x0
+#define IRQ_STATUS		0x8
+#define REQ_COMMAND		0x10
+#define REQ_DATA0		0x14
+#define REQ_DATA1		0x18
+#define REQ_DATA2		0x1c
+#define REQ_DATA3		0x20
+#define REQ_RD_STATUS		0x24
+#define RD_ERR_INDEX		0x28
+
+/* SPMI controller CONTROL register bit masks */
+#define SPMI_CONTROL_MASTER_EN			BIT(0)
+#define SPMI_CONTROL_ARB_ENABLE_MASK		BIT(1)
+#define SPMI_CONTROL_MID_MASK			GENMASK(3, 2)
+#define SPMI_CONTROL_VERSION_MASK		GENMASK(5, 4)
+#define SPMI_CONTROL_ARB_RETRY_LIMIT_MASK	GENMASK(13, 6)
+#define SPMI_CONTROL_PRESCALER_MASK		GENMASK(21, 14)
+#define SPMI_CONTROL_RD_LATENCY_MASK		GENMASK(29, 22)
+#define SPMI_CONTROL_ARB_SSC_DELAY_MASK		GENMASK(31, 30)
+
+#define SPMI_CONTROL_VERSION_1_0		0
+#define SPMI_CONTROL_VERSION_2_0		1
+
+/* SPMI irq status bit position */
+#define SPMI_IRQ_REQ_CMD_DONE		BIT(0)
+#define SPMI_IRQ_RSP_NEW_CMD		BIT(1)
+#define SPMI_IRQ_ABORT_MST_CMD		BIT(2)
+#define SPMI_IRQ_READ_DATA_PAR_ERR	BIT(3)
+#define SPMI_IRQ_READ_NO_RESP_ERR	BIT(4)
+#define SPMI_IRQ_CMD_NACK_ERR		BIT(5)
+#define SPMI_IRQ_BUS_TIMEOUT		BIT(6)
+#define SPMI_IRQ_NO_BOM_CMD_PAR_ERR	BIT(7)
+#define SPMI_IRQ_NO_BOM_ADDR_LO_PAR_ERR	BIT(8)
+#define SPMI_IRQ_NO_BOM_WR_DATA_PAR_ERR	BIT(9)
+#define SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT	BIT(10)
+#define SPMI_IRQ_IS_BOM			BIT(11)
+#define SPMI_IRQ_CONNECTED		BIT(12)
+
+#define SPMI_ANY_ERROR_IRQ_FLAG			\
+	(					\
+	SPMI_IRQ_ABORT_MST_CMD |		\
+	SPMI_IRQ_READ_DATA_PAR_ERR |		\
+	SPMI_IRQ_READ_NO_RESP_ERR |		\
+	SPMI_IRQ_CMD_NACK_ERR |			\
+	SPMI_IRQ_BUS_TIMEOUT |			\
+	SPMI_IRQ_NO_BOM_CMD_PAR_ERR |		\
+	SPMI_IRQ_NO_BOM_ADDR_LO_PAR_ERR |	\
+	SPMI_IRQ_NO_BOM_WR_DATA_PAR_ERR		\
+	)
+
+/* REQ_COMMAND register fields mask */
+#define SPMI_REQ_COMMAND_NEW_CMD_MASK		BIT(0)
+#define SPMI_REQ_COMMAND_PRIMARY_ARB_MASK	BIT(1)
+#define SPMI_REQ_COMMAND_OPCODE_MASK		GENMASK(6, 2)
+#define SPMI_REQ_COMMAND_ADDR_MASK		GENMASK(10, 7)
+#define SPMI_REQ_COMMAND_BYTE_CNT_MASK		GENMASK(14, 11)
+#define SPMI_REQ_COMMAND_REQ_ADDR_MASK		GENMASK(30, 15)
+
+#define REQ_COMMAND_TIMEOUT_MS	100
+#define REQ_COMMAND_TIMEOUT_US	(REQ_COMMAND_TIMEOUT_MS * USEC_PER_MSEC)
+#define REQ_COMMAND_POLL_US	1
+
+enum smartdv_spmi_xfer_type {
+	SMARTDV_SPMI_XFER_CMD = 0,
+	SMARTDV_SPMI_XFER_WRITE = 1,
+	SMARTDV_SPMI_XFER_READ = 2,
+};
+
+/* SmartDV REQ_COMMAND register opcode values (bits [6:2]) */
+enum smartdv_spmi_hc_cmd_op_code {
+	SMARTDV_SPMI_CMD_REG_WRITE = 0,
+	SMARTDV_SPMI_CMD_REG_READ = 1,
+	SMARTDV_SPMI_CMD_EXT_REG_WRITE = 2,
+	SMARTDV_SPMI_CMD_EXT_REG_READ = 3,
+	SMARTDV_SPMI_CMD_EXT_REG_WRITE_L = 4,
+	SMARTDV_SPMI_CMD_EXT_REG_READ_L = 5,
+	SMARTDV_SPMI_CMD_REG_WRITE_0 = 6,
+	SMARTDV_SPMI_CMD_RESET = 10,
+	SMARTDV_SPMI_CMD_SLEEP = 11,
+	SMARTDV_SPMI_CMD_SHUTDOWN = 12,
+	SMARTDV_SPMI_CMD_WAKEUP = 13,
+};
+
+/**
+ * struct smartdv_spmi_config - Per-SoC SmartDV SPMI controller configuration
+ * @spmi_version: MIPI SPMI specification version (0 = v1.0, 1 = v2.0)
+ * @prescaler: Clock divider applied to i_clk to generate SPMI SCL
+ */
+struct smartdv_spmi_config {
+	u8	spmi_version;
+	u8	prescaler;
+};
+
+/**
+ * struct smartdv_spmi - SmartDV SPMI driver instance
+ * @ctrl: Pointer to spmi_controller structure
+ * @dev: Pointer to device structure
+ * @base: Virtual address of the SPMI controller registers
+ * @lock: Spinlock to serialize bus access
+ * @i_clk: Hardware clock feeding the controller
+ * @rst: Hardware reset to controller
+ * @clk_freq: Core clock frequency in Hz (i_clk)
+ * @ctrl_reg: Cached control register value from last write
+ */
+struct smartdv_spmi {
+	struct spmi_controller	*ctrl;
+	struct device		*dev;
+	void __iomem		*base;
+	spinlock_t		lock; /* Serialize bus access */
+	struct clk		*i_clk;
+	struct reset_control	*rst;
+	unsigned long		clk_freq;
+	u32			ctrl_reg;
+};
+
+static inline u32 smartdv_spmi_readl(struct smartdv_spmi *sdrv, u32 offset)
+{
+	return readl(sdrv->base + offset);
+}
+
+static inline void smartdv_spmi_writel(struct smartdv_spmi *sdrv, u32 offset, u32 val)
+{
+	writel(val, sdrv->base + offset);
+}
+
+static void smartdv_spmi_read_err_status_dump(struct smartdv_spmi *sdrv)
+{
+	dev_dbg(sdrv->dev, "No response frame & parity error: %#x\n",
+		smartdv_spmi_readl(sdrv, REQ_RD_STATUS));
+	dev_dbg(sdrv->dev, "Read data frame error: %#x\n",
+		smartdv_spmi_readl(sdrv, RD_ERR_INDEX));
+}
+
+static void smartdv_spmi_clear_req_data_reg(struct smartdv_spmi *sdrv)
+{
+	smartdv_spmi_writel(sdrv, REQ_DATA0, 0x0);
+	smartdv_spmi_writel(sdrv, REQ_DATA1, 0x0);
+	smartdv_spmi_writel(sdrv, REQ_DATA2, 0x0);
+	smartdv_spmi_writel(sdrv, REQ_DATA3, 0x0);
+}
+
+static int smartdv_spmi_wait_for_done(struct smartdv_spmi *sdrv, u32 *irq_status)
+{
+	int ret;
+
+	/* wait for cmd done status */
+	ret = readl_poll_timeout_atomic(sdrv->base + IRQ_STATUS, *irq_status,
+					(*irq_status & SPMI_IRQ_REQ_CMD_DONE) != 0,
+					REQ_COMMAND_POLL_US, REQ_COMMAND_TIMEOUT_US);
+	/* clear all interrupts */
+	smartdv_spmi_writel(sdrv, IRQ_STATUS, *irq_status);
+
+	return ret;
+}
+
+static int smartdv_spmi_xfer(struct smartdv_spmi *sdrv,
+			     enum smartdv_spmi_xfer_type xfer_type,
+			     u8 opc, u8 sid, u16 saddr, size_t bc)
+{
+	u32 irq_status;
+	u32 cmd = 0;
+	int ret;
+
+	/* program control register, master enable */
+	smartdv_spmi_writel(sdrv, CONTROL, sdrv->ctrl_reg | SPMI_CONTROL_MASTER_EN);
+
+	/* prepare req_command register */
+	cmd |= SPMI_REQ_COMMAND_NEW_CMD_MASK;
+	cmd |= SPMI_REQ_COMMAND_PRIMARY_ARB_MASK;
+	cmd |= FIELD_PREP(SPMI_REQ_COMMAND_OPCODE_MASK, opc);
+	cmd |= FIELD_PREP(SPMI_REQ_COMMAND_ADDR_MASK, sid);
+
+	if (xfer_type != SMARTDV_SPMI_XFER_CMD) {
+		cmd |= FIELD_PREP(SPMI_REQ_COMMAND_BYTE_CNT_MASK, bc - 1);
+		cmd |= FIELD_PREP(SPMI_REQ_COMMAND_REQ_ADDR_MASK, saddr);
+	}
+
+	/* request new command */
+	smartdv_spmi_writel(sdrv, REQ_COMMAND, cmd);
+
+	ret = smartdv_spmi_wait_for_done(sdrv, &irq_status);
+	if (ret) {
+		dev_err(sdrv->dev, "request timeout.\n");
+		goto out;
+	}
+
+	/* check interrupt status for any error(s) */
+	if (irq_status & SPMI_ANY_ERROR_IRQ_FLAG) {
+		ret = -EIO;
+		dev_err(sdrv->dev,
+			"sid %#x opc %#x addr %#x len %#zx irq_status: %#x\n",
+			sid, opc, saddr, bc, irq_status);
+
+		if (xfer_type == SMARTDV_SPMI_XFER_READ)
+			smartdv_spmi_read_err_status_dump(sdrv);
+	}
+
+out:
+	/* program control register, with master disable */
+	smartdv_spmi_writel(sdrv, CONTROL, sdrv->ctrl_reg);
+
+	return ret;
+}
+
+static void smartdv_spmi_read_req_data(struct smartdv_spmi *sdrv, u8 *buf, size_t bc)
+{
+	u32 addr = REQ_DATA0;
+	size_t len;
+	u32 reg;
+
+	while (bc) {
+		len = min(bc, sizeof(reg));
+		reg = smartdv_spmi_readl(sdrv, addr);
+		memcpy(buf, &reg, len);
+		buf += len;
+		bc -= len;
+		addr += sizeof(reg);
+	}
+}
+
+static int smartdv_spmi_read_cmd(struct spmi_controller *ctrl,
+				 u8 opcode, u8 sid, u16 saddr, u8 *__buf, size_t bc)
+{
+	struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
+	unsigned long flags;
+	int ret;
+	u8 opc;
+
+	switch (opcode) {
+	case SPMI_CMD_READ:
+		opc = SMARTDV_SPMI_CMD_REG_READ;
+		break;
+	case SPMI_CMD_EXT_READ:
+		opc = SMARTDV_SPMI_CMD_EXT_REG_READ;
+		break;
+	case SPMI_CMD_EXT_READL:
+		opc = SMARTDV_SPMI_CMD_EXT_REG_READ_L;
+		break;
+	default:
+		dev_err(&ctrl->dev, "invalid cmd %#x\n", opcode);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&sdrv->lock, flags);
+
+	/* clear req_data registers by writing zeros */
+	smartdv_spmi_clear_req_data_reg(sdrv);
+
+	/* clear read status register */
+	smartdv_spmi_writel(sdrv, REQ_RD_STATUS, 0x0);
+
+	/* initiate transfer on the bus */
+	ret = smartdv_spmi_xfer(sdrv, SMARTDV_SPMI_XFER_READ, opc, sid, saddr, bc);
+	if (!ret)
+		/* read received data */
+		smartdv_spmi_read_req_data(sdrv, __buf, bc);
+
+	spin_unlock_irqrestore(&sdrv->lock, flags);
+
+	return ret;
+}
+
+static void smartdv_spmi_write_req_data(struct smartdv_spmi *sdrv, const u8 *buf, size_t bc)
+{
+	u32 addr = REQ_DATA0;
+	size_t len;
+	u32 data;
+
+	while (bc) {
+		data = 0;
+		len = min(bc, sizeof(data));
+		memcpy(&data, buf, len);
+		smartdv_spmi_writel(sdrv, addr, data);
+		buf += len;
+		bc -= len;
+		addr += sizeof(data);
+	}
+}
+
+static int smartdv_spmi_write_cmd(struct spmi_controller *ctrl,
+				  u8 opcode, u8 sid, u16 saddr, const u8 *__buf, size_t bc)
+{
+	struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
+	unsigned long flags;
+	u8 opc;
+	int ret;
+
+	switch (opcode) {
+	case SPMI_CMD_ZERO_WRITE:
+		opc = SMARTDV_SPMI_CMD_REG_WRITE_0;
+		break;
+	case SPMI_CMD_WRITE:
+		opc = SMARTDV_SPMI_CMD_REG_WRITE;
+		break;
+	case SPMI_CMD_EXT_WRITE:
+		opc = SMARTDV_SPMI_CMD_EXT_REG_WRITE;
+		break;
+	case SPMI_CMD_EXT_WRITEL:
+		opc = SMARTDV_SPMI_CMD_EXT_REG_WRITE_L;
+		break;
+	default:
+		dev_err(&ctrl->dev, "invalid write cmd %#x\n", opcode);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&sdrv->lock, flags);
+
+	/* fill data */
+	smartdv_spmi_write_req_data(sdrv, __buf, bc);
+
+	/* initiate transfer on the bus */
+	ret = smartdv_spmi_xfer(sdrv, SMARTDV_SPMI_XFER_WRITE, opc, sid, saddr, bc);
+
+	spin_unlock_irqrestore(&sdrv->lock, flags);
+
+	return ret;
+}
+
+static int smartdv_spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
+{
+	struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
+	unsigned long flags;
+	int ret;
+	u8 opc;
+
+	switch (opcode) {
+	case SPMI_CMD_RESET:
+		opc = SMARTDV_SPMI_CMD_RESET;
+		break;
+	case SPMI_CMD_SLEEP:
+		opc = SMARTDV_SPMI_CMD_SLEEP;
+		break;
+	case SPMI_CMD_SHUTDOWN:
+		opc = SMARTDV_SPMI_CMD_SHUTDOWN;
+		break;
+	case SPMI_CMD_WAKEUP:
+		opc = SMARTDV_SPMI_CMD_WAKEUP;
+		break;
+	default:
+		dev_err(&ctrl->dev, "invalid cmd %#x\n", opcode);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&sdrv->lock, flags);
+
+	/* initiate transfer on the bus */
+	ret = smartdv_spmi_xfer(sdrv, SMARTDV_SPMI_XFER_CMD, opc, sid, 0, 0);
+
+	spin_unlock_irqrestore(&sdrv->lock, flags);
+
+	return ret;
+}
+
+static int smartdv_spmi_init_clk_reset(struct smartdv_spmi *sdrv)
+{
+	struct device *dev = sdrv->dev;
+
+	sdrv->i_clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(sdrv->i_clk))
+		return dev_err_probe(dev, PTR_ERR(sdrv->i_clk), "could not get i_clk\n");
+
+	sdrv->clk_freq = clk_get_rate(sdrv->i_clk);
+	if (!sdrv->clk_freq)
+		return dev_err_probe(dev, -EINVAL, "i_clk rate not defined\n");
+
+	sdrv->rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(sdrv->rst))
+		return dev_err_probe(dev, PTR_ERR(sdrv->rst),
+				     "could not get and deassert reset\n");
+
+	return 0;
+}
+
+static u32 smartdv_spmi_build_ctrl_reg(const struct smartdv_spmi_config *cfg)
+{
+	return FIELD_PREP(SPMI_CONTROL_VERSION_MASK, cfg->spmi_version) |
+	       FIELD_PREP(SPMI_CONTROL_PRESCALER_MASK, cfg->prescaler);
+}
+
+static void smartdv_spmi_pr_info(struct smartdv_spmi *sdrv)
+{
+	u32 prescaler = FIELD_GET(SPMI_CONTROL_PRESCALER_MASK, sdrv->ctrl_reg);
+
+	dev_dbg(sdrv->dev, "clk %lu kHz, scl %lu kHz (ctrl_reg: %#x)\n",
+		sdrv->clk_freq / HZ_PER_KHZ,
+		sdrv->clk_freq / ((prescaler ? prescaler * 2 : 1) * HZ_PER_KHZ),
+		sdrv->ctrl_reg);
+}
+
+static int smartdv_spmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct smartdv_spmi_config *cfg;
+	struct smartdv_spmi *sdrv;
+	struct spmi_controller *ctrl;
+	int ret;
+
+	cfg = device_get_match_data(dev);
+	if (!cfg)
+		return -EINVAL;
+
+	ctrl = devm_spmi_controller_alloc(dev, sizeof(*sdrv));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	sdrv = spmi_controller_get_drvdata(ctrl);
+	sdrv->ctrl = ctrl;
+	sdrv->dev = dev;
+
+	sdrv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sdrv->base))
+		return PTR_ERR(sdrv->base);
+
+	platform_set_drvdata(pdev, sdrv);
+
+	sdrv->ctrl_reg = smartdv_spmi_build_ctrl_reg(cfg);
+
+	ret = smartdv_spmi_init_clk_reset(sdrv);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&sdrv->lock);
+
+	/* Callbacks */
+	ctrl->cmd = smartdv_spmi_cmd;
+	ctrl->read_cmd = smartdv_spmi_read_cmd;
+	ctrl->write_cmd = smartdv_spmi_write_cmd;
+
+	ret = devm_spmi_controller_add(dev, ctrl);
+	if (ret)
+		return dev_err_probe(dev, ret, "spmi_controller_add failed\n");
+
+	smartdv_spmi_pr_info(sdrv);
+
+	return 0;
+}
+
+static const struct smartdv_spmi_config google_lga_spmi_cfg = {
+	.spmi_version = SPMI_CONTROL_VERSION_2_0,
+	.prescaler = 4,
+};
+
+static const struct of_device_id smartdv_spmi_of_match[] = {
+	{ .compatible = "google,lga-spmi", .data = &google_lga_spmi_cfg },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, smartdv_spmi_of_match);
+
+static struct platform_driver smartdv_spmi_platform_driver = {
+	.probe = smartdv_spmi_probe,
+	.driver = {
+		.name = "smartdv-spmi",
+		.of_match_table = smartdv_spmi_of_match,
+	},
+};
+
+module_platform_driver(smartdv_spmi_platform_driver);
+
+MODULE_AUTHOR("Vamshi Gajjela <vamshigajjela@google.com>");
+MODULE_DESCRIPTION("SmartDV Technologies SPMI controller driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0.611.g1030f0b940-goog


