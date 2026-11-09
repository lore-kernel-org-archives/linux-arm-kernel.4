Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96B606EE96
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8rI3PCZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDiI/qzD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wsjaeM57Ntxk78dpU682yS1x8SI1hDiUKBvNjgTutVo=; b=G8rI3PCZT5wbsH
	K8SS+LmEVtjuUxIobJlngyRImVk9RCoLFlxCl6bh5MzEqjk6rAf+WreUj3gboPrlqTKuPR/jJTP4L
	U2zTbAdppiyVn1q5lVpXXQbJ43Uz5drKLTzDyXWr/0AaRiUTJgHwuAM2cIeb9sQWjdg3bMW2D9+QX
	ZV3Vssh1lExABxXXvlS55ZmwJ1bh6RBtRhRRHETFw2JsjLgdZrrLdkdIgj+5tHO+ePsM2NVhneLvq
	RflKRmZlzT17+ZQWkOgELNkEb1qfdIJoANjr6w11Eav/ycF9FnPdLJok/MvTd1hZyGOlabZXsfMif
	ZjEzmq7i1HWBWUv4ztZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRgm-000000015S0-48GF;
	Mon, 09 Nov 2026 15:53:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRgj-000000015RB-2FRm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:53:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E32CD45A53;
	Mon,  9 Nov 2026 15:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BDE1F008A1;
	Mon,  9 Nov 2026 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239620;
	bh=wsjaeM57Ntxk78dpU682yS1x8SI1hDiUKBvNjgTutVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NDiI/qzDlLVjCdvIMoVKxF82J12AbX/CSv0TzrRyu2Mu/SLpzXq4/ErnpV4iMk4Km
	 rOmO6+kKqbEuo2mkj59A79jp/rd5bfonVcJZhPlUkTwUZSY31myeBoqNWYttuU5iXQ
	 7ojma7AjIZpGbQqh6I9M3h4YEatXmQOGWSpYY1plWsoLTf1vgBoW+Ql1Q1X2nnOZjH
	 X5O8Yv+VnaGjCSvMq2QDcy7Fj6E8NwYgpY72VQcYwusOwKBxog7fM1Je0YNKXBWaQV
	 CUZBoZVWfHpiLoEPQiaGL76wxJxuL+XmC3xIOThnuI59c+rlPy6FVx+FaGqbNNQpG6
	 ITW2mGc27L9ow==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH RESEND 2/2] pmdomain: arm_scmi: Propagate domain hierarchy setup failures
Date: Mon,  9 Nov 2026 15:53:32 +0000
Message-ID: <20261109155332.1686594-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109155332.1686594-1-sudeep.holla@kernel.org>
References: <20261109155332.1686594-1-sudeep.holla@kernel.org>
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

of_genpd_add_child_ids() uses all-or-nothing semantics and reports an
error if any relationship cannot be established. The SCMI driver
currently only logs that error and completes probe, leaving domains
registered without their DT-described parent relationships.

Treat hierarchy setup failures as probe failures. Translate -ENOENT to
-EPROBE_DEFER so external parent providers can register first, remove the
onecell provider before unwinding domains, and publish driver data only
after hierarchy setup succeeds.

Fixes: fba9c703c184 ("pmdomain: arm_scmi: add support for domain hierarchies")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index b95b24470ba5..95857bebc444 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -117,19 +117,24 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 	if (ret)
 		goto err_rm_genpds;
 
-	dev_set_drvdata(dev, scmi_pd_data);
-
 	/*
 	 * Parse (optional) power-domains-child-ids property to establish
 	 * parent-child relationships.
 	*/
 	ret = of_genpd_add_child_ids(np, scmi_pd_data);
-	if (ret < 0)
-		dev_err(dev, "Failed to add child domain hierarchy: %d\n", ret);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret == -ENOENT ? -EPROBE_DEFER : ret,
+				    "failed to add child domain hierarchy\n");
+		goto err_del_provider;
+	}
+
+	dev_set_drvdata(dev, scmi_pd_data);
 
 	dev_info(dev, "Initialized %d power domains", num_domains);
 
 	return 0;
+err_del_provider:
+	of_genpd_del_provider(np);
 err_rm_genpds:
 	for (i = num_domains - 1; i >= 0; i--) {
 		if (!domains[i])
-- 
2.43.0


