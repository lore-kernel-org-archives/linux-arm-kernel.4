Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54714606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jYnSeFcu;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=V6mRf28G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3RaGK0nA/1YoPSMRqDclzGUojIWWpEHUoUIK1TK/zVs=; b=jYnSeFcuaIJUBW
	3kO9sDm9PsgEshQ1qioxjMALG/VajqN55DIKZCOmx1ax3EnQb7L4aSJXwXD5acIyu49jQ7LbK37qM
	gFx9BR6vNfX4vQ6MVzxLpvFYF4haBmSvl3RiNTO0BnzTNfACYGxoKUa7iv2glJAuf8YjEyYUiD48E
	2/W1VyqICGc8iwv+qss51G8SlzU8B9DhCPOSsASIOugk7z0+wUX7PthiiVB7KsjOyiPuGTbKhVdfJ
	QmaikREsjDhYHsZxtPInIodH/5DFUVo2AzkN9in7/GFkNo4J1i8mgDLIY703v81+rZPtzwF741DEI
	WNPiArK1dHXm5KJBJjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD6-0000000FpY7-15jO;
	Fri, 27 Nov 2026 11:33:48 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCr-0000000FpJX-0RT3;
	Fri, 27 Nov 2026 11:33:35 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 56429982f;
	Fri, 27 Nov 2026 19:33:28 +0800 (GMT+08:00)
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
Subject: [PATCH 2/2] pmdomain: amlogic: Tear down secure domains and their OF provider
Date: Fri, 27 Nov 2026 19:33:26 +0800
Message-Id: <20261127113326.390398-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113326.390398-1-202300460064@mail.sdu.edu.cn>
References: <20261127113326.390398-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc8263803a2kunm351106c8395ddb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT01DVhkZH0JLTkpKQ0xNGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=V6mRf28GIaRbxbP+EMM1nbUnCjROossXjStzNvVbFsnFbmykIxqATP1RxV3EywKKUoO2othvuUhEUc2qfcZBKolPtQec0PJq4Ken6kIpsuaci44K1LzDrQayj+TnHz8bkQFbTtS/wzvpoc6N88xQbvq8oO/aq9NSX9HhBvRZMTs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=3RaGK0nA/1YoPSMRqDclzGUojIWWpEHUoUIK1TK/zVs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033334_602979_13E55966 
X-CRM114-Status: GOOD (  11.59  )
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

The secure power driver leaves the OF provider and domain hierarchy
registered after its memory is released. Remove the provider on unbind
and unwind subdomain links before the domains they connect. Use the same
cleanup when probe fails midway.

This issue was found by our static analysis tool under development.

Fixes: b3dde5013e13 ("soc: amlogic: Add support for Secure power domains controller")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 36 ++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
index c424a1e76174..53e3fa10328e 100644
--- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
@@ -392,9 +392,26 @@ static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
 	SEC_PD(T7_AUDIO,	0),
 };
 
+static void meson_secure_pwrc_remove_domain(void *data)
+{
+	pm_genpd_remove(data);
+}
+
+static void meson_secure_pwrc_remove_subdomain(void *data)
+{
+	struct meson_secure_pwrc_domain *dom = data;
+
+	pm_genpd_remove_subdomain(&dom->pwrc->domains[dom->parent].base, &dom->base);
+}
+
+static void meson_secure_pwrc_remove(struct platform_device *pdev)
+{
+	of_genpd_del_provider(pdev->dev.of_node);
+}
+
 static int meson_secure_pwrc_probe(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	struct device_node *sm_np;
 	struct meson_secure_pwrc *pwrc;
 	const struct meson_secure_pwrc_domain_data *match;
@@ -453,7 +470,13 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
 		if (match->domains[i].is_off(dom) && (dom->base.flags & GENPD_FLAG_ALWAYS_ON))
 			meson_secure_pwrc_on(&dom->base);
 
-		pm_genpd_init(&dom->base, NULL, match->domains[i].is_off(dom));
+		ret = pm_genpd_init(&dom->base, NULL, match->domains[i].is_off(dom));
+		if (ret)
+			return ret;
+		ret = devm_add_action_or_reset(&pdev->dev, meson_secure_pwrc_remove_domain,
+					       &dom->base);
+		if (ret)
+			return ret;
 
 		pwrc->xlate.domains[i] = &dom->base;
 	}
@@ -464,7 +487,13 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
 		if (!match->domains[i].name || match->domains[i].parent == PWRC_NO_PARENT)
 			continue;
 
-		pm_genpd_add_subdomain(&dom[dom[i].parent].base, &dom[i].base);
+		ret = pm_genpd_add_subdomain(&dom[dom[i].parent].base, &dom[i].base);
+		if (ret)
+			return ret;
+		ret = devm_add_action_or_reset(&pdev->dev, meson_secure_pwrc_remove_subdomain,
+					       &dom[i]);
+		if (ret)
+			return ret;
 	}
 
 	return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
@@ -567,6 +596,7 @@ MODULE_DEVICE_TABLE(of, meson_secure_pwrc_match_table);
 
 static struct platform_driver meson_secure_pwrc_driver = {
 	.probe = meson_secure_pwrc_probe,
+	.remove = meson_secure_pwrc_remove,
 	.driver = {
 		.name		= "meson_secure_pwrc",
 		.of_match_table	= meson_secure_pwrc_match_table,
-- 
2.43.0


