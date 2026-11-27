Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2iu5EZRe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFqdRanC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cl3WMRh8WfbyggNJj0mYrqYIIHZqYdXVuU2aAEiLuBQ=; b=2iu5EZRejcdRap
	2vln9L5OT1n6Z7KBNADP3TRIWONjPq2feOzxESQE7tTNM6zLHBUnbDvO3rY2SVfuhKF0P+h+ZAS4b
	x4BP7g2prUxqq4nCmJVmTSYqbb40+6E3WyT8lR+lukyAdReNgtTiN3vJKQgCj4ZmbyccGX7ro0X2a
	/vLOuvYqKvVzvTjsN1fLXZQhtvpLxOMVJwcvomKGXIbqx6PU6A9DXiywzhSsyr2aYYn9TIBZM+jXu
	46DF7ggURUAxiJbS1SJshQkKh9PDkDwZntMEeQL5pUqQspHAgSVW5lIS0fPGgTVP7NXtkCAgiRyWI
	MZlIm+kHPdRSHf5S/xIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbF-0000000GKmw-42Fa;
	Fri, 27 Nov 2026 14:06:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWway-0000000GKfv-0ejM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:06:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9793F61CE8;
	Fri, 27 Nov 2026 14:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E781F00898;
	Fri, 27 Nov 2026 14:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788394;
	bh=cl3WMRh8WfbyggNJj0mYrqYIIHZqYdXVuU2aAEiLuBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PFqdRanC2eAH+EKS7miBakhKmzTw8oeFVqlpXTT9gATFls6BiAEdB/F4IO3rOB77C
	 rvvnINPUVac78BJyVuW4dxrAMNbN28bOTm4jgTuLq7y/sm4xFtdHskJxBGNZMW4QRI
	 RqfZ8ohcgcW3BxOoWoqngd2dOV0r7AJY63a7nEiMheyBroR8GB20qJDd8NKN8y2L8x
	 jQxt6Y8ROQboXJf5timEN6AJ09gi17ZmFgUJ6HOdkYFnhiYfI/2gPx18+gzjq5vwDw
	 M+2VzX+15fLltZwkRifYbmDu+1hVtyiDu8MoZhBJ4mdgL5XsTe/CgSAoOqdjqzNemk
	 Vok4ycVsyDWXQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 04/12] pinctrl: nuvoton: ma35: Assign fwnode to gpio_chip in ma35_gpiolib_register()
Date: Fri, 27 Nov 2026 14:04:52 +0000
Message-ID: <20261127140602.2790001-5-lee@kernel.org>
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
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 797b4dece7b1..b6411fc4d98b 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -519,6 +519,7 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 		bank->irqinten = 0;
 		bank->chip.label = bank->name;
 		bank->chip.parent = &pdev->dev;
+		bank->chip.fwnode = bank->fwnode;
 		bank->chip.request = ma35_gpio_core_to_request;
 		bank->chip.direction_input = ma35_gpio_core_direction_in;
 		bank->chip.direction_output = ma35_gpio_core_direction_out;
-- 
2.56.1.839.g22a8290db9-goog


