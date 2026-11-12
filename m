Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ceJWflf2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXtlBwGX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BUIoOdvM/LleNE9vPU9m5wgslnjsbtxMHIyToWC6kpw=; b=ceJWflf2Z74Rkw89JxRn1rQOxy
	450OtxGCnNZkfiqaioffvfJx+mXbDd6h7+v0roayRZJhxrhdadyUV5ZvqFbQIX5EnQhIF4AHqCX9B
	ZlA8W2Py7if3DT3LmoRtjTCVbQeZ3e/kfoDnT2xD01Rzgu+Z7XSyUPV6W+7U7Z6mBNib+6XNXzbkE
	CKj5MmuTvORuMbzIFJrFYQ1NCEOhpJlXUvyXb30n7IMWoT6htc6rdl+wJDGredMIdLVFoCfyzecBj
	pWOga3SquWMLUTHAlMu8L1VrfuvP+soHcA8DvcBPpU/LDUN7v0TkTZP9YZoFKLm1UBhVRvOl/c44f
	SNc6PT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ63-000000095PF-25yl;
	Thu, 12 Nov 2026 08:23:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ5k-000000095HN-0UZL;
	Thu, 12 Nov 2026 08:23:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C78BB413B6;
	Thu, 12 Nov 2026 08:23:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471811;
	b=wcMMBd1Hb2Ilk71pww10XRgNP3WD1G/YNlzMfYbNkdrUlkP13BpHvjQsI5DqM51z+0XV
	 X9eE8vvhcByIYDmJUxz285uzUJoq9yXo8AIQieKSIjj1U/Dc8TxaFa8SgL2+LL8FA9sDu
	 9O2QFLUUyXQixaaEEzG+biRMuZ0CLFbG+gtmGj4XuP342Dp8rK7+IxDXIFniHP9t03rMb
	 3wnpsygwWkdg5MtFfG0p2c+HJgmgLv2ImLW5/oIMJfly7I/O3iq5qQ50AjQdNLGygesL/
	 DEYi20WCpPpl00+NenZVcJck4aCV2qMrxSQIq+P+Q+7eCEZvNcI+LPZfh/lU58YbCVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471811;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BUIoOdvM/LleNE9vPU9m5wgslnjsbtxMHIyToWC6kpw=;
	b=q9TMJc96QipZfMQ4mRqoBlVs1iupL2g4WhmVmkTwAs/5NTxF0Y0NRNiy+Qp0vRrPqwMf
	 /lqcw6kIwKQUWfqOeOB1nDKOvtvJp3w7JgD1OH06y4b5omKMXpIPouj4Q/XUXtPQxnpCT
	 0baHKSOu18HxE3Ss1xywmIuXig7OsiNbQKAUOsLx2qnSGsjCEDLTek2hlTCrvISeqEo4z
	 nPp44vMXnFQZICCTsHsaVOtgbztgZc4pEDvlh5+eijPTsTUsWhThKnUAzXvSFag7Y/5ex
	 Bf3Y2XHTKOvP6UCb2bQ8HPqPKteiz46h8K/UH8SuM3o2tHsGZwT3Hk8trzXUXgtVMiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41FDD1F00A07;
	Thu, 12 Nov 2026 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471811;
	bh=BUIoOdvM/LleNE9vPU9m5wgslnjsbtxMHIyToWC6kpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dXtlBwGX4QADCtFzVbZ8yyIqPyzhEXRUX7iHsRKOzKOKZjA8q8GKblSkCbdgXO4a8
	 VrgkFCCjp2j0trxNjoYBTX3ybW2yqldayBLDoTboAiR1fdD38E0Blia4gVVSqYIo2s
	 9UwcKThVYrK428dwTZaV1OdqqEtP5ZwjIxtD0AnIzB4VKZHBV5guO1QU+xc7ef42tK
	 U0b7xA4yZrFmw2EPxkoTxb++rcXfk+MJojYFgHUed2ThHPSmJJ8Xo/jjx5cEBfxDD9
	 rQZ7cjyEZUQw80Afo16Zl3WGGBBWlS/QqniEtypVGbb+K/kSVGaO3zo+f2Sd8VJ9dt
	 pESMySoVPn3VQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AA7E249355;
	Thu, 12 Nov 2026 08:23:29 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:23:29 +0000
Subject: [PATCH v2 1/2] pmdomain: rockchip: remove subdomain links before
 the domains on error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-pmdomain-rockchip-v2-1-5cd942a23df7@gmail.com>
References: <20261112-pmdomain-rockchip-v2-0-5cd942a23df7@gmail.com>
In-Reply-To: <20261112-pmdomain-rockchip-v2-0-5cd942a23df7@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yao Zi <me@ziyao.cc>, Igor Pecovnik <igor@armbian.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471809; l=4093;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=HmcyW0DxnBVZSZC6Y5OzDTxCaMmgNoXvaW5puYHZHjI=;
 b=0b42T8GqnJyvy8hetveu/oq6O8tsqKdECKifJLTziXUw4t270sGclByhcSTABlQkPpD9faKz2
 Gx0FUsBgqlmAeBHvtYsN5WD0Ui2jogtMiHD8S1H/WBA4Tq3i1Et/K39
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

When rockchip_pm_domain_probe() fails after some domains were
registered, for example because a clock of a nested domain is not
available yet and returns -EPROBE_DEFER, rockchip_pm_domain_cleanup()
calls pm_genpd_remove() for every registered domain in domain id order.

pm_genpd_remove() refuses a domain that is still the parent of another
domain and returns -EBUSY. The cleanup walks parents before their
children in id order, and on RK3588 RKVDEC0/RKVDEC1 (ids 14 and 15) are
also children of VDPU (id 21), so no ordering of the domain array lets
every removal succeed. Each refused parent only gets the "state may be
inconsistent" message, and on return devm frees its struct
rockchip_pm_domain, the embedded generic_pm_domain included, while it
is still linked on the global gpd_list. The next registration, the
unused domain power off at late_initcall and the genpd debugfs files
then walk freed memory.

Remove the parent/child links first, walking the power domain nodes
depth first in the same way rockchip_pm_add_subdomain() added them, so
that each child no longer has subdomains of its own when its link is
removed. With no links left, and no provider or devices attached in the
probe error path, pm_genpd_remove() succeeds for every domain before
devm frees it. pm_genpd_remove_subdomain() also drops the parent's
subdomain count, which removing the child with pm_genpd_remove() alone
does not.

Fixes: 79d12b7a7f22 ("soc: rockchip: power-domain: use pm_genpd_remove in error cleanup")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 86b5074b0469..00c7e78f89b5 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -955,12 +955,58 @@ static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
 	/* devm will free our memory */
 }
 
+static struct generic_pm_domain *
+rockchip_pm_node_to_genpd(struct rockchip_pmu *pmu, struct device_node *node)
+{
+	u32 id;
+
+	if (of_property_read_u32(node, "reg", &id) ||
+	    id >= pmu->genpd_data.num_domains)
+		return NULL;
+
+	return pmu->genpd_data.domains[id];
+}
+
+/*
+ * Undo the pm_genpd_add_subdomain() calls of rockchip_pm_add_subdomain().
+ * Links are only ever added between a DT node and its children, so walking
+ * the tree depth first and removing the links of the children before the
+ * link to their parent always finds the subdomain without subdomains of its
+ * own, as pm_genpd_remove_subdomain() requires. This also covers domains with
+ * more than one parent (RKVDEC0/RKVDEC1 on RK3588), which a walk in domain id
+ * or registration order does not.
+ */
+static void rockchip_pm_remove_subdomains(struct rockchip_pmu *pmu,
+					  struct device_node *parent)
+{
+	struct generic_pm_domain *parent_domain, *child_domain;
+
+	parent_domain = rockchip_pm_node_to_genpd(pmu, parent);
+
+	for_each_child_of_node_scoped(parent, np) {
+		rockchip_pm_remove_subdomains(pmu, np);
+
+		child_domain = rockchip_pm_node_to_genpd(pmu, np);
+		if (parent_domain && child_domain)
+			pm_genpd_remove_subdomain(parent_domain, child_domain);
+	}
+}
+
 static void rockchip_pm_domain_cleanup(struct rockchip_pmu *pmu)
 {
 	struct generic_pm_domain *genpd;
 	struct rockchip_pm_domain *pd;
 	int i;
 
+	/*
+	 * pm_genpd_remove() refuses a domain that still has subdomains, and
+	 * devm frees the domains on return whether or not they were removed,
+	 * which would leave freed memory on the global genpd list. Remove all
+	 * parent/child links first, so every domain can be removed.
+	 */
+	for_each_available_child_of_node_scoped(pmu->dev->of_node, np)
+		rockchip_pm_remove_subdomains(pmu, np);
+
 	for (i = 0; i < pmu->genpd_data.num_domains; i++) {
 		genpd = pmu->genpd_data.domains[i];
 		if (genpd) {

-- 
2.55.0



