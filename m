Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P0I4hYf9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLYx+yIQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Zvdk3CdQxsP/RSVJbHVVKWhftM/yGouoDXH42tVofI=; b=P0I4hYf9jLPCuE
	qomDxwnCwFKPOTq4O778ey40y/k9Yfoqk8K5uHsQvbZXv/ORJy1TPG0RB8DAagfpQqa9xooFUo3l9
	b5YlMyDL6FhKSyJyRemO2Dq9Z6GtO3esxJ/6iMa4qftTjmalbW5s2L8uncR02eidTXm78igqZ2NzS
	yb7hKT9L6c5KFmBYUU8HfxAWysZb9Pd7Ryl37ZWCZNiELFcIkYS7QB6hVM0yD2AVwF2Sq7lDZjQe2
	f12Es0kHr551mkdFsnw5iuAxgVl2xX3n5d2UnodW1DRmfkhVkoLGV6asiTHBQrzbUYxlgHQLEDQg2
	geFb1UTqdXnjcx6ajatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwal-0000000GKcP-3j2R;
	Fri, 27 Nov 2026 14:06:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwae-0000000GKac-3E78
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:06:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C53F612A2;
	Fri, 27 Nov 2026 14:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E98C1F008A0;
	Fri, 27 Nov 2026 14:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788375;
	bh=5Zvdk3CdQxsP/RSVJbHVVKWhftM/yGouoDXH42tVofI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KLYx+yIQS4RZ8jtOMe6bGlK48BE1lNA7Fu7knRil0Q7TC3Lsb3SIPE0Tpas6NxLHn
	 bEbgD5V171ErYdbfnrX3Ji0pAXNIqBYXkuDtwSYsDm/mklsr1uu3vlMWBQsr6koBew
	 ui5MSbuJ7uhITvPICCnJ6x4h8KetesFXMKv27qgetB0hGmEfWNLXYHpXTWZIYTZdKD
	 QhLBrQ6iC/bJ+Xf7FI4oSNpQwALa5CMLI6kbTucdwoLRzNeW5oEFQ2Yuuj7i/u0Kox
	 l6yD2NOvRKhHN723JwP4jQNkS8vNalNg28xIeuDYFB7ovmgLgYkwNWoNaOUZomb0Pz
	 touF/VliKfFbA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 01/12] pinctrl: nuvoton: ma35: Unmap reg_base and release clock on probe error
Date: Fri, 27 Nov 2026 14:04:49 +0000
Message-ID: <20261127140602.2790001-2-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

ma35_get_bank_data() maps bank->reg_base via fwnode_iomap() and acquires
and enables bank->clk via of_clk_get() and clk_prepare_enable(), neither
of which is devres-managed.  If of_clk_get() or clk_prepare_enable()
fails, bank->reg_base is leaked, and ma35_pinctrl_get_soc_data() ignores
the error and continues probing with an uninitialised bank.

Register devm cleanup actions for bank->reg_base and bank->clk, and
propagate errors from ma35_get_bank_data() in
ma35_pinctrl_get_soc_data().

Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-2046e6c6-45d1-42d4-ae9f-27fac33b07e7
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 37 ++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 564ec0aa4287..872769db244b 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -11,6 +11,7 @@
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -556,6 +557,22 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 	return 0;
 }
 
+static void ma35_bank_iounmap(void *data)
+{
+	struct ma35_pin_bank *bank = data;
+
+	iounmap(bank->reg_base);
+	bank->reg_base = NULL;
+}
+
+static void ma35_bank_clk_release(void *data)
+{
+	struct ma35_pin_bank *bank = data;
+
+	clk_disable_unprepare(bank->clk);
+	clk_put(bank->clk);
+}
+
 static int ma35_get_bank_data(struct ma35_pin_bank *bank)
 {
 	int ret;
@@ -564,6 +581,10 @@ static int ma35_get_bank_data(struct ma35_pin_bank *bank)
 	if (!bank->reg_base)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(bank->dev, ma35_bank_iounmap, bank);
+	if (ret)
+		return ret;
+
 	bank->irq = fwnode_irq_get(bank->fwnode, 0);
 
 	bank->nr_pins = MA35_GPIO_PORT_MAX;
@@ -573,10 +594,12 @@ static int ma35_get_bank_data(struct ma35_pin_bank *bank)
 		return PTR_ERR(bank->clk);
 
 	ret = clk_prepare_enable(bank->clk);
-	if (ret)
+	if (ret) {
 		clk_put(bank->clk);
+		return ret;
+	}
 
-	return ret;
+	return devm_add_action_or_reset(bank->dev, ma35_bank_clk_release, bank);
 }
 
 static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_device *pdev)
@@ -584,7 +607,7 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
 	struct fwnode_handle *child;
 	struct ma35_pin_ctrl *ctrl;
 	struct ma35_pin_bank *bank;
-	int i, id = 0;
+	int i, id = 0, ret;
 
 	ctrl = pctl->ctrl;
 	ctrl->nr_banks = MA35_GPIO_BANK_MAX;
@@ -604,8 +627,12 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
 		bank->fwnode = child;
 		bank->regmap = pctl->regmap;
 		bank->dev = &pdev->dev;
-		if (!ma35_get_bank_data(bank))
-			bank->valid = true;
+		ret = ma35_get_bank_data(bank);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
+		}
+		bank->valid = true;
 		id++;
 	}
 	return 0;
-- 
2.56.1.839.g22a8290db9-goog


