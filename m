Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A746606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JsTC5wMi;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=N3CgIE+s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HZJ8HDe/Tt74RwLwlmWCp8vNubY28nvyro8T5zfrfHQ=; b=JsTC5wMiPyGrmlP+AImb/20vgU
	JtLeiHFHFrzyHzioQE5f1/MjBqUX02+cGg+lQ3AINvGlfNQNXmDc1t3wy9WPt/WdqUiQDZF6zKQnr
	dK51IjfgC4Vvm1dmB9y3c+OJKvjuL93blDB3PMoBlfvySjSFT+lNeiIQpMLimMOT5NT93PLUOtM3x
	tXgNLVOy2IVXBRa4K8Zhbezj7FaHxDbgCTU/c0b58+/YlRJN8qC9/RLKkKD2PbnH5r+LrHqVrXwlQ
	rodeGde/OZbYCNk9OGRA1MfG6/DxA+VjiuOawENxrHgR0QCJyfJFE/ukpGeRWevre0nsvbZwOTFYQ
	WFnoodRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCo-00000000hXP-0E0P;
	Sat, 28 Nov 2026 11:03:02 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCS-00000000hNT-0hUs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 11:02:37 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652b2;
	Sat, 28 Nov 2026 19:02:33 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vireshk@kernel.org,
	linusw@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] pinctrl: spear: plgpio: Unregister the GPIO chip on removal
Date: Sat, 28 Nov 2026 19:02:32 +0800
Message-Id: <20261128110232.875407-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa221d232f503a2kunmd47070a13cbc8c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGExIVk5OTR4YHR9PQxgYT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=N3CgIE+sSOu5JRIuR0qN2ssftzeuc3/WnBUm/V3zWv4tWiDOyG7QQQCVmBfJwZaWOE1FHks/ki1SSop2nnjscdkMtt1AD/9fJEtC6Z+pDBN8+C+Fd9ykdsii3LveXuQv6MLDq6nrSvEk2+J/Wa9mz88yHnNysbDjQKD9h3fhccs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=HZJ8HDe/Tt74RwLwlmWCp8vNubY28nvyro8T5zfrfHQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_030236_445000_1296398D 
X-CRM114-Status: UNSURE (   8.68  )
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

Device removal frees the PLGPIO state while its embedded GPIO chip
remains registered. Use managed registration so gpiolib drops the
chip first.

This issue was found by our static analysis tool under development.

Fixes: 604bb7da7780 ("pinctrl: SPEAr: Add plgpio driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index b5fc76e114be..b17df26c82b1 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -612,7 +612,7 @@ static int plgpio_probe(struct platform_device *pdev)
 		dev_info(&pdev->dev, "PLGPIO registering without IRQs\n");
 	}
 
-	ret = gpiochip_add_data(&plgpio->chip, plgpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &plgpio->chip, plgpio);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to add gpio chip\n");
 		goto unprepare_clk;

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0


