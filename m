Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BF606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VbEf6gnt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jhl79klk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t6ghU7+w8ZZQBhZV5NOW+3+ho8RPpUPWDhr1iciv+sI=; b=VbEf6gntisvv13
	q6ClNtdTYBgTQa73MCrHkEnJdLzlpVlvHVLqbzJcT3PmP8vKuc1+NG8lb9i0KfDN0q8iXEUacVcAT
	QMMIBHPmitpYnQ0p5M/LlsiURpmtuGmAA62ZZJ1jWpLrAnUkhid0DODIcSIqpEtEc4qVuIpS3LVY+
	jbA26acX1iHGJu7VMmubL8J9O3iCTqhKxhMdsgNQvExsLQPr/4S0+f509On3eY1+3bKIKyT9LNs+y
	u5y6rU5XlCyq1G1ftPkezfJCPYfx6d26QvGv1GCLFxZTdZkypZPf9yaem4ZXG4eQWI7WgVfcerybc
	PfuvHLafBHlEotvY5cOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynd-0000000H48V-17vf;
	Fri, 27 Nov 2026 16:27:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynN-0000000H433-1JAj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:27:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC95F62106;
	Fri, 27 Nov 2026 16:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DF71F00935;
	Fri, 27 Nov 2026 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796852;
	bh=t6ghU7+w8ZZQBhZV5NOW+3+ho8RPpUPWDhr1iciv+sI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jhl79klkv5ibslUF6dLshF9grA3jSxN1vozBX3PWAD4C4OBSoV1o7O3vD/wZoolZQ
	 zzXI3WdoBTa81eWijGwHD1HNfBCnbignDNrJBrDXjPrnbU3aG64dc6PdtBJVKdrgbs
	 TBKyH60AcGCjAqmHjqzhgOh3OrPQJyj9yzCfBBw/Mitxw3bYdsQWCpVAex4ASuhfch
	 Yl0EP94y4H0m3AuAgvWiz63xbzm968wiBRrpmC5QVU9Dgvqy55HTWbvZNhyPF0KUgo
	 Pl6k3lQGQxFRZkYQhP4T5liXbXMsK+zubdlQul8Y+dfEdk7PMGnbqFz1BtQT79qhQA
	 4ChDiCLdVl8sQ==
From: Geert Uytterhoeven <geert@kernel.org>
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
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v6 04/14] clk: renesas: r8a78000: Add clk_hw to clk_map
Date: Fri, 27 Nov 2026 17:26:49 +0100
Message-ID: <a976c06a183aec516e57b4413af26a8afdafaeb2.1795796064.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795796064.git.geert+renesas@glider.be>
References: <cover.1795796064.git.geert+renesas@glider.be>
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

Prepare for mapping to other than fixed-rate clocks by adding an array
of clk_hw pointers, indexed by the clock map entry index, and populating
it up-front.

Move r8a78000_cpg_priv.fixed_hws into get_hws(), as it is no longer
needed afterwards, and drop NUM_FIXED_CLKS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
v6:
  - Add Reviewed-by,
  - Move local variables to loop scope where possible,

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
 drivers/clk/renesas/r8a78000-cpg.c | 79 ++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 236c638834703f95..b68fd7cd89c994df 100644
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
-	unsigned long rate;
-	struct clk_hw *hw;
-	const char *name;
+	unsigned int n = ARRAY_SIZE(fixed_clk_rates);
+	struct clk_hw **hws __free(kfree) = kzalloc_objs(*hws, n);
+
+	if (!hws)
+		return ERR_PTR(-ENOMEM);
+
+	for (unsigned int i = 0; i < n; i++) {
+		unsigned long rate = fixed_clk_rates[i];
+		struct clk_hw *hw;
+		const char *name;
 
-	for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
-		rate = fixed_clk_rates[i];
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
+
+static struct clk_hw **get_hws(struct r8a78000_cpg_priv *priv)
+{
+	const struct clk_id_map *map = priv->map;
+	struct device *dev = priv->dev;
+	struct clk_hw **hws;
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
+		u16 fw_id = map->entries[i].fw_id;
 
-		priv->fixed_hws[i] = hw;
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


