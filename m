Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6046606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VMrhk+9U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMXnGqzU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xu5t0SHtHh3EfhB8wC62U3MG89dpBWz5Qt6/PMriQaI=; b=VMrhk+9U2wP3ll
	lhstOxA43crwxY9tbegRRULNGcY2p9M4POe9qQe25QFMfas4ZY4WCjrcZhNl/Am07ODq1hOXnaQ+E
	WtYS1H18YaxKT1JPNjHHlBXr7L9liLy5ugyTplCXOTVn7eCucKuAyyQD+qgM6g2uPwVSyeUKM9Wp1
	lbFSOxcHyuvMlQy5ZUMUCw1wcxkS+cAgyNdVlEW/bmRKkhTXJDNQ9zFqFjdNjU998lIuOG0Z/ulNu
	4S2mSKU4UGE1WtMAjKgmFaXS2mglf9t1SlN1KRGS4ntgn9EYV+GR4KLeVyAL1AyHfNc3adTMLuH4P
	t0nskEZgWL8vaofBBRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyoQ-0000000H4RW-1mdl;
	Fri, 27 Nov 2026 16:28:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynY-0000000H46H-2rLH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:27:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7126440B46;
	Fri, 27 Nov 2026 16:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3701F00897;
	Fri, 27 Nov 2026 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796864;
	bh=Xu5t0SHtHh3EfhB8wC62U3MG89dpBWz5Qt6/PMriQaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kMXnGqzU8NKoj63U0gr/uAMIBu+w5D8FkgGlNuEKQNm7PuRxIAfNi80Im9kogQE+6
	 fsDwKcGXgRE0TV3rAC92BhmTBxfm0YJLQMy7QISt8MtIT46Ii+gmaxlt07v4ryMWLK
	 vw5d8QyHUrPmI5rTSqsahvaoEUESjtWOT+hRiBTz8bw1fLYda89tp8PIQpltFRJU01
	 e75nVxdb+fqTLIRsEPizCCBzBwyW404nYuuhduQ4Ws0sAE4ZfWUzBYmTvS6JTFE5lQ
	 4w80Xq8pkDAtkZEnWhyixy0Zp7GL8NXHmmuv3C1ap6gAxUBqjx/R3s6xgPhxsB3Aa7
	 fke4AsFjsdzWA==
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
Subject: [PATCH v6 06/14] reset: Extract __reset_control_get_from_provider()
Date: Fri, 27 Nov 2026 17:26:51 +0100
Message-ID: <2b57562bf632995ede625f4c2d6f3e7c7261b97d.1795796064.git.geert+renesas@glider.be>
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

Extract the code to create a reset_control structure from a given
provider into its own function, so it can be reused later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v6:
  - Rebase,

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
index 0bff49d9b5586403..7679480644e7ecda 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1227,6 +1227,49 @@ __reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fallback)
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
@@ -1234,10 +1277,7 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 	bool gpio_fallback = false;
 	struct reset_control *rstc = ERR_PTR(-EINVAL);
-	struct reset_controller_dev *rcdev;
 	struct fwnode_reference_args args;
-	struct of_phandle_args of_args;
-	int rstc_id = -EINVAL;
 	int ret;
 
 	if (!fwnode)
@@ -1279,46 +1319,11 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
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


