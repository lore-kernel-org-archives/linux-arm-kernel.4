Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB11606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0A1h0KHa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qSLyZNr+1G1/Avw/ZFbgMcsyS1IOX662tWnaACF3nbY=; b=0A1h0KHaFRmBWK
	peOeCzHNewQjOyUV6LE3/LS2W6pOxN6RBb3SkKI07Ok1HUwrzUVXaniKQEsdu8SQXjk7t4MGfuoGe
	6rzMpz83i9vIshPwSBji8HIjtCccGK1FqanxC7mY3N5mXc0jpYz93qDDiyA/cHzdL8WhJM89rN5Qi
	AwghlFYgSz4jyFHpzmRukDdQgN+crvwcaOh1aNNIgThJiSrsTIYjH5p5LKb8S1yNWdM/aGUbVNgV6
	ICZYcHmiNq4f9BqwdVTJSuPiJAyDMGOMi/dcAutHXI4H6TQvADUen9yYpbGTElydR2hZcyNn5y7Gx
	00g01j/CB7BzLmgdvgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlbJ-0000000A8Qu-1S6n;
	Wed, 18 Nov 2026 19:45:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlbD-0000000A8Nh-3hI8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:45:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 976A3639B2;
	Wed, 18 Nov 2026 19:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EB71F000C4;
	Wed, 18 Nov 2026 19:45:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Paul Elder <paul.elder+renesas@ideasonboard.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 04/15] clk: renesas: r8a78000: Add clk_hw to clk_map
Date: Wed, 18 Nov 2026 20:44:52 +0100
Message-ID: <ea85d72ca37bc7abc59fda5aed4b8272578922c4.1795029012.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795029012.git.geert+renesas@glider.be>
References: <cover.1795029012.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Prepare for mapping to other than fixed-rate clocks by adding an array
of clk_hw pointers, indexed by the clock map entry index, and populating
it up-front.

Move r8a78000_cpg_priv.fixed_hws into get_hws(), as it is no longer
needed afterwards, and drop NUM_FIXED_CLKS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5:
  - Add Tested-by,
  - Rebase,
  - Use kzalloc_objs() and __free() instead of devm_k{calloc,free}() for
    the temporary array of fixed clocks,
  - Replace devm_kcalloc() by devm_kzalloc_objs(),
  - Replace unified clk_map by keeping the original clk_id_map and
    adding a separate array of clk_hw pointers,
  - Let clk_id_map_find() return an index,
  - Replace fill_clk_map() by get_hws(),

v4:
  - No changes,

v3:
  - New.
---
 drivers/clk/renesas/r8a78000-cpg.c | 71 ++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 236c638834703f95..fd97e1558d423f95 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2026 Glider bv
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/dev_printk.h>
@@ -35,10 +36,9 @@ enum fixed_clk {
 	FIXED_CLK_66M,
 	FIXED_CLK_133M,
 	FIXED_CLK_266M,
-	NUM_FIXED_CLKS
 };
 
-static const unsigned long fixed_clk_rates[NUM_FIXED_CLKS] = {
+static const unsigned long fixed_clk_rates[] = {
 	[FIXED_CLK_66M] = 66666000,
 	[FIXED_CLK_133M] = 133330000,
 	[FIXED_CLK_266M] = 266660000,
@@ -51,31 +51,30 @@ static const unsigned long fixed_clk_rates[NUM_FIXED_CLKS] = {
  *
  * @dev: CPG device
  * @map: Mapping from DT clock IDs to fixed-rate clock IDs
- * @fixed_hws: Fixed rate clocks
+ * @hws: Clocks, indexed by @map entry index
  */
 struct r8a78000_cpg_priv {
 	struct device *dev;
 	const struct clk_id_map *map;
-	struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
+	struct clk_hw **hws;
 };
 
-static const struct clk_id_map_entry *clk_id_map_find(const struct clk_id_map *map,
-						u32 dt_id)
+static int clk_id_map_find(const struct clk_id_map *map, u32 dt_id)
 {
 	for (unsigned int i = 0; i < map->size; i++) {
 		if (map->entries[i].dt_id == dt_id)
-			return &map->entries[i];
+			return i;
 	}
 
-	return NULL;
+	return -1;
 }
 
 static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec, void *data)
 {
 	struct r8a78000_cpg_priv *priv = data;
-	const struct clk_id_map_entry *entry;
 	struct device *dev = priv->dev;
 	struct clk_hw *hw;
+	int idx;
 	u32 id;
 
 	if (spec->args_count != 1)
@@ -83,13 +82,13 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec, void *data)
 
 	id = spec->args[0];
 
-	entry = clk_id_map_find(priv->map, id);
-	if (!entry) {
+	idx = clk_id_map_find(priv->map, id);
+	if (idx < 0) {
 		dev_err(dev, "Unknown clock %u\n", id);
 		return ERR_PTR(-ENOENT);
 	}
 
-	hw = priv->fixed_hws[entry->fw_id];
+	hw = priv->hws[idx];
 
 	dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
 		clk_hw_get_name(hw), clk_hw_get_rate(hw));
@@ -97,27 +96,54 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec, void *data)
 	return hw;
 }
 
-static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
+static struct clk_hw **register_fixed_clks(struct device *dev)
 {
-	struct device *dev = priv->dev;
+	unsigned int n = ARRAY_SIZE(fixed_clk_rates);
 	unsigned long rate;
 	struct clk_hw *hw;
 	const char *name;
 
-	for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
+	struct clk_hw **hws __free(kfree) = kzalloc_objs(*hws, n);
+	if (!hws)
+		return ERR_PTR(-ENOMEM);
+
+	for (unsigned int i = 0; i < n; i++) {
 		rate = fixed_clk_rates[i];
 		name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
 		if (!name)
-			return -ENOMEM;
+			return ERR_PTR(-ENOMEM);
 
 		hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 		if (IS_ERR(hw))
-			return PTR_ERR(hw);
+			return ERR_CAST(hw);
+
+		hws[i] = hw;
+	}
+
+	return_ptr(hws);
+}
 
-		priv->fixed_hws[i] = hw;
+static struct clk_hw **get_hws(struct r8a78000_cpg_priv *priv)
+{
+	const struct clk_id_map *map = priv->map;
+	struct device *dev = priv->dev;
+	struct clk_hw **hws;
+	u16 fw_id;
+
+	struct clk_hw **fixed_hws __free(kfree) = register_fixed_clks(dev);
+	if (IS_ERR(fixed_hws))
+		return ERR_CAST(fixed_hws);
+
+	hws = devm_kzalloc_objs(dev, *hws, map->size);
+	if (!hws)
+		return ERR_PTR(-ENOMEM);
+
+	for (unsigned int i = 0; i < map->size; i++) {
+		fw_id = map->entries[i].fw_id;
+		hws[i] = fixed_hws[fw_id];
 	}
 
-	return 0;
+	return hws;
 }
 
 static int r8a78000_cpg_probe(struct platform_device *pdev)
@@ -125,7 +151,6 @@ static int r8a78000_cpg_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct r8a78000_cpg_priv *priv;
 	const struct clk_id_map *map;
-	int ret;
 
 	map = of_device_get_match_data(dev);
 	if (!map)
@@ -138,9 +163,9 @@ static int r8a78000_cpg_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	priv->map = map;
 
-	ret = register_fixed_clks(priv);
-	if (ret)
-		return ret;
+	priv->hws = get_hws(priv);
+	if (IS_ERR(priv->hws))
+		return PTR_ERR(priv->hws);
 
 	return devm_of_clk_add_hw_provider(dev, r8a78000_clk_get, priv);
 }
-- 
2.43.0


