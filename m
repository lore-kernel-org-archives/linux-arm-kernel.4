Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078B7606A91E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WrzDWcN6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJ3DMmBj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zpt4Bof52dDo4blFPTUKDmBeQ0aUkck9+bykbp/3xPs=; b=WrzDWcN6oOzZMp
	Rw/5Slj7jVn1unhEKaafPBEljw0je7Uq95KGBWSvWSPhioVtTHWb0qqY6TM02s/1qn1xLH+A0i23/
	Xx7yIh8s+UqVslQRTP+eyLjKCY89iVzIj8DGHQJK5SpBzGWrn1KJ2piK3g8VuUiaKMsoAmtViuxt1
	3oXwFZnlwpgJ9S1OoASWLdSmlKlJhXVfR6NRDR6MDc3iIgi1XsJpgMBYUtRvBah9shEZA5zP86BMW
	fSMGyimHGiCtgvK6sVv8KVTNe9cxSNghnOEMMNjlExSa4vIEwpq/Y2M4njvd/rJDeLCzsX2LOhaiq
	op19XW4kzYZiTcmWUVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU96U-0000000DQk0-0gxV;
	Thu, 19 Nov 2026 20:51:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU96R-0000000DQj8-25WH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:51:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43851466FD;
	Thu, 19 Nov 2026 20:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753E71F000C6;
	Thu, 19 Nov 2026 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121491;
	bh=zpt4Bof52dDo4blFPTUKDmBeQ0aUkck9+bykbp/3xPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BJ3DMmBjeORKp0RAZud/HkCH9x9w7U7vz3qIWPuHa0lFtbh4NxpsOkoHUMx7UdsJ2
	 O4MOJTSxHS7EOmZljF0ppCeib4Pw3jyPf0EBnQLp/sfg1xzw/WIxjs5X/F3mmNEcDn
	 u3hd4lWs7HjYDB1P9s2pGBTpMSmUHhbVPtOUc1TqM73xL5Cd3/XlvKhdOHGMl/uyjD
	 5XNPNi3x55UVIN2LnX9yrE48Kl/hIEx5bk7KpyOeml4gMJqUvrqUd6lH4ehlqQzhF+
	 Yymqmjm3oCKWKTzYVt4mb4/vGJEEH2LNWL9kpkzyYW9+HSaJmxxOnR95mlwoem5xcu
	 ZXjTTT/OHgPnw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 10/12] pinctrl: single: Free pinconf settings array in pcs_dt_free_map()
Date: Thu, 19 Nov 2026 20:49:06 +0000
Message-ID: <20261119205013.2563811-11-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119205013.2563811-1-lee@kernel.org>
References: <20261119205013.2563811-1-lee@kernel.org>
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

pcs_parse_pinconf() allocates a per-map settings array and attaches it
to map[i].data.configs.configs, while pcs_dt_node_to_map() allocates
*map itself, both via devm_kcalloc() on pcs->dev.

When a consumer device unbinds and re-probes, pcs_dt_free_map() only
frees map and leaks the settings array on pcs->dev.  Moreover, because
pcs_probe() registers the pinctrl device with devres before pinctrl
hogs or consumers call pcs_dt_node_to_map(), devres teardown on
pcs->dev unbind frees *map and settings before
devm_pinctrl_dev_release() invokes pcs_dt_free_map().

Allocate *map and settings with unmanaged kcalloc() and free both with
kfree() in pcs_dt_free_map().

Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree based pinctrl driver")
Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
Closes: https://sashiko.dev/#/bug/linux-fcedec46-4487-4392-a882-3d3bef07e56f
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - Switch *map and settings to unmanaged kcalloc()/kfree() so devres
   cannot free *map before pcs_dt_free_map() runs

 drivers/pinctrl/pinctrl-single.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 1779ffbc1181..1ba692a7ecac 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -311,10 +311,12 @@ static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
 static void pcs_dt_free_map(struct pinctrl_dev *pctldev,
 				struct pinctrl_map *map, unsigned num_maps)
 {
-	struct pcs_device *pcs;
+	for (unsigned int i = 0; i < num_maps; i++) {
+		if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
+			kfree(map[i].data.configs.configs);
+	}
 
-	pcs = pinctrl_dev_get_drvdata(pctldev);
-	devm_kfree(pcs->dev, map);
+	kfree(map);
 }
 
 static int pcs_dt_node_to_map(struct pinctrl_dev *pctldev,
@@ -964,8 +966,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 	func->nconfs = nconfs;
 	conf = &(func->conf[0]);
 	m++;
-	settings = devm_kcalloc(pcs->dev, nconfs, sizeof(unsigned long),
-				GFP_KERNEL);
+	settings = kcalloc(nconfs, sizeof(unsigned long), GFP_KERNEL);
 	if (!settings)
 		return -ENOMEM;
 	s = &settings[0];
@@ -1289,7 +1290,7 @@ static int pcs_dt_node_to_map(struct pinctrl_dev *pctldev,
 	pcs = pinctrl_dev_get_drvdata(pctldev);
 
 	/* create 2 maps. One is for pinmux, and the other is for pinconf. */
-	*map = devm_kcalloc(pcs->dev, 2, sizeof(**map), GFP_KERNEL);
+	*map = kcalloc(2, sizeof(**map), GFP_KERNEL);
 	if (!*map)
 		return -ENOMEM;
 
@@ -1324,7 +1325,7 @@ static int pcs_dt_node_to_map(struct pinctrl_dev *pctldev,
 free_pgnames:
 	devm_kfree(pcs->dev, pgnames);
 free_map:
-	devm_kfree(pcs->dev, *map);
+	kfree(*map);
 
 	return ret;
 }
-- 
2.56.1.750.gf70dc682cf-goog


