Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F4B606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W6TjNHmr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2vOVVIJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ghbq/dDyFSCGSMQHs0AQ8pCT6MelXMSKRDi+1C0qWLM=; b=W6TjNHmrVjQVxh
	e2o54X45Ah7p8AMi+Z4e8i0p7HLBsZPtBVr0Jf/J6oITnMB/7qBiKL3Wc4+D2Yzt4Bg42t/rfuStS
	nzSuB45xfpevqEupTPa+WPQQsgAiWM2EqvynrLRG6HXFuFioQnSWDd69YdNHQXyO5CseC9obKnEbV
	bY3CS6dhW8+EbSgPZ/AUgTasoIZMUBM7KNZEZxp5b9R4MjMZ68tHDbuGtTyHE5KmgJRtOA3tWnQ4C
	pXl2EJ1+hriid3bC5gYDJAJz/rEV6/4eWGOlUTLDzby0Z3Rka52cILiTtgA0JzOHJs8sQjyf/yuG5
	ASSIrCYeFRL5xZxYeRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbr-0000000GL4d-2x43;
	Fri, 27 Nov 2026 14:07:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbi-0000000GKyj-0Lcw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:07:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8E25454E3;
	Fri, 27 Nov 2026 14:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8B61F000C1;
	Fri, 27 Nov 2026 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788441;
	bh=Ghbq/dDyFSCGSMQHs0AQ8pCT6MelXMSKRDi+1C0qWLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E2vOVVIJvQMatkBo7AQIG795loKV0qTCVJgg8V2SmJOguJ5ESWwnUb8TscuWaDU49
	 dT0md96xtQM2pfAGw+tygc17DnusriitvJBLuJGb1Nt88uFe4YMeRTysm2xw3aHYCe
	 mRYYsEMwTaKrvU/b6itZPY+wyKNpx+N0YxOvE4tYGi85n2SYpqFjHLx2eHBSyNCkfS
	 BoNrFbYDGVxb394mleOiCRyi1FZd+hKaJXti635q3sIwo1Zaqv9pcbLo52QujIERBX
	 MpMaWuIoq32aM4Dpxo9Gkkkc4HK9he9ZXVicDUNRiFzKQI1DltY575EdBN37EWLfhb
	 q1BcdK0cvVOZQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 10/12] pinctrl: single: Free pinconf settings array with pinctrl_utils_free_map()
Date: Fri, 27 Nov 2026 14:04:58 +0000
Message-ID: <20261127140602.2790001-11-lee@kernel.org>
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

pcs_parse_pinconf() allocates a per-map settings array and attaches it
to map[i].data.configs.configs, while pcs_dt_node_to_map() allocates
*map itself, both via devm_kzalloc_objs() on pcs->dev.

When a consumer device unbinds and re-probes, pcs_dt_free_map() only
frees map and leaks the settings array on pcs->dev.  Moreover, because
pcs_probe() registers the pinctrl device with devres before pinctrl
hogs or consumers call pcs_dt_node_to_map(), devres teardown on
pcs->dev unbind frees *map and settings before
devm_pinctrl_dev_release() invokes .dt_free_map().

Allocate *map and settings with unmanaged kzalloc_objs() and wire
.dt_free_map directly to pinctrl_utils_free_map(), dropping the custom
pcs_dt_free_map() callback.

Fixes: 8f773bfbdd42 ("pinctrl: single: fix possible memory leak when pinctrl_enable() fails")
Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
Closes: https://sashiko.dev/#/bug/linux-fcedec46-4487-4392-a882-3d3bef07e56f
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Allocate the pinconf settings array with kzalloc_objs() and wire .dt_free_map directly to pinctrl_utils_free_map(), dropping pcs_dt_free_map(), per Alexander Sverdlin's review.
 - Update the first Fixes tag to commit 8f773bfbdd42 ("pinctrl: single: fix possible memory leak when pinctrl_enable() fails").

 drivers/pinctrl/pinctrl-single.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 6f5113dcdb4b..3f756796c792 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -32,6 +32,7 @@
 #include "core.h"
 #include "devicetree.h"
 #include "pinconf.h"
+#include "pinctrl-utils.h"
 #include "pinmux.h"
 
 #define DRIVER_NAME			"pinctrl-single"
@@ -308,15 +309,6 @@ static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
 }
 
-static void pcs_dt_free_map(struct pinctrl_dev *pctldev,
-				struct pinctrl_map *map, unsigned num_maps)
-{
-	struct pcs_device *pcs;
-
-	pcs = pinctrl_dev_get_drvdata(pctldev);
-	devm_kfree(pcs->dev, map);
-}
-
 static int pcs_dt_node_to_map(struct pinctrl_dev *pctldev,
 				struct device_node *np_config,
 				struct pinctrl_map **map, unsigned *num_maps);
@@ -327,7 +319,7 @@ static const struct pinctrl_ops pcs_pinctrl_ops = {
 	.get_group_pins = pinctrl_generic_get_group_pins,
 	.pin_dbg_show = pcs_pin_dbg_show,
 	.dt_node_to_map = pcs_dt_node_to_map,
-	.dt_free_map = pcs_dt_free_map,
+	.dt_free_map = pinctrl_utils_free_map,
 };
 
 static int pcs_get_function(struct pinctrl_dev *pctldev, unsigned pin,
@@ -960,7 +952,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 	func->nconfs = nconfs;
 	conf = &(func->conf[0]);
 	m++;
-	settings = devm_kzalloc_objs(pcs->dev, unsigned long, nconfs);
+	settings = kzalloc_objs(unsigned long, nconfs);
 	if (!settings)
 		return -ENOMEM;
 	s = &settings[0];
@@ -1284,7 +1276,7 @@ static int pcs_dt_node_to_map(struct pinctrl_dev *pctldev,
 	pcs = pinctrl_dev_get_drvdata(pctldev);
 
 	/* create 2 maps. One is for pinmux, and the other is for pinconf. */
-	*map = devm_kzalloc_objs(pcs->dev, **map, 2);
+	*map = kzalloc_objs(**map, 2);
 	if (!*map)
 		return -ENOMEM;
 
@@ -1319,7 +1311,7 @@ static int pcs_dt_node_to_map(struct pinctrl_dev *pctldev,
 free_pgnames:
 	devm_kfree(pcs->dev, pgnames);
 free_map:
-	devm_kfree(pcs->dev, *map);
+	kfree(*map);
 
 	return ret;
 }
-- 
2.56.1.839.g22a8290db9-goog


