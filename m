Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC947606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aqpf3mVx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCkLQYD2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=if/+0+pFnNU6k0PCEw4KVoy6ZadNyLU8ILGbmz3mIQI=; b=Aqpf3mVxl0Qp0t
	Ur1pBFqDoow8Cv+BYq/FwvgGxf1J5ZU2R1bcHIkjDa1ZCy46SdR5OjGINXwlYNWGOH/EOrjqB2i8p
	UIxs+ZO8nrXpLZuosEQ7q2RmpPzmKWlMUc8XCINU7CRlf6csiCKG7DuGTqkoSf+6Q0xgdNPoJtw7u
	OET8uE5JRw/xnwMaL8tX3cBLCuuZ6TLTkWbvKeqAPlaojr+g3Z1lxKnZh8AFnaeTgnF58UjII7/OZ
	M3A1QYDqV84i2I66Qq8TxsCoEkNhXIxuFFVA1pocRZmxPP7v1Bvx9HBG7lm0OKwA1Mr7Gm0rm9bP2
	DFwz2x7jM880tEPJu/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGFk-00000007r0r-3rXt;
	Wed, 11 Nov 2026 21:53:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGFj-00000007r0C-3Lbd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:53:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40739635C5;
	Wed, 11 Nov 2026 21:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEC01F00A06;
	Wed, 11 Nov 2026 21:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794433991;
	bh=if/+0+pFnNU6k0PCEw4KVoy6ZadNyLU8ILGbmz3mIQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TCkLQYD2wxm/SVXZdhDspHY9KM2fXi3kUefod6ZsVx1SMgHexvi502AKjsKY6llOF
	 a0hJSKD11kEG4/KLoG0Z0KmfL9p89gvFahAcV6h0QoQBKSpWKoErgaod5eQW4e0XXX
	 LbELG9NJkgnGwoGFswsKK5A22eixZlYfGh7CxzsJzGnXywv6fUSun0+mXUay1uZpUd
	 hkI6LUz9TUXrd+ahltkwvAr06dRlpXYz6ap1JE/AdlZWM4oSmbLadVcGzkvEvbXOWd
	 yVPdCxHGEhkx5Gac5Q7H5AGQDNQHCAZ3dJSohe5qxkg6RgHW6ZsQ4dnvWv/nBFFeOw
	 SmqcSUJ3ikpRg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 01/10] pinctrl: nuvoton: ma35: Unmap reg_base and release clock on probe error
Date: Wed, 11 Nov 2026 21:51:46 +0000
Message-ID: <20261111215256.1982044-2-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215256.1982044-1-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
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
propagate errors from ma35_get_bank_data() in ma35_pinctrl_get_soc_data().

Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-2046e6c6-45d1-42d4-ae9f-27fac33b07e7
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 36 ++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index a79ebf4be2c3..408927ab19da 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -555,6 +555,22 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
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
@@ -563,6 +579,10 @@ static int ma35_get_bank_data(struct ma35_pin_bank *bank)
 	if (!bank->reg_base)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(bank->dev, ma35_bank_iounmap, bank);
+	if (ret)
+		return ret;
+
 	bank->irq = fwnode_irq_get(bank->fwnode, 0);
 
 	bank->nr_pins = MA35_GPIO_PORT_MAX;
@@ -572,10 +592,12 @@ static int ma35_get_bank_data(struct ma35_pin_bank *bank)
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
@@ -583,7 +605,7 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
 	struct fwnode_handle *child;
 	struct ma35_pin_ctrl *ctrl;
 	struct ma35_pin_bank *bank;
-	int i, id = 0;
+	int i, id = 0, ret;
 
 	ctrl = pctl->ctrl;
 	ctrl->nr_banks = MA35_GPIO_BANK_MAX;
@@ -603,8 +625,12 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
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
2.56.0.567.gdb80ae8cd5-goog


