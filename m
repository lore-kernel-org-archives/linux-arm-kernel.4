Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1EF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eaAW5/80;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCh2/hCf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OTnxyO9HGZRIDB4lUzROzHOrnSel8Aijr2T9djhyVlY=; b=eaAW5/80aVKtU5
	dLjKNAfYyK2xON8XPP1TtRUYdsD+TaOB8XSf1GH5dc07UgRnQwEysyoiMlzVIt7rStzSgyHVmwm0s
	b57SWjCiR12dpNwiW1BCWb4ifgjXZ2ecKZIxD8zFi2+UIq216q8zcByerdUXQqK+tcEQZBGDFMB7+
	/NS5llfbZnyKwtO6puPXwfJIgBeTnq25uJ1p/Rj0S/Le9N+99xwCokZeoY9QGJxdw8ao44GSINoVw
	qE3xjPsWsGpL6S8nAY5xvu3x1xzKK0tUeUcCqBxQyRKROAmPyfFsltxbqOidh+HD2zw+52odIUgNg
	lWkQ0EmqAqOAjIuC8Ctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwaw-0000000GKew-3dJa;
	Fri, 27 Nov 2026 14:06:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwaq-0000000GKcb-3v4f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:06:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 780F0414FF;
	Fri, 27 Nov 2026 14:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7381F00893;
	Fri, 27 Nov 2026 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788388;
	bh=OTnxyO9HGZRIDB4lUzROzHOrnSel8Aijr2T9djhyVlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RCh2/hCfuvxneGhDBIIgmoGkLj8by6aAmN0OLB2HjBHYHkz5EwM9GYpJLvqNigxyY
	 cweboX//B861BKyghKb+sRNzewo8C/VHoh030lEeSQX6Lesrl9+m3x8DHDmUt5ITZl
	 rB49Ph6i4qSfD6KSRlsObycS4OTpHtsAUvWI1mITpoUN8taDtMd0qfrKqARj72iNYA
	 do06VDu6nN0njZSmVdXlqy41nFePgqZsf2cgHvUkn32mzH+h48vOMcjXYJNVStisew
	 2Ki5fjt1cjHOQfP5NnMO5LnYFroePt94ioDpVfns9zt5++PkmlZva6O007QlFfE3yQ
	 nsf9TNQ+3xqQA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 03/12] pinctrl: nuvoton: ma35: Retain child firmware node reference in ma35_pinctrl_get_soc_data()
Date: Fri, 27 Nov 2026 14:04:51 +0000
Message-ID: <20261127140602.2790001-4-lee@kernel.org>
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

for_each_gpiochip_node() drops its reference on each child firmware node
as the loop advances.  Storing child directly in bank->fwnode without
acquiring a reference leaves bank->fwnode dangling once the iteration
moves on, leading to a use-after-free when ma35_gpiolib_register()
accesses bank->fwnode.

Acquire a reference on child with fwnode_handle_get() and register a
devres action to release it on probe failure or device teardown.

Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-f140abe2-145a-4f6b-b626-bbabdc7327c4
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index ddd3f4329f67..797b4dece7b1 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -557,6 +557,11 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 	return 0;
 }
 
+static void ma35_bank_fwnode_release(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static void ma35_bank_iounmap(void *data)
 {
 	struct ma35_pin_bank *bank = data;
@@ -630,7 +635,14 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_
 			return -EINVAL;
 		}
 		bank = &ctrl->pin_banks[id];
-		bank->fwnode = child;
+		bank->fwnode = fwnode_handle_get(child);
+		ret = devm_add_action_or_reset(&pdev->dev,
+					       ma35_bank_fwnode_release,
+					       bank->fwnode);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
+		}
 		bank->regmap = pctl->regmap;
 		bank->dev = &pdev->dev;
 		ret = ma35_get_bank_data(bank);
-- 
2.56.1.839.g22a8290db9-goog


