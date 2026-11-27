Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhiH2ebS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIEkHrcf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EHMJCGny0SlEPLRB/7EtciCvXajGZ6KI86ky29nscL4=; b=KhiH2ebS8IW02I
	iiRonKxtMNkODRWp7dwvLZtzzpjaXv2YU3JkVGovY3cP2or+vvj8ZQVWf3OFmzgnoL7STBQjGKEoj
	CFXNYPQVqtLVDxa+iYagPpmkktJv+HDq1kIm/PuYZfrskw6NrTxMq+/G4TsoAiwF6KCiRSE4Oo2k4
	Sw4grOlRkv/VDUFjQOPfvNaH9rlC0gbt59kt7chYFKHyKlXX/QpI2+Oz+qXeV1hIyAzjcZlS5QCMJ
	Frm1m17OOGlw8zaogU7BTjwJ3z2CTt4x+LC7xe1HO3jt8Yt48Nj/6XbCmZryyUsJTef95eXIYHiOj
	aL37W0mIeP/5kgmzV6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyoV-0000000H4WL-20ef;
	Fri, 27 Nov 2026 16:28:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyo2-0000000H4HB-0Dg1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:28:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF296226C;
	Fri, 27 Nov 2026 16:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB291F00A1E;
	Fri, 27 Nov 2026 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796893;
	bh=EHMJCGny0SlEPLRB/7EtciCvXajGZ6KI86ky29nscL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MIEkHrcfKu24jV8uUf0eYZ3KgMfQEdN/tQ+Fo5d4RGgvEzc7PzJlbHHnrWlM4borN
	 4r+i5XgslamR9IfJ5/EzNilVDYxdCOTt/iGonDSYUO88re3ikpcFyS+zS84MDIxJUz
	 TGCJxXcuIO668XoNB/2OvaEokU3GjSBNaHhT2FGSrE6Cv1EaMxIEkHRUS8mYonYZ6K
	 iwUp1rEem/nAyQ2HhEoJjyRk8jf6QjMH4BbERLp3hFcLaGBQgzdHPefMDLYtZeifPD
	 kzxiTDnywtd5/Z+A3xaQUNEEbLV88IDW4x7kuobhCKQse1InqPiYj99HeHh1Ug+xQ0
	 TFtfepcKfJYew==
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
Subject: [PATCH v6 11/14] pmdomain: renesas: r8a78000: Replace sentinel by explicit ID map size
Date: Fri, 27 Nov 2026 17:26:56 +0100
Message-ID: <9b8db98f9d203fd1659c86a1be4f74f83fccf2b5.1795796064.git.geert+renesas@glider.be>
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

The use of a sentinel in the module ID mapping array will become
cumbersome when the need arises to find out the actual number of
elements in the array.  Rework the mapping data structure to fix this,
also improving naming.  Let mod_id_map_find() return an index, to be
used for indexing additional mapping target arrays later.
Add a MOD_ID_MAP() initialization macro for brevity.

While at it, drop the check for "!map" in mod_id_map_find(), as that
pointer can never be NULL.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6:
  - Add Reviewed-by,

v5:
  - New.
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 49 +++++++++++++-----------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index 1ace1fb10870f646..6477abe64511e880 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -16,13 +16,23 @@
 
 #include <dt-bindings/power/renesas,r8a78000-mdlc.h>
 
-struct mod_map {
-	int hw_id;		/* Hardware module ID or -1 sentinel */
+struct mod_id_map_entry {
+	u32 hw_id;		/* Hardware module ID */
 };
 
+struct mod_id_map {
+	const struct mod_id_map_entry *entries;
+	unsigned int size;
+};
+
+#define MOD_ID_MAP(_entries) .mod_map = &(struct mod_id_map) {		\
+	.entries = _entries,						\
+	.size = ARRAY_SIZE(_entries),					\
+}
+
 struct mdlc_info {
 	u32 base;
-	const struct mod_map *mod_map;
+	const struct mod_id_map *mod_map;
 };
 
 /**
@@ -41,7 +51,7 @@ struct r8a78000_mdlc_priv {
 	struct reset_controller_dev rcdev;
 	struct device *dev;
 	struct device_node *np;
-	const struct mod_map *mod_map;
+	const struct mod_id_map *mod_map;
 };
 
 static struct generic_pm_domain *r8a78000_genpd_always_on;
@@ -77,17 +87,14 @@ static struct generic_pm_domain *r8a78000_genpd_xlate(
 #define rcdev_to_priv(_rcdev)	\
 	container_of(_rcdev, struct r8a78000_mdlc_priv, rcdev)
 
-static const struct mod_map *mod_map_find(const struct mod_map *map, u32 id)
+static int mod_id_map_find(const struct mod_id_map *map, u32 hw_id)
 {
-	if (!map)
-		return NULL;
-
-	for (; map->hw_id >= 0; map++) {
-		if (map->hw_id == id)
-			return map;
+	for (unsigned int i = 0; i < map->size; i++) {
+		if (map->entries[i].hw_id == hw_id)
+			return i;
 	}
 
-	return NULL;
+	return -1;
 }
 
 static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
@@ -95,7 +102,7 @@ static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
 {
 	struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);
 	struct device *dev = priv->dev;
-	const struct mod_map *map;
+	int idx;
 	u32 id;
 
 	if (spec->args_count != 1)
@@ -103,8 +110,8 @@ static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
 
 	id = spec->args[0];
 
-	map = mod_map_find(priv->mod_map, id);
-	if (!map) {
+	idx = mod_id_map_find(priv->mod_map, id);
+	if (idx < 0) {
 		dev_err(dev, "Unknown reset 0x%x\n", id);
 		return -ENOENT;
 	}
@@ -141,9 +148,8 @@ static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
 	struct device_node *np = dev->of_node;
 	struct r8a78000_mdlc_priv *priv;
 	struct of_phandle_args pd_spec;
-	const struct mod_map *map;
 	unsigned int id;
-	int ret;
+	int ret, idx;
 
 	ret = of_parse_phandle_with_args(np, "power-domains",
 					 "#power-domain-cells", 0, &pd_spec);
@@ -166,8 +172,8 @@ static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
 	id = pd_spec.args[1];
 	of_node_put(pd_spec.np);
 
-	map = mod_map_find(priv->mod_map, id);
-	if (!map) {
+	idx = mod_id_map_find(priv->mod_map, id);
+	if (idx < 0) {
 		dev_err(dev, "Unknown module 0x%x\n", id);
 		return -ENOENT;
 	}
@@ -292,15 +298,14 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct mod_map r8a78000_mdlc_perw_mod_default[] = {
+static const struct mod_id_map_entry r8a78000_mdlc_perw_mod_default[] = {
 	{ 0x54 },	/* HSCIF0 */
-	{ -1 }
 };
 
 static const struct mdlc_info r8a78000_mdlc_default[] = {
 	{
 		.base = 0xc05d0000,
-		.mod_map = r8a78000_mdlc_perw_mod_default,
+		MOD_ID_MAP(r8a78000_mdlc_perw_mod_default),
 	},
 	{ /* sentinel */ }
 };
-- 
2.43.0


