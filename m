Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BC9606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+xuxXH9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmjucKFi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SVKTmiRcZK5gge1Bcjg+ljhAOeTuRfC/PtzcGvEBSTo=; b=I+xuxXH9OvpVsO
	LEI+ErsTAY9GlRHIfM/BiLTr1i7Z+VIPUSd8Zi0UtsqShvLeZKFJfZmxN6KOVWigOyflaeE4VyGUx
	vyBvZ2p3wyH5Cq0ThK8AhUuw7VRR6Cyk+xK8ByJ1/YFITHIVHUGQ+779/62Isir8zy9+vrQs+NqXh
	HJ/0HdDg55CbJz4q9gVEXme4LcIon8ZLfvzgzyTRWH5UTbJXgpYRRBh9cxtpw1PyTtJQLRZ/ukPZR
	F5ZSi1pKBFWMR8ukY7FjIvigYjbiu3+hsxpY4NuyQlHo+hu+NUDTKpugfheLSD2M0jqvi+UwGT12G
	uVVtYPjOdiYFHJC1MgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWync-0000000H486-44FB;
	Fri, 27 Nov 2026 16:27:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynB-0000000H40f-1qa9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:27:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC30A61D36;
	Fri, 27 Nov 2026 16:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623E01F00A18;
	Fri, 27 Nov 2026 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796840;
	bh=SVKTmiRcZK5gge1Bcjg+ljhAOeTuRfC/PtzcGvEBSTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GmjucKFiyelRcCY/2McSIf4Gl5lKw5dIZv4gnc2ZnF+ciDaUUqPJr2xpRq1uudVuj
	 QlVNUJdeO+BgeMOM4jC3G6jk8bwqPUEz6ooQ7sk9hDUZycbaGjua0W3tq/wYRTcATs
	 y25LdROusX1fan/CgJVqtP9o+lkZBfx4246JJVT2c1k+Zsj/YhU0AwF0xGJd3jPKVh
	 kfM0ZCbqA3EYmVOKiMdBY9B07345bMC5Zik/fJziqTPhKb8DWja+PmliUxJ/5XjC/B
	 fxqh4T0chEeDb09sBqE/7JMzB+ncnJn/ImULIzemhK7WsUQbKewc9UzZxVBEFXwbTp
	 mra95VLFcAQUw==
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v6 02/14] clk: renesas: r8a78000: Replace sentinel by explicit ID map size
Date: Fri, 27 Nov 2026 17:26:47 +0100
Message-ID: <31144bbe72ef37ff50234a8666bec0b091b913e4.1795796064.git.geert+renesas@glider.be>
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

The use of a sentinel in the clock ID mapping array will become
cumbersome when the need arises to find out the actual number of
elements in the array.  Rework the mapping data structure to fix this,
also improving naming.  Add a CLK_ID_MAP() initialization macro for
brevity.

While at it, drop the check for "!map" in clk_id_map_find(), as that
pointer can never be NULL.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6:
  - Add Reviewed-by,

v5:
  - New.
---
 drivers/clk/renesas/r8a78000-cpg.c | 45 +++++++++++++++++-------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 0e11ae139fbffd80..03fcd128d4293cfc 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -16,11 +16,21 @@
 
 #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
 
-struct clk_map {
-	int dt_id;		/* DT binding clock ID or -1 sentinel */
+struct clk_id_map_entry {
+	u32 dt_id;		/* DT binding clock ID */
 	u32 fw_id;		/* FIXED_CLK() ID */
 };
 
+struct clk_id_map {
+	const struct clk_id_map_entry *entries;
+	unsigned int size;
+};
+
+#define CLK_ID_MAP(_entries) &(struct clk_id_map) {	\
+	.entries = _entries,				\
+	.size = ARRAY_SIZE(_entries),			\
+}
+
 enum fixed_clk {
 	FIXED_CLK_66M,
 	FIXED_CLK_133M,
@@ -40,23 +50,21 @@ static const unsigned long fixed_clk_rates[NUM_FIXED_CLKS] = {
  * struct r8a78000_cpg_priv - Clock Pulse Generator Private Data
  *
  * @dev: CPG device
- * @map: Mapping from DT clock IDs to fixed-rate clocks
+ * @map: Mapping from DT clock IDs to fixed-rate clock IDs
  * @fixed_hws: Fixed rate clocks
  */
 struct r8a78000_cpg_priv {
 	struct device *dev;
-	const struct clk_map *map;
+	const struct clk_id_map *map;
 	struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
 };
 
-static const struct clk_map *clk_map_find(const struct clk_map *map, u32 id)
+static const struct clk_id_map_entry *clk_id_map_find(const struct clk_id_map *map,
+						u32 dt_id)
 {
-	if (!map)
-		return NULL;
-
-	for (; map->dt_id >= 0; map++) {
-		if (map->dt_id == id)
-			return map;
+	for (unsigned int i = 0; i < map->size; i++) {
+		if (map->entries[i].dt_id == dt_id)
+			return &map->entries[i];
 	}
 
 	return NULL;
@@ -65,8 +73,8 @@ static const struct clk_map *clk_map_find(const struct clk_map *map, u32 id)
 static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec, void *data)
 {
 	struct r8a78000_cpg_priv *priv = data;
+	const struct clk_id_map_entry *entry;
 	struct device *dev = priv->dev;
-	const struct clk_map *map;
 	struct clk_hw *hw;
 	u32 id;
 
@@ -75,13 +83,13 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec, void *data)
 
 	id = spec->args[0];
 
-	map = clk_map_find(priv->map, id);
-	if (!map) {
+	entry = clk_id_map_find(priv->map, id);
+	if (!entry) {
 		dev_err(dev, "Unknown clock %u\n", id);
 		return ERR_PTR(-ENOENT);
 	}
 
-	hw = priv->fixed_hws[map->fw_id];
+	hw = priv->fixed_hws[entry->fw_id];
 
 	dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
 		clk_hw_get_name(hw), clk_hw_get_rate(hw));
@@ -116,7 +124,7 @@ static int r8a78000_cpg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct r8a78000_cpg_priv *priv;
-	const struct clk_map *map;
+	const struct clk_id_map *map;
 	int ret;
 
 	map = of_device_get_match_data(dev);
@@ -137,17 +145,16 @@ static int r8a78000_cpg_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, r8a78000_clk_get, priv);
 }
 
-static const struct clk_map r8a78000_cpg_default[] = {
+static const struct clk_id_map_entry r8a78000_cpg_default[] = {
 	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
 	{ R8A78000_CPG_SGASYNCD8_PERW_BUS,	FIXED_CLK(133M) },
 	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
-	{ -1 }
 };
 
 static const struct of_device_id r8a78000_cpg_match[] = {
 	{
 		.compatible = "renesas,r8a78000-cpg",
-		.data = &r8a78000_cpg_default,
+		.data = CLK_ID_MAP(r8a78000_cpg_default),
 	},
 	{ /* sentinel */ }
 };
-- 
2.43.0


