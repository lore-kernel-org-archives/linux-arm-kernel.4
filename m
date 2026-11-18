Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BC5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ve8hQDAz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fFhFFydjW3HxQoqI50yENOOeBsptqJid+tkFNjaQeiY=; b=Ve8hQDAzXWVu0q
	a3nay5YiwE2cJARe8AkeGjnoWCBru9R8t7dqjMLp+Eae18OggyePBWXd12ZZoUILeWnGPAiSNlld6
	Farf+hOC3EWPssq4F9FNXjNOqlBBnIMfvo5xmAjajcg3uFzKwk0rm9BODmHZuIJuZ2R9UJqGNvPRb
	93milRb9Ewod/1UWcxfI8/iKkwnWcG6VeVuw9iHafSgTqLRYPRHF4+w7NAIDAC5iHNpCQz+Y09qcT
	BHCk9i8Ql8DvHE57GMhZ1S1utQb+N+hWnXQ3/Dl3s90XsCZssAzaKAGPbyfLnlAv2nLfyjh+4mHgb
	vVswntsqg7qibfP240JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlbW-0000000A8a6-3Hlt;
	Wed, 18 Nov 2026 19:46:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlbP-0000000A8Uk-0EkQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:45:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14A74639B9;
	Wed, 18 Nov 2026 19:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C381F000CD;
	Wed, 18 Nov 2026 19:45:48 +0000 (UTC)
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
Subject: [PATCH v5 06/15] reset: Extract __reset_control_get_from_provider()
Date: Wed, 18 Nov 2026 20:44:54 +0100
Message-ID: <d7124dcb62bbe39f3a2a8fe284bffffaece1ed45.1795029012.git.geert+renesas@glider.be>
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

Extract the code to create a reset_control structure from a given
provider into its own function, so it can be reused later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5:
  - Add Tested-by,

v4:
  - Keep RESET_CONTROL_FLAGS_BIT_OPTIONAL clearing in
    __fwnode_reset_control_get(),
  - Return directly instead of assigning to a local variable, letting us
    drop the latter and simplify scoped_guard() to plain guard(),
  - Add Reviewed-by,

v3:
  - New.
---
 drivers/reset/core.c | 85 +++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09b270..0e11f4c81c10d601 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1135,6 +1135,49 @@ __reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fallback)
 	return NULL;
 }
 
+static struct reset_control *
+__reset_control_get_from_provider(const struct fwnode_reference_args *args,
+				  struct fwnode_handle *consumer, int index,
+				  bool gpio_fallback,
+				  enum reset_control_flags flags)
+{
+	struct reset_controller_dev *rcdev;
+	int rstc_id = -EINVAL;
+
+	guard(mutex)(&reset_list_mutex);
+
+	rcdev = __reset_find_rcdev(args, gpio_fallback);
+	if (!rcdev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (WARN_ON(args->nargs != rcdev->fwnode_reset_n_cells))
+		return ERR_PTR(-EINVAL);
+
+	if (rcdev->of_xlate && is_of_node(consumer)) {
+		struct device_node *np = to_of_node(consumer);
+		struct of_phandle_args of_args;
+		int ret;
+
+		ret = of_parse_phandle_with_args(np,
+					 gpio_fallback ? "reset-gpios" : "resets",
+					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
+					 gpio_fallback ? 0 : index,
+					 &of_args);
+		if (ret)
+			return ERR_PTR(ret);
+
+		rstc_id = rcdev->of_xlate(rcdev, &of_args);
+		of_node_put(of_args.np);
+	} else if (rcdev->fwnode_xlate) {
+		rstc_id = rcdev->fwnode_xlate(rcdev, args);
+	}
+	if (rstc_id < 0)
+		return ERR_PTR(rstc_id);
+
+	guard(mutex)(&rcdev->lock);
+	return __reset_control_get_internal(rcdev, rstc_id, flags);
+}
+
 struct reset_control *
 __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int index,
 			   enum reset_control_flags flags)
@@ -1142,10 +1185,7 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 	bool gpio_fallback = false;
 	struct reset_control *rstc = ERR_PTR(-EINVAL);
-	struct reset_controller_dev *rcdev;
 	struct fwnode_reference_args args;
-	struct of_phandle_args of_args;
-	int rstc_id = -EINVAL;
 	int ret;
 
 	if (!fwnode)
@@ -1185,46 +1225,11 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 		}
 	}
 
-	guard(mutex)(&reset_list_mutex);
-
-	rcdev = __reset_find_rcdev(&args, gpio_fallback);
-	if (!rcdev) {
-		rstc = ERR_PTR(-EPROBE_DEFER);
-		goto out_put;
-	}
-
-	if (WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
-		rstc = ERR_PTR(-EINVAL);
-		goto out_put;
-	}
-
-	if (rcdev->of_xlate && is_of_node(fwnode)) {
-		ret = of_parse_phandle_with_args(to_of_node(fwnode),
-					 gpio_fallback ? "reset-gpios" : "resets",
-					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
-					 gpio_fallback ? 0 : index,
-					 &of_args);
-		if (ret) {
-			rstc = ERR_PTR(ret);
-			goto out_put;
-		}
-
-		rstc_id = rcdev->of_xlate(rcdev, &of_args);
-		of_node_put(of_args.np);
-	} else if (rcdev->fwnode_xlate) {
-		rstc_id = rcdev->fwnode_xlate(rcdev, &args);
-	}
-	if (rstc_id < 0) {
-		rstc = ERR_PTR(rstc_id);
-		goto out_put;
-	}
-
 	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 
-	scoped_guard(mutex, &rcdev->lock)
-		rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
+	rstc = __reset_control_get_from_provider(&args, fwnode, index,
+						 gpio_fallback, flags);
 
-out_put:
 	fwnode_handle_put(args.fwnode);
 
 	return rstc;
-- 
2.43.0


