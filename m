Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CA0606CC5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J5s/XK3M;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nZm63OKl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HzCI/OC/wj0bvnUWN/Wm9v2nEQ4J42ID8/rtjwSGIro=; b=J5s/XK3MhEJZcF
	c0oCJdk8n8qdqJDHR5/j1HQtejH6qYhzIqmvmmkjBKHBW5oBRYdkd89UWM1e9gm7dHm9iARYmujwk
	c2UtnbLz6rHAx6xsHKwVAArfXeETriCrmuYtZBiTmQaStq9IpadrKXqXrI21SPpjJ2t7OHsVgfWMS
	/qmh0/LZs4wOz+I7Q522tdxpv6FNC6Q5DtX66pvw2bsv6d4Yl2g7NT0cXKqWSBkc/V1niyjRwqj4s
	hJNi7MK8dz1fgwzDT75EKUdGNamN0Uy4HG5RdO06hENjgboV2FA2HLEJjb22zqrX4HzZ1O2Bztuz5
	Fz9T66OPCjCFUOeMa56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU93g-0000000DPn3-2gfE;
	Thu, 19 Nov 2026 20:48:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU93d-0000000DPjx-2yAE;
	Thu, 19 Nov 2026 20:48:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38A2642A35;
	Thu, 19 Nov 2026 20:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486951F000D2;
	Thu, 19 Nov 2026 20:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121317;
	bh=HzCI/OC/wj0bvnUWN/Wm9v2nEQ4J42ID8/rtjwSGIro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nZm63OKl0ATBt4ksUjXeM7b59QCzmgtjwsvRMyaLIELZpwv7wRC91DyAzy4u9hmnY
	 6ZdcREdyWGgCV7UAYOEyCC4/87guhOUYT30P+X8o7tXufj/g9ELAWs8PvvD9gyfzTH
	 bhn2SvpLk/MFeCcxeW6jJsKWYsDxYoNVFjAZQ9Wa4BRg4tf7qFIxKeJ5Rl3YK/nXgu
	 Jfc9gXo7JWGq3owhPv2MMH8mYtycD29OuNn5y3OJMtQzUDcWo8zThRPe82WqhEZ+bB
	 /6hLiXgzTZ0mSDMdqdR+toz1dEDxV7qLCJmZ+w+qeuGit6JGDdobHKvmnUOBx1/wvA
	 Q+8TY6rOQ0Lzg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ryder.Lee" <ryder.lee@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 6/6] pinctrl: mediatek: Prevent divide-by-zero for pins with fixed drive strength
Date: Thu, 19 Nov 2026 20:47:21 +0000
Message-ID: <20261119204748.2558209-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119204748.2558209-1-lee@kernel.org>
References: <20261119204748.2558209-1-lee@kernel.org>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_drive[] only defines entries for DRV_GRP0 (1) through DRV_GRP4 (5),
leaving mtk_drive[DRV_FIXED] (0) zero-initialised with min = 0, max = 0,
step = 0, and scal = 0.  If mtk_pinconf_drive_set() or
mtk_pinconf_drive_set_rev1() is called with arg = 0 on a pin with
drv_n == DRV_FIXED, the range check (0 >= 0 && 0 <= 0) succeeds and
!(arg % tb->step) divides by zero.  Similarly, mtk_pinconf_drive_get()
and mtk_pinconf_drive_get_rev1() divide by tb->scal (0) if the pin has
drive register fields defined.

Return -ENOTSUPP immediately when desc->drv_n == DRV_FIXED.

Fixes: c28321979ba8 ("pinctrl: mediatek: add driving strength related support to pinctrl-mtk-common-v2.c")
Closes: https://sashiko.dev/#/bug/linux-d3852d37-6806-4c41-a493-f249dd59d0c6
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: No changes

 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 95d0455f7d53..d0c2292a1bbf 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1040,6 +1040,9 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
 	const struct mtk_drive_desc *tb;
 	int err = -ENOTSUPP;
 
+	if (desc->drv_n == DRV_FIXED)
+		return -ENOTSUPP;
+
 	tb = &mtk_drive[desc->drv_n];
 	/* 4mA when (e8, e4) = (0, 0)
 	 * 8mA when (e8, e4) = (0, 1)
@@ -1069,6 +1072,9 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
 	const struct mtk_drive_desc *tb;
 	int err, val1, val2;
 
+	if (desc->drv_n == DRV_FIXED)
+		return -ENOTSUPP;
+
 	tb = &mtk_drive[desc->drv_n];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_E4, &val1);
@@ -1095,6 +1101,9 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
 	const struct mtk_drive_desc *tb;
 	int err = -ENOTSUPP;
 
+	if (desc->drv_n == DRV_FIXED)
+		return -ENOTSUPP;
+
 	tb = &mtk_drive[desc->drv_n];
 
 	if ((arg >= tb->min && arg <= tb->max) && !(arg % tb->step)) {
@@ -1116,6 +1125,9 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 	const struct mtk_drive_desc *tb;
 	int err, val1;
 
+	if (desc->drv_n == DRV_FIXED)
+		return -ENOTSUPP;
+
 	tb = &mtk_drive[desc->drv_n];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, &val1);
-- 
2.56.1.750.gf70dc682cf-goog


