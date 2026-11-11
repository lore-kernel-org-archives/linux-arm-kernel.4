Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE04606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pI6+iFx8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUN41KzK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RUt0eamBGSiAqwO2GwEE5rxkTrKqiDLlnkwJFDQBAZY=; b=pI6+iFx87mEz6r
	i77yUKML8EN7UofWoZlxI+yb4zpoZBt/xh/n16IqG3j4brRpydBEPWQvg4e4St8RZtghJYdHj1kvZ
	HZ2f+7NiLpmI2mlTs2xUYkihfZlZSklyYjdSlllQDdc1zKkhWkXREtXpI+S+msJX3EABlIxDUIyAM
	3vyFIUXwJ+kloiNzXzRD9ZCpHHz/sZHZr/zE6DUp0mxd1MT5K63YnbKUhkQB7nuroZMRsmm1yikxP
	Bg7M9lsMKI0E59JkgSzOQ5I0mdFMxlOGtOd+X8eb41N+VQ1aXRRfg4+FHSI1a3dV8HBIg2cP+a1qi
	JcJY6O3xqLsny1nmnfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGFy-00000007r8C-2Es6;
	Wed, 11 Nov 2026 21:53:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGFx-00000007r7V-176A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:53:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B3FA42D55;
	Wed, 11 Nov 2026 21:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ECB1F00A09;
	Wed, 11 Nov 2026 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434004;
	bh=RUt0eamBGSiAqwO2GwEE5rxkTrKqiDLlnkwJFDQBAZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XUN41KzKEErQDu4KreLiURpr6gTZ2b6tx0kXuUbvlgJ7+h2AlXbpobqVsyQMa4ecL
	 NqGHozL9jmzC8t2lqx81lzjal9mna0itUSOnfwF9wIRxrirIAnBfMlpkdVNsU86fv8
	 tQE0qWUPk9S4ibEnEOvzJ5euemD0FDLO8pF+ckvUaCEK5uhEpOtH+W/xXPPZ+WjjM8
	 NjxfRFvIMNxHwJHxVxYuNktLN+vG9JlorSPxZBuKxshGXeQ7fIvvTAC3uIEAdINCqJ
	 mGAzrNuJxbW5M29AcnmKhivp2Xapgot6+8EtBx0HRpSGcsJgbCWL93QWsQp7DTs/GX
	 l/+y0nw8LBq7A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 03/10] pinctrl: nuvoton: ma35: Assign fwnode to gpio_chip in ma35_gpiolib_register()
Date: Wed, 11 Nov 2026 21:51:48 +0000
Message-ID: <20261111215256.1982044-4-lee@kernel.org>
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

ma35_gpiolib_register() registers all 14 GPIO banks under the same
parent platform device without setting bank->chip.fwnode to the child
bank node.  Consequently, all GPIO banks share the parent pinctrl node
for OF/fwnode lookups, preventing consumer drivers from resolving
phandles to individual GPIO bank child nodes (&gpiob, &gpioc, etc.).

Set bank->chip.fwnode to bank->fwnode before registering each GPIO
chip.

Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-cbafd8f2-6541-4311-b97b-f7285d2e1992
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 04528e734bc9..25c66b9e8dd2 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -518,6 +518,7 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 		bank->irqinten = 0;
 		bank->chip.label = bank->name;
 		bank->chip.parent = &pdev->dev;
+		bank->chip.fwnode = bank->fwnode;
 		bank->chip.request = ma35_gpio_core_to_request;
 		bank->chip.direction_input = ma35_gpio_core_direction_in;
 		bank->chip.direction_output = ma35_gpio_core_direction_out;
-- 
2.56.0.567.gdb80ae8cd5-goog


