Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB481606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YgZEMB4i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRiHoQtP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZbLOVBxW+TbmqdrtSMWDiPpH1JDX0i5iTnMkxU4NifE=; b=YgZEMB4iTW5UxV
	O/woQXjCxGY1ff5c7ZD6JaOGpO4emkldTjSDvyzcp8GkrqllNyHPB76WcFY745uMhd0KsNHxvyUWT
	0HZ5j7ylN6+YPGz2jqEUnZp6PeEPIK8lp1Jzqqb42fYSAQclFAYgzUp0ToWJMqJ4RmxyUi6XHjujN
	AY9FPmihVHnX/vZhp0ObB2vlEnLES4QhphbKph7QWpQCD8Nd7oP0OEobv8r1lCcQs1YCFynjY7c/5
	LSK5VL71GmB8Vp6iP0OLqS7KhclIUma41skt+x7zkji6ggcOvf9UoS7+wxcLAeTnPv1rSFTlc596V
	cokKNEdTqdHdo7kh4clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyoQ-0000000H4Rh-2BFm;
	Fri, 27 Nov 2026 16:28:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyne-0000000H49P-3121
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:27:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BEDA62145;
	Fri, 27 Nov 2026 16:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7451F00893;
	Fri, 27 Nov 2026 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796869;
	bh=ZbLOVBxW+TbmqdrtSMWDiPpH1JDX0i5iTnMkxU4NifE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DRiHoQtPRD7qCiFUCtBbeVhrtAQk5EjxAJ5I1xxaBeA51ybKlU4ABRQ4LyEyXyztc
	 oiReKad1nvrfaZKloLRokDalQlpeDeXFtc2g4bMzMVSwWq+oePd3k5Z0/4krVI1/t8
	 75NBSmtUPJM7/Jm1rdfjhZcisW3Y+yOnEiUyCOyd1QZUF/XWpwDcld94yr33K9W3Hs
	 sHafcqA0VyYWxIjN4P3S+isxUA56xbdsOGlNohR1afnq0YJ8IOS86O6JygazaZz8Qp
	 cii+N1WTfKpKbWM0sDZuQjt1cnQZaJty5Y2B995OY4iBop7UlY/kaAvHYiGNqiiL+k
	 3uKBAkgqae6DA==
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
Subject: [PATCH v6 07/14] reset: Add reset_control_get_from_provider_exclusive()
Date: Fri, 27 Nov 2026 17:26:52 +0100
Message-ID: <6ba13f4ab5bf268259b60ae857e98c6be70f598a.1795796064.git.geert+renesas@glider.be>
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
v6:
  - Rebase,

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
index 7679480644e7ecda..649c1dab543805d6 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1233,6 +1233,7 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
 				  bool gpio_fallback,
 				  enum reset_control_flags flags)
 {
+	struct fwnode_handle *fwnode = consumer ?: args->fwnode;
 	struct reset_controller_dev *rcdev;
 	int rstc_id = -EINVAL;
 
@@ -1245,18 +1246,29 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
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
@@ -1348,6 +1360,24 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
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


