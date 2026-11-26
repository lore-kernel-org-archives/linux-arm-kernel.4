Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC7B606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QV5X+3eZ;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=EgO/TYdM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DiATayS2KmKYPoh8MDc6ESE1N2bYjQDbIVyIlvkFuuI=; b=QV5X+3eZLIRqtAlgPP4kivzz6i
	p+ljsYAdGuJV3mcSpFhYcEAaik86ufnleOwh3MP1sW7Q3BvRPXKteNC93L7egtBU9gE1UMYtnX7TY
	npSSwKGVU2pGy+R60HqFuHqscZLach19fvPgp4tWOEoBdBFaMHWjD/nk+9oOhiML0SGHm18jidpId
	AHy7n5vW2bmWhmeKwO94yJuABKZXiOIC4z/HD7Z3vDrEb4trVFn8azi7zw0SS/GlBoMJPqZ9BgHSH
	8qOD3lEV8bRbLFf5JorqmXrJXieWULnaEpI5xnTqU6ZtX4cfZmgcBj//DsIsMj780dVl4YDb7NYvp
	MfeBX5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWm-0000000DLkY-0ifH;
	Thu, 26 Nov 2026 13:28:45 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZW8-0000000DLUA-1hjH;
	Thu, 26 Nov 2026 13:28:07 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb1;
	Thu, 26 Nov 2026 21:28:01 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: xianwei.zhao@amlogic.com,
	linusw@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] pinctrl: amlogic-a4: Fix potential use-after-free on cleanup
Date: Thu, 26 Nov 2026 21:28:00 +0800
Message-Id: <20261126132800.4091071-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180aa71203a2kunma8fb47fc35d94a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEtPVkIeTR0dTUNLGB0fHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=EgO/TYdM/cfEHmDU2jtUb+MzHUXmXo+V/N1mh1ygoae55Ir0cK79FSBJXfuFhQwVNvWNlX+CTsK7XfRItLNlG+cBVoB8foNMztRGN1S/oD0J6dLjS06iWmekorUcekbD3+JKsC+YLQhdBLsrj8/dNA1596xPaKbY6rOxBQRkaj8=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=DiATayS2KmKYPoh8MDc6ESE1N2bYjQDbIVyIlvkFuuI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052805_083711_0A791BDE 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

A later bank registration failure leaves the earlier GPIO chips
registered while devres releases their backing storage. Successful
unbind also leaves the chips registered.

Use managed registration to remove the chips before releasing their
banks on both paths.

This issue was found by our static analysis tool under development.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index b258bd88d745..33b17a2db1cd 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -1209,7 +1209,8 @@ static int aml_pctl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(info->pctl), "Failed pinctrl registration\n");
 
 	for (i = 0; i < info->nbanks; i++) {
-		ret  = gpiochip_add_data(&info->banks[i].gpio_chip, &info->banks[i]);
+		ret = devm_gpiochip_add_data(dev, &info->banks[i].gpio_chip,
+					     &info->banks[i]);
 		if (ret)
 			return dev_err_probe(dev, ret, "Failed to add gpiochip(%d)!\n", i);
 	}

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0


