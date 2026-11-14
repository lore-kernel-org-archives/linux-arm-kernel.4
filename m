Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305AC606A887
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wx5Hc19+;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=QsF5FTEC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=f9VfikaR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zoi47BNj4CDTzs76LgHwDYHjReOPRozmuDUGgniQ9g0=; b=Wx5Hc19+qOpUGG
	U+Z86Af6xRlHzKewXSys9RK/Q/lwiPfzNln2Ulmibx/cKdinZ4FumX/GEOHtm+wygsFEGL+/AmMoZ
	ZssyHxlOH3cbM8manBf5kLhdbKp5Cr1RcQQpuVWzW8EkxCFWSwCwQZ5FYrVpAVkEck3OYupt1Dh7Q
	IQ3YWXrQCrPk1SfWepIBZqyTuOpXxMuBUCZw3up1p5Hoiz4FhKpKE2mytqnlub7VPcE7KP9yG8LJQ
	mlsvxSxFvQcLXGLRr8baznrZ7OOQ2/FeRQkUbkzycfdXEFuGCOFOsEUuMpO4vtpQcNzh3LK5nc6sp
	n2d6Sq1E+d2a8yBPz7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS44u-0000000F9Je-2Gzf;
	Sat, 14 Nov 2026 03:05:23 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS44q-0000000F9I3-3etB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:05:18 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id 1CCD01381A23
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 22:05:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 13 Nov 2026 22:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625516; x=
	1794632716; bh=zoi47BNj4CDTzs76LgHwDYHjReOPRozmuDUGgniQ9g0=; b=Q
	sF5FTECQ1x01VBxh50BocWFbP8ZOG2Sm2n7lVLLniIiikYbs6K9y15SGbI7gY6cg
	cHPcJ0arD1njS3YHXC+6J9CpnjFejGgaaKXVJ5EhKBcEeA+mPA/ynaKeyWRXnSXQ
	ZF7fePIOvoq2WSS+zilJMUBBQTKLbFqKRwpTniBHvL8IN9SHGYPAgLSnVLDEPrEI
	nK5ASJQbZY+DnA/TemTnUy1Aob9zOVooy7k+LFW1IgdK0rOFvmj+gkPWWpIT9jrn
	vE6IjyBUSUjBnqCX62DG8R1mCAtvEXsr5cCmNqUEcO11qjmyCBbZHyUv3Q5h8pJ3
	xKb4qc1SKw3nS4WwoiQEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625516; x=1794632716; bh=z
	oi47BNj4CDTzs76LgHwDYHjReOPRozmuDUGgniQ9g0=; b=f9VfikaRznZFmGi+w
	IJpG2x3f7pakBIv36BnWyPIspvkGyV+lP7U964pDEkesfpM9lNEre1hAYEB8QuL6
	VLw2BWJQzVcqYonxtOYYl04duXQqSDzPehLLU5hgBdtOxp7GojpY8lFXC25/RhV6
	eCw6cMq+4pe9c7ro2P49VLpggOErSWsFAKxc8SKs5+oRIIwlDwcRUbtZFUh4oKH3
	Ve4b5zprMg+O7/s7KJGTvkRHDInc9+z5sqfSfum3y+x2GtCbEBIi048F7qccOJRO
	VrSawKujb1HQABodFPvkTokabkUNkkiDkdvWrRRymtr2ieJtxVcBdnEwD0ifs/af
	padXw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625516; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:pYKenJ5+CIr+A2pQbi2IwyggCOfX5OFIAmHHQISTksIBAic
	RC/mcp2AheYYnlOqKUCS8Tpuf+bx0qf2+AEKBEJt19EST5fjPMBsbbXSqzlfQL7O
	Xhj8nRHv9JFhE90s+5mFPSsWgTmSeHl9ZZH9ExY4pwcBOp0AEoTwVovMnpvPCk9t
	1eY7N+StimGKaCB8K8je1jYv7gSMo1S+hZDt9jK/2a980lnHDajr98L2cvUZLpNt
	ddHMPWObKQJzvC0Q9wMi5YV3/6up2yO4e9teDfRkByEwwsxw0EEcgvhkhZ4sHAPk
	Os4MO9xvyeZQKAJZVS28oN0aCUeO2rN+L8NK52A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XdhYAM/s03vAtPWSbWf5YnaBebn9bgRwcd3QDBPnFg8=:agVeXiaJPEvf3gxUnQmsgYmh5dF9glDhX3caD0w0mrA=;
X-ME-Sender: <xms:68_3aqZP6qVTOBmdg2aoDbsBbgJRt54-4tk0trHqTJrrXPomT6GjuQ>
    <xme:68_3ai9tDj0m3MxBkQ7jac_CnVA121PkQXjXEkoZLA15mvqWkVMP1Isp_YllK4AvH
    W6YD5e4chX7xAbYt43uVJR8wdAuD4RpEzKZAzokMbJjzZfvoDYmhEE1>
X-ME-Received: <xmr:68_3aug-4nJvj3MYYrLNfA3FqN3ICCjorKFVCB1tZcFAxwQob_kX0AN_ncNckXdO2egm3aX6>
X-ME-Proxy-Cause: dmFkZTGkXBi50uEcmbbO+S+EcOsbRyrnOFSQ0xa2xo0vIZjKk5f7l1BJ0t9vlEVqWkt81U
    tATCdu8B83qvMObo2T6XXGsjH722ZvFwIslKjWXR2yUQDJ8gSbuqaHEUgsDGchpkQI81VU
    lrnpwJr88vgtGyfb5CoKSz4kEhIlDHgIWmmSLieGEMWQPmHG5+jfdp6WY6rFcX/kcbFcot
    bWo4sNOuqSpzFo9RtqG731/QwZzh2g0DyPe4cYSylJElLymkxs1m1HRgVz7ROnk2CBdpGJ
    Tk/xvenaFpWNd0Y/CHAX68OguJs0t19cRpg1g8jwD9I6qU9vyNCiTjArZt7BO/Kj7l0kJY
    5ai/jN8I950PVNn0hoCq5NIc9ar2LJrO00Unznx+8zfsnHnQepgGlkiLvVyuTe8VZsRyxb
    cOjwAKlSc2IJx5lVpyKRk5TzSnJsudVYfIuuIK0TSjnOU5guPY3RcMiS/X/pm/MHmU938o
    EoUe16jPkvkOBxz+z5WJyPQc0I+8kGAlbyzfcy8hT9OKIoBr7gDMo4P0k+bj6R+nKWTiOm
    mCwdpsRje8n6HrHoCEnNR7qAt9BxGFHVZBgHTbrbx72x51cOAGRq2qaRYZo/QjeyowQ4FA
    n8wYYK1/U76Zse4zITWn+NKxpH3Y2OLydR+0yN0+S9vTVXXI1UXAvfDmY43g
X-ME-Proxy: <xmx:68_3ath2PzzsRuB3LBRCeXtJK9VHf37JGQnVzE7iOe2r8VoXskMuLw>
    <xmx:68_3as7F5wD51xYhX-oXN3LQ96s0HEbHYPZ-UcZ9meTgZXWMaDvhhQ>
    <xmx:68_3anSYtG3yqpr6BUKLAEKxZBIAPevf0jPYZWHFUomsSRjjmYF06Q>
    <xmx:68_3aj9fzOkYYkuRt3ahImmBNtxQzLlGLEaobu89dls6Ijb-Lzrgvg>
    <xmx:7M_3akR9mCtmNX56h9b4xO7OLLo4Qd_pF6uCLkJwbAkZBjDHCg-4sQaN>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:05:11 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de
Cc: finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	vlwwwwww@gmail.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 1/3] pmdomain: rockchip: switch off the subdomains of a regulator domain at probe
Date: Sat, 14 Nov 2026 16:04:59 +1300
Message-ID: <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615323.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_190516_984508_6948EC9A 
X-CRM114-Status: GOOD (  20.98  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A power domain that needs a regulator is switched off at probe, because
the state of its regulator is unknown at that point. Its subdomains are
added only after that, so a subdomain the bootloader left on stays
powered and not idled behind a parent that is off. genpd reads it as off
and never touches it again, and when the regulator core later disables
the regulator as unused, the bus hangs on the NIUs of those subdomains.

On the RK3576 this hangs boards that do not enable the NPU once PD_NPU
manages its supply (next patch): U-Boot leaves NPUTOP, NPU0 and NPU1 on,
and the SoC locks up when regulator_late_cleanup() disables vdd_npu_s0.

Mark a regulator domain and every domain below it as off when it is
added, and once the subtree is complete, switch it off from the leaves
up. If a subdomain fails to switch off, leave its parents on and warn.

Tested on a Radxa ROCK 4D with the NPU disabled in the DT. Without this
patch, all 14 boots left NPUTOP, NPU0 and NPU1 on, and one of them hung.
With it, all 10 boots switched them off, with no hang.

Reported-by: Vladimir Bely <vlwwwwww@gmail.com>
Closes: https://lore.kernel.org/all/20261113132323.159015-1-vlwwwwww@gmail.com/
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 60 +++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 3699918d17d0..5cc2094e87cc 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -101,6 +101,7 @@ struct rockchip_pm_domain {
 	struct clk_bulk_data *clks;
 	struct device_node *node;
 	struct regulator *supply;
+	bool off_at_probe;
 };
 
 struct rockchip_pmu {
@@ -798,7 +799,8 @@ static void rockchip_pd_detach_dev(struct generic_pm_domain *genpd,
 }
 
 static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
-				      struct device_node *node)
+				      struct device_node *node,
+				      struct rockchip_pm_domain *parent)
 {
 	const struct rockchip_domain_info *pd_info;
 	struct rockchip_pm_domain *pd;
@@ -910,9 +912,16 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	 * the regulator state is unknown at probe time. Also the regulator
 	 * state cannot be checked, since that usually requires IP needing
 	 * (a different) power domain.
+	 *
+	 * The domains below such a domain have to start off too, or genpd
+	 * would see them off behind a parent that is off while the
+	 * bootloader left them on, and never idle them before the regulator
+	 * is cut. Only mark them here: the subdomains are not added yet, so
+	 * rockchip_pm_power_off_subtree() switches the whole subtree off,
+	 * children first, once it is complete.
 	 */
-	if (pd->info->need_regulator)
-		rockchip_pd_power(pd, false);
+	pd->off_at_probe = pd->info->need_regulator ||
+			   (parent && parent->off_at_probe);
 
 	pd->genpd.power_off = rockchip_pd_power_off;
 	pd->genpd.power_on = rockchip_pd_power_on;
@@ -922,7 +931,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	if (pd_info->active_wakeup)
 		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
 	pm_genpd_init(&pd->genpd, NULL,
-		      !rockchip_pmu_domain_is_on(pd) ||
+		      pd->off_at_probe || !rockchip_pmu_domain_is_on(pd) ||
 		      (pd->info->mem_status_mask && !rockchip_pmu_domain_is_mem_on(pd)));
 
 	pmu->genpd_data.domains[id] = &pd->genpd;
@@ -986,6 +995,41 @@ static void rockchip_configure_pd_cnt(struct rockchip_pmu *pmu,
 	regmap_write(pmu->regmap, domain_reg_offset + 4, count);
 }
 
+/*
+ * Switch off the domains marked off_at_probe below and including @np,
+ * children before their parent. If a child fails to switch off, leave its
+ * ancestors on.
+ */
+static int rockchip_pm_power_off_subtree(struct rockchip_pmu *pmu,
+					 struct device_node *np)
+{
+	struct rockchip_pm_domain *pd;
+	u32 idx;
+	int ret;
+
+	for_each_child_of_node_scoped(np, child) {
+		ret = rockchip_pm_power_off_subtree(pmu, child);
+		if (ret)
+			return ret;
+	}
+
+	if (of_property_read_u32(np, "reg", &idx) ||
+	    idx >= pmu->genpd_data.num_domains ||
+	    !pmu->genpd_data.domains[idx])
+		return 0;
+
+	pd = to_rockchip_pd(pmu->genpd_data.domains[idx]);
+	if (!pd->off_at_probe)
+		return 0;
+
+	ret = rockchip_pd_power(pd, false);
+	if (ret)
+		dev_warn(pmu->dev, "failed to switch off %s at probe: %d\n",
+			 pd->genpd.name, ret);
+
+	return ret;
+}
+
 static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 				     struct device_node *parent)
 {
@@ -1004,7 +1048,8 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 		}
 		parent_domain = pmu->genpd_data.domains[idx];
 
-		error = rockchip_pm_add_one_domain(pmu, np);
+		error = rockchip_pm_add_one_domain(pmu, np,
+						   to_rockchip_pd(parent_domain));
 		if (error) {
 			dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
 				np, error);
@@ -1098,7 +1143,7 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	guard(mutex)(&dmc_pmu_mutex);
 
 	for_each_available_child_of_node_scoped(np, node) {
-		error = rockchip_pm_add_one_domain(pmu, node);
+		error = rockchip_pm_add_one_domain(pmu, node, NULL);
 		if (error) {
 			dev_err(dev, "failed to handle node %pOFn: %d\n",
 				node, error);
@@ -1111,6 +1156,9 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 				node, error);
 			goto err_out;
 		}
+
+		/* A domain left on is not fatal; carry on with the others. */
+		rockchip_pm_power_off_subtree(pmu, node);
 	}
 
 	if (error) {
-- 
2.43.0


