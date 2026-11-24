Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 01:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NTm2A0Sn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDuT0jeZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fh0x5VQQJAWMGfm2v5ASdgMgkGoChGrLjbjXEFbyGzQ=; b=NTm2A0SnmQRDWD
	qzYEsHBMhdSF9oJd+h4kY5l8xt4crhZF6Ph9VLBnELBZeSIjIsTP7p8d4N9+Rd32Pmos6keEVbAy8
	lVSrMB/KTla6MYnUKEZ/vArwCrsf6GOTUlC8HneHF7+WQBoowpNJTkqAnWcwlXSckTWYrztC/dITi
	fsJDOe5AFLvzGwgXKBDzLSpKOv9fy7lk4ouocrXjXFE2FKHZy7Jz5l7pPo57uaQeKZCz8063/Ym9a
	pVAJY5PzckJgsssAzzxwiyCKsEDQWtKCGGF/9foPGTdo01F82rPLD2Be4fPAVhoWEHFKIaQfsZNf4
	INobe83O9oof+t4dcrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKv-00000005JhS-1QKQ;
	Tue, 24 Nov 2026 01:28:45 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKo-00000005Jfm-18nu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 01:28:39 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so2859340b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 17:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483717; x=1796088517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fh0x5VQQJAWMGfm2v5ASdgMgkGoChGrLjbjXEFbyGzQ=;
        b=qDuT0jeZ8UV8EIP3WxI0R3L/qWquxNJLUq3iM3Gr+kfIjK4k6d/4uEqTYmST+rmnBi
         C1UDlmGQlsS+pw2VFfTks8PKW+yBI/U36jlWlbztEXjhxJ0SeHLNjbMmgpCxLGzuBS4R
         /9Je2oZXZoo4CZR+WujpTPfenv3fRR8KKsloQSHgxf61CrbYzq/B44ZZSEaK5QW7v8vz
         aCpf2aYjY/QSE8nPyOAdwQgedQTNkpGoZO64XSwWM0LI7WjyaTb7c88KQL7KRQuP7XjT
         5GrXSPYnI5GOn3uhxVcYJSVzMxDdntC3nEc2E3LMH0AEAy1sYIZQ+b3cp0b3ty6rLtPn
         zeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483717; x=1796088517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fh0x5VQQJAWMGfm2v5ASdgMgkGoChGrLjbjXEFbyGzQ=;
        b=Z1VOH4HuQ7ZWOZO8FjH266bv1j9WZUuge0Ur85dffKmtnILg4w+PvTMm9Obk6b3JkA
         +raf7H9NuvAfD2Lm8SHXzr0Ovmr7OwsEqxMbKmpQDpTXmo5zteXezq228+dWuJemOm41
         OqlXe6xFqs/sJTTshJ3xMh6PQmUl6e6Dnoq4JbgoFSyQzhiAWDZDeIFh3OIe3EPWYx+c
         N/VmOlSQg9K0JzDk1yYQ8Q/26fA4Ft5eHT365oIMQot0Ra06pQFDw/YYNXJxVh2uEuCN
         OthmkwbegWMqvxS4vcwFUnq3L2jF3NOxrqcdYHh6djg6/Sfhep9eipbjdGeIEXU0cFve
         8Qvg==
X-Forwarded-Encrypted: i=1; AL+hErGKJcuzEG5H6D7zhf+zf0V2mK7jCXcUtst160HV9FPlCEv8+s3W0t1NpO6rq2nQ7mwgJ0KGajq9FmRPcSxEJibG@lists.infradead.org
X-Gm-Message-State: APuU4Z+Lxx7PLOugiF6WtLJ3+Qy54Vaau+hP87ZvJUEeFU30s0sLgHB7
	J9xWs0sdNeNKQLnKQAh3T+mFpqBT0aSI2MNuHBBhfRJ/tDKYGTanHNcl
X-Gm-Gg: AZFdTZem6dICsuhs0so5sAzCAMnPRFIKQKk7bwCJctbDffqp9AE8gi/FXSS3dJPSel0
	s9sKlnxlYWVChIL9exl7zBMz7ge6VEW742TAN1LA92pDzCxw9u/C0Joco5/wsK21C4OQ+Zj2yHu
	bGxWc24mzcsBUeJ3YuaR++IDFJtrRzOvah9mk405iklJv6IBMeY5Sycs4bEkUZQN8TBERC1X05P
	KjFruM7lLo+lFur0e4EJ3bGnETvS7awg2+KTSzG7Z8BkbDGSxkxu4AHJw4UkCtnDGBQ5p+fiHja
	VDxVKvaZwNEmqdST9Gm8ZRjSHPM09J+okUKkUpVWB1XTkAt2rQXBcFVcEv9rx4JMrJ1BrMKgZrq
	u4WY+u5cXVB5+HFQvG4eMlBKhKuV7H3yeBT717a+TJUqIku186qAjsil7VkC1PS8hywFI7vEN5S
	oxCqotORHF55pNBx55g7icMzM7vdS5rFZswdoKj8rfpjId/xjDTDl27Guo3BetAm4ZgxKBvB1v+
	uPTwu7vTzYpXhvDOTjNsBLiRR4h0BcTXcoehldjnSp1iNDDRkeneByWuPArfv2kwC8OoAWKJguo
	tkZA67CBKvFjDuIuFjw0RjLR13gHb9RvH8tfo0aj2NLvfetES1YW+NH/VFB6I6X4w7xrb6dVRpR
	/
X-Received: by 2002:a05:6a00:a117:b0:883:71f6:5fb with SMTP id d2e1a72fcca58-8c87b4f42ccmr11288308b3a.13.1795483717212;
        Mon, 23 Nov 2026 17:28:37 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:36 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] watchdog: histb: Add HiSilicon STB watchdog driver
Date: Tue, 24 Nov 2026 09:27:36 +0800
Message-ID: <20261124012755.328774-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_172838_343837_046BFC3F 
X-CRM114-Status: GOOD (  29.44  )
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

The watchdog integrated on HiSilicon STB SoCs reuses the register layout
of sp805, but deviates from the standard sp805 in several ways that make
the existing sp805 driver unusable on these SoCs. Add a dedicated
platform driver to handle these SoC-specific semantics natively without
regressing generic SP805 users.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/watchdog/Kconfig     |   8 +
 drivers/watchdog/Makefile    |   1 +
 drivers/watchdog/histb_wdt.c | 305 +++++++++++++++++++++++++++++++++++
 3 files changed, 314 insertions(+)
 create mode 100644 drivers/watchdog/histb_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..d3421bb76326 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1183,6 +1183,14 @@ config SUNPLUS_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called sunplus_wdt.
 
+config HISTB_WATCHDOG
+	tristate "HiSilicon STB Watchdog"
+	depends on (ARCH_HISI || COMPILE_TEST) && OF
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the watchdog timer in HiSilicon STB
+	  SoCs.
+
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 9ac406677aba..d2455e54ab23 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
 obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
 obj-$(CONFIG_MA35D1_WDT) += ma35d1_wdt.o
+obj-$(CONFIG_HISTB_WATCHDOG) += histb_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/histb_wdt.c b/drivers/watchdog/histb_wdt.c
new file mode 100644
index 000000000000..456de7e92562
--- /dev/null
+++ b/drivers/watchdog/histb_wdt.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * HiSilicon STB Watchdog Driver
+ *
+ * The watchdog integrated on HiSilicon STB SoCs reuses the register layout of
+ * sp805, but deviates from the standard sp805 in several ways that make the
+ * existing sp805 driver unusable on these SoCs:
+ *   - The ID registers at 0xfe0..0xffc are unimplemented and read zero,
+ *     requiring a platform device driver rather than AMBA probe;
+ *   - Writing WDTLOCK freezes the counter instead of only blocking register
+ *     writes, so the block must remain unlocked while running;
+ *   - Writing WDTLOAD never reloads the running counter; the counter takes
+ *     WDTLOAD when re-armed by WDTINTCLR or by enabling WDTCONTROL;
+ *   - Writing WDTLOAD with 0 results in a counter starting at 0xffffffff,
+ *     resetting after 2*179s (~6min) at 24 MHz;
+ *   - The counter only advances while unlocked and INT_ENABLE is set.
+ *
+ * Copyright (c) 2026 David Yang
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/spinlock.h>
+#include <linux/watchdog.h>
+
+#define HISTB_WDT_LOAD			0x000
+#define HISTB_WDT_VALUE			0x004
+#define HISTB_WDT_CONTROL		0x008
+#define  HISTB_WDT_RESET_ENABLE			BIT(1)
+#define  HISTB_WDT_INT_ENABLE			BIT(0)
+#define HISTB_WDT_INTCLR		0x00c
+#define HISTB_WDT_RIS			0x010
+#define HISTB_WDT_MIS			0x014
+#define  HISTB_WDT_INT_MASK			BIT(0)
+#define HISTB_WDT_LOCK			0xc00
+#define  HISTB_WDT_UNLOCK_KEY			0x1acce551
+#define  HISTB_WDT_LOCK_KEY			0x00000001
+
+#define MHz 1000000
+
+/* default timeout in seconds */
+#define HISTB_WDT_DEFAULT_TIMEOUT	60
+
+struct histb_wdt {
+	struct watchdog_device wdd;
+
+	void __iomem *base;
+	struct clk *clk;
+	spinlock_t lock;
+	u32 rate;
+	u32 load_val;
+};
+
+/* load cannot be 0, see documentation */
+static void histb_wdt_arm(struct histb_wdt *wdt, u32 load)
+{
+	void __iomem *base = wdt->base;
+
+	writel_relaxed(HISTB_WDT_UNLOCK_KEY, base + HISTB_WDT_LOCK);
+	writel_relaxed(0, base + HISTB_WDT_CONTROL);
+	writel_relaxed(HISTB_WDT_INT_MASK, base + HISTB_WDT_INTCLR);
+	writel_relaxed(load, base + HISTB_WDT_LOAD);
+	writel_relaxed(HISTB_WDT_INT_ENABLE | HISTB_WDT_RESET_ENABLE,
+		       base + HISTB_WDT_CONTROL);
+
+	/* Flush posted writes. */
+	readl_relaxed(base + HISTB_WDT_LOCK);
+}
+
+static int histb_wdt_start(struct watchdog_device *wdd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	int res;
+
+	res = clk_enable(wdt->clk);
+	if (res)
+		return res;
+
+	spin_lock(&wdt->lock);
+	histb_wdt_arm(wdt, wdt->load_val);
+	spin_unlock(&wdt->lock);
+
+	return 0;
+}
+
+static int histb_wdt_stop(struct watchdog_device *wdd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	void __iomem *base = wdt->base;
+
+	spin_lock(&wdt->lock);
+	writel_relaxed(HISTB_WDT_UNLOCK_KEY, base + HISTB_WDT_LOCK);
+	writel_relaxed(0, base + HISTB_WDT_CONTROL);
+	writel_relaxed(HISTB_WDT_LOCK_KEY, base + HISTB_WDT_LOCK);
+	readl_relaxed(base + HISTB_WDT_LOCK);
+	spin_unlock(&wdt->lock);
+
+	clk_disable(wdt->clk);
+
+	return 0;
+}
+
+static int histb_wdt_ping(struct watchdog_device *wdd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	void __iomem *base = wdt->base;
+
+	spin_lock(&wdt->lock);
+	writel_relaxed(HISTB_WDT_INT_MASK, base + HISTB_WDT_INTCLR);
+	writel_relaxed(wdt->load_val, base + HISTB_WDT_LOAD);
+	readl_relaxed(base + HISTB_WDT_LOCK);
+	spin_unlock(&wdt->lock);
+
+	return 0;
+}
+
+static int
+histb_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	u64 rate = wdt->rate;
+	u64 load;
+
+	/*
+	 * histb-wdt runs counter with given value twice, after the end of first
+	 * counter it gives an interrupt and then starts counter again. If
+	 * interrupt already occurred then it resets the system. This is why
+	 * load is half of what should be required.
+	 */
+	load = div_u64(rate * timeout, 2) - 1;
+	load = clamp_val(load, 1, U32_MAX);
+
+	wdt->load_val = load;
+	/* roundup timeout to closest positive integer value */
+	wdd->timeout = div_u64((load + 1) * 2 + (rate / 2), rate);
+
+	if (watchdog_active(wdd)) {
+		spin_lock(&wdt->lock);
+		histb_wdt_arm(wdt, wdt->load_val);
+		spin_unlock(&wdt->lock);
+	}
+
+	return 0;
+}
+
+static unsigned int histb_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+	u64 value;
+
+	spin_lock(&wdt->lock);
+	value = readl_relaxed(wdt->base + HISTB_WDT_VALUE);
+	if (!(readl_relaxed(wdt->base + HISTB_WDT_RIS) & HISTB_WDT_INT_MASK))
+		value += (u64)wdt->load_val + 1;
+	spin_unlock(&wdt->lock);
+
+	return div_u64(value, wdt->rate);
+}
+
+static int
+histb_wdt_restart(struct watchdog_device *wdd, unsigned long mode, void *cmd)
+{
+	struct histb_wdt *wdt = watchdog_get_drvdata(wdd);
+
+	/*
+	 * For reset, we start the WDT clock and leave it running.
+	 * The clock was prepared at probe time; only clk_enable() is
+	 * safe in this atomic (restart notifier) context.
+	 */
+	clk_enable(wdt->clk);
+	/*
+	 * Other CPUs may have been stopped while holding wdt->lock, arm without
+	 * taking it.
+	 */
+	histb_wdt_arm(wdt, 1);
+
+	mdelay(1);
+
+	return 0;
+}
+
+static const struct watchdog_info histb_wdt_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity = "HiSilicon STB Watchdog",
+};
+
+static const struct watchdog_ops histb_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = histb_wdt_start,
+	.stop = histb_wdt_stop,
+	.ping = histb_wdt_ping,
+	.set_timeout = histb_wdt_set_timeout,
+	.get_timeleft = histb_wdt_get_timeleft,
+	.restart = histb_wdt_restart,
+};
+
+static int histb_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct histb_wdt *wdt;
+	struct watchdog_device *wdd;
+	int res;
+
+	wdt = devm_kzalloc_obj(dev, *wdt);
+	if (!wdt)
+		return -ENOMEM;
+
+	wdt->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wdt->base))
+		return PTR_ERR(wdt->base);
+
+	/*
+	 * Keep the clock prepared for the lifetime of the driver:
+	 * .restart() runs in atomic context and may only call clk_enable().
+	 */
+	wdt->clk = devm_clk_get_optional_prepared(dev, NULL);
+	if (IS_ERR(wdt->clk))
+		return dev_err_probe(dev, PTR_ERR(wdt->clk),
+				     "Failed to get clock\n");
+
+	if (wdt->clk)
+		wdt->rate = clk_get_rate(wdt->clk);
+	if (!wdt->rate)
+		device_property_read_u32(dev, "clock-frequency", &wdt->rate);
+	if (!wdt->rate)
+		/* 24 MHz crystal clock default on HiSTB */
+		wdt->rate = 24 * MHz;
+
+	wdd = &wdt->wdd;
+	wdd->parent = dev;
+	wdd->info = &histb_wdt_info;
+	wdd->ops = &histb_wdt_ops;
+	wdd->timeout = HISTB_WDT_DEFAULT_TIMEOUT;
+	wdd->min_timeout = 1;
+	wdd->max_timeout = div_u64(((u64)U32_MAX + 1) * 2, wdt->rate);
+	watchdog_stop_on_reboot(wdd);
+	watchdog_stop_on_unregister(wdd);
+	watchdog_init_timeout(wdd, 0, dev);
+	watchdog_set_drvdata(wdd, wdt);
+
+	spin_lock_init(&wdt->lock);
+
+	histb_wdt_set_timeout(wdd, wdd->timeout);
+
+	platform_set_drvdata(pdev, wdt);
+
+	res = devm_watchdog_register_device(dev, wdd);
+	if (res)
+		return dev_err_probe(dev, res,
+				     "Failed to register watchdog device\n");
+
+	return 0;
+}
+
+static int __maybe_unused histb_wdt_suspend(struct device *dev)
+{
+	struct histb_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdd))
+		histb_wdt_stop(&wdt->wdd);
+
+	return 0;
+}
+
+static int __maybe_unused histb_wdt_resume(struct device *dev)
+{
+	struct histb_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdd))
+		return histb_wdt_start(&wdt->wdd);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(histb_wdt_pm_ops, histb_wdt_suspend,
+				histb_wdt_resume);
+
+static const struct of_device_id histb_wdt_match[] = {
+	{ .compatible = "hisilicon,histb-wdt" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, histb_wdt_match);
+
+static struct platform_driver histb_wdt_driver = {
+	.probe = histb_wdt_probe,
+	.driver = {
+		.name = "histb-wdt",
+		.pm = &histb_wdt_pm_ops,
+		.of_match_table = histb_wdt_match,
+	},
+};
+module_platform_driver(histb_wdt_driver);
+
+MODULE_AUTHOR("David Yang <mmyangfl@gmail.com>");
+MODULE_DESCRIPTION("HiSilicon STB Watchdog Driver");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.53.0


