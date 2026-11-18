Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7BA606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llx1TJyc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EY5wBho5P3LTF0gG95DgxeDZYkbO/z9bWY00WHdZsdo=; b=llx1TJyc/b0XzQ
	eJV6d2WsFOJrNkWAZ6OFcmmGbMTf2CObP5PwZb7U00EWLe86tzjImqwLijG4gPBu8X5qBVqKnhK35
	WezUcFdGYJGu118SrY30xAl9SMe7VWcCrLwXOXA1I0PM+XkoU9mj6KgTi15XMr+nXydHQD4tvpYEu
	WOr006poayV6wZFFJodt/7Ew/U5IXppWPCifG4V7RxMzOywx7M0L/QEwqgTIj8eU4WSbN34j0GPMe
	ub6A2BJtEqdberWtq6fmHGgwmJnomXJEUKf+PadCyGUmgswdXQKkOtk2l5ajQ2lzr2El/bkHem2U9
	QJ9oQ0sju91BaxXQOxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlbW-0000000A8ag-3t9L;
	Wed, 18 Nov 2026 19:46:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlbT-0000000A8Xb-3Q0E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:45:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B4B543B46;
	Wed, 18 Nov 2026 19:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CCA1F000D1;
	Wed, 18 Nov 2026 19:45:54 +0000 (UTC)
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
Subject: [PATCH v5 07/15] reset: Add reset_control_get_from_provider_exclusive()
Date: Wed, 18 Nov 2026 20:44:55 +0100
Message-ID: <12813e863df2e0c4194e046f5408c8abba1bcf88.1795029012.git.geert+renesas@glider.be>
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

When stacking two reset controllers, the upper one should go through the
proper channels: request exclusive reset controls and use them via the
reset_control_*() APIs.  However, unlike the clock subsystem, which has
of_clk_get_from_provider(), the reset subsystem does not offer a way to
lookup and obtain a reset from a reset provider.

Hence add a public helper reset_control_get_from_provider_exclusive()
to lookup and obtain an exclusive reference to a reset controller, based
on the recently introduced __reset_control_get_from_provider() helper.
This will be used by the R-Car X5H Module Controller driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v5:
  - Add Tested-by, Reviewed-by,
  - Move of_node_get() after for-loop that may fail to fix device node
    reference leak on failure,

v4:
  - Check for overflow when converting (u64) fwnode args to (uint32_t)
    OF args,
  - Document that reset_control_get_from_provider_exclusive() must not
    be given a reference to a GPIO provider,

  - Let the dummy return ERR_PTR(-ENOTSUPP) instead of NULL,

v3:
  - Replace reset_controller_get_provider() by
    reset_control_get_from_provider_exclusive(),
  - Add kerneldoc,

v2:
  - No changes.
---
 drivers/reset/core.c  | 40 +++++++++++++++++++++++++++++++++++-----
 include/linux/reset.h |  8 ++++++++
 2 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 0e11f4c81c10d601..7278335d3a244ec2 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1141,6 +1141,7 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
 				  bool gpio_fallback,
 				  enum reset_control_flags flags)
 {
+	struct fwnode_handle *fwnode = consumer ?: args->fwnode;
 	struct reset_controller_dev *rcdev;
 	int rstc_id = -EINVAL;
 
@@ -1153,18 +1154,29 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
 	if (WARN_ON(args->nargs != rcdev->fwnode_reset_n_cells))
 		return ERR_PTR(-EINVAL);
 
-	if (rcdev->of_xlate && is_of_node(consumer)) {
-		struct device_node *np = to_of_node(consumer);
+	if (rcdev->of_xlate && is_of_node(fwnode)) {
+		struct device_node *np = to_of_node(fwnode);
 		struct of_phandle_args of_args;
 		int ret;
 
-		ret = of_parse_phandle_with_args(np,
+		if (consumer) {
+			ret = of_parse_phandle_with_args(np,
 					 gpio_fallback ? "reset-gpios" : "resets",
 					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
 					 gpio_fallback ? 0 : index,
 					 &of_args);
-		if (ret)
-			return ERR_PTR(ret);
+			if (ret)
+				return ERR_PTR(ret);
+		} else {
+			for (unsigned int i = 0; i < args->nargs; i++) {
+				if (args->args[i] > U32_MAX)
+					return ERR_PTR(-EINVAL);
+
+				of_args.args[i] = args->args[i];
+			}
+			of_args.np = of_node_get(np);
+			of_args.args_count = args->nargs;
+		}
 
 		rstc_id = rcdev->of_xlate(rcdev, &of_args);
 		of_node_put(of_args.np);
@@ -1254,6 +1266,24 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
 }
 EXPORT_SYMBOL_GPL(__reset_control_get);
 
+/**
+ * reset_control_get_from_provider_exclusive - Lookup and obtain an exclusive
+ *					       reference to a reset controller.
+ * @args: Reference to the reset controller provider with all the args like
+ *	  reset number.  This must not be a reference to a GPIO provider.
+ *
+ * Returns a struct reset_control or IS_ERR() condition containing errno.
+ * If this function is called more than once for the same reset control it will
+ * return -EBUSY.
+ */
+struct reset_control *
+reset_control_get_from_provider_exclusive(const struct fwnode_reference_args *args)
+{
+	return __reset_control_get_from_provider(args, NULL, 0, false,
+						 RESET_CONTROL_EXCLUSIVE);
+}
+EXPORT_SYMBOL_GPL(reset_control_get_from_provider_exclusive);
+
 int __reset_control_bulk_get(struct device *dev, int num_rstcs,
 			     struct reset_control_bulk_data *rstcs,
 			     enum reset_control_flags flags)
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 9c391cf0c82298a0..384273ec0c7cbef7 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -90,6 +90,8 @@ struct reset_control *__fwnode_reset_control_get(struct fwnode_handle *fwnode,
 				     const char *id, int index, enum reset_control_flags flags);
 struct reset_control *__reset_control_get(struct device *dev, const char *id,
 					  int index, enum reset_control_flags flags);
+struct reset_control *reset_control_get_from_provider_exclusive(
+				const struct fwnode_reference_args *args);
 void reset_control_put(struct reset_control *rstc);
 int __reset_control_bulk_get(struct device *dev, int num_rstcs,
 			     struct reset_control_bulk_data *rstcs,
@@ -173,6 +175,12 @@ static inline struct reset_control *__reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
+static inline struct reset_control *reset_control_get_from_provider_exclusive(
+				const struct fwnode_reference_args *args)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 static inline int
 reset_control_bulk_reset(int num_rstcs, struct reset_control_bulk_data *rstcs)
 {
-- 
2.43.0


