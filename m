Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1f1kLeQh;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=eFaCwpCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n9iKJQ0ODduFNUuImSDNNL7ErQfbbfsZlX7pZrvxC9o=; b=1f1kLeQhwr2uKh
	YDSxcd5lVAHKLlubjka53XnuMFF8w+TST3wdLJO9sbJ3ZweTVVP9jwDiAe/VadZu86gWLS+8UeHwY
	Os40jKaouqbIS/6Sv9AZ2Zh8LuSkMnpUsIEvkWJkeBhxKqIEmO53rNSC1dJWIZNt5tUzi8nxzVh9v
	RlPNawUL+J9i6jxBRUrPstPCechsM53iHYi6xrhEei6/Yq33nTZDWIgt+/Ju/tPWlwVieXImcsqJQ
	xUd+0jGIe1F/S/wXAO5/wpywd/PTnMGFffrsQwMisSxQ5/BsQa1kt3NxogknswoeB4/nw8f5G9Qyj
	HDzAW+VN1/biCvcI62yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD1-0000000FpTD-3wi5;
	Fri, 27 Nov 2026 11:33:43 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCq-0000000FpJV-2Hvp;
	Fri, 27 Nov 2026 11:33:34 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 56429982e;
	Fri, 27 Nov 2026 19:33:27 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: ulfh@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jianxin.pan@amlogic.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] pmdomain: amlogic: Tear down EE domains and their OF provider
Date: Fri, 27 Nov 2026 19:33:25 +0800
Message-Id: <20261127113326.390398-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113326.390398-1-202300460064@mail.sdu.edu.cn>
References: <20261127113326.390398-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc8230303a2kunm351106c8395dd7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSR1OVkxOTExNTRlPGEpNTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=eFaCwpClZEM3BORHOVvcDNoKNbseIf0IPFEyct3qIYCYm43POZwhMqKINaEtr3E6rrtW5v9GVA/Fd0M/wrIwia7PAJA6m/8ELPxNAAOEgsYGngQPQGw9fFugePdhsbTaz46+HtvSkdnjlcQM6bJAf6ns4TT/1/rRs6gkbBOCOJ4=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=n9iKJQ0ODduFNUuImSDNNL7ErQfbbfsZlX7pZrvxC9o=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033332_857789_0218B3A4 
X-CRM114-Status: UNSURE (   9.74  )
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

The Meson EE power driver leaves the provider and domains registered
after freeing their backing storage. Remove the OF provider on unbind
and release initialized domains during managed cleanup, including when
probe fails.

This issue was found by our static analysis tool under development.

Fixes: eef3c2ba0a42 ("soc: amlogic: Add support for Everything-Else power domains controller")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pmdomain/amlogic/meson-ee-pwrc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
index 338f70d77bf0..f108d9337e5e 100644
--- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
@@ -428,6 +428,16 @@ static int meson_ee_pwrc_on(struct generic_pm_domain *domain)
 				       pwrc_domain->clks);
 }
 
+static void meson_ee_pwrc_remove_domain(void *data)
+{
+	pm_genpd_remove(data);
+}
+
+static void meson_ee_pwrc_remove(struct platform_device *pdev)
+{
+	of_genpd_del_provider(pdev->dev.of_node);
+}
+
 static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 				     struct meson_ee_pwrc *pwrc,
 				     struct meson_ee_pwrc_domain *dom)
@@ -494,7 +504,8 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 			return ret;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(&pdev->dev, meson_ee_pwrc_remove_domain,
+					&dom->base);
 }
 
 static int meson_ee_pwrc_probe(struct platform_device *pdev)
@@ -641,6 +652,7 @@ MODULE_DEVICE_TABLE(of, meson_ee_pwrc_match_table);
 
 static struct platform_driver meson_ee_pwrc_driver = {
 	.probe = meson_ee_pwrc_probe,
+	.remove = meson_ee_pwrc_remove,
 	.shutdown = meson_ee_pwrc_shutdown,
 	.driver = {
 		.name		= "meson_ee_pwrc",
-- 
2.43.0


