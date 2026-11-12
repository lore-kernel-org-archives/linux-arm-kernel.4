Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86471606A890
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QhXbt9dB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDqze4QM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mOIDWOADODdIdFZtlIHRbJVwOJgcYqrpFp/gYJAH4aM=; b=QhXbt9dB6t0EVTcKKuC5Vv7188
	lLsXsHCIYteDrJT7RcCkp3rvI/C9rpk665VUUPS1Y33UtuqJtsrTRa70cNzuch5yVgP0pidStvI+8
	ffO2ggubmo20KzQnm4ugu2jnCHEKXapr7fgvTQgwaimizp9UNCZn6SNqeOJ97IFawizwKDTuIsd5A
	kgjITWu0gXj4INP86zRIUkio6O0S5THHmz8en2D3R4/o3B2zcNZ6tJQxSCUOE1wM7VC/6IqG8hm0I
	Mc/BJhs51pcF+o1z847aa4yhv/MYzE8m9wi/juUcH4esh1OR1NumulbVADAxiyUv6rpabZNnNYGH4
	xLwXyy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ5r-000000095JX-0St0;
	Thu, 12 Nov 2026 08:23:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ5j-000000095HL-3kyL;
	Thu, 12 Nov 2026 08:23:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4637D63B24;
	Thu, 12 Nov 2026 08:23:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471811;
	b=hEaqwFmTBAqXpHNzymmkOoD71UeeIj9QF6A4uWMBfg4xAyuVN1MAgUFhOy+cmeB7LpwI
	 jfgYXMd9G5M9b0PZMm91XiYEpJjmOWY73o4zknn0SlIUYyWiJSQjFru2dTenDrtf0c/k0
	 RzPljdk4VrskODNIA6HmxezeSJsZsZQcgbcSL8iE3wtvLwGfpfmWjw776qqJ4/q3/qff+
	 RES8rSKlReM4JKThk/Vzy8mG39NoFkBzVyJ5WB/+suPKTWPgg8trYFgsJx8a6pOVpdvHy
	 kf1nC9/326H4CY+jy9T6Z1ei28VY8AoGiUdmi5P2vnMZjcvkKbWbU8nqfOA6KzEa8Bw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471811;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mOIDWOADODdIdFZtlIHRbJVwOJgcYqrpFp/gYJAH4aM=;
	b=oF4CMGVqt7FZwndZkV0Q5QYpItwrKbiBd7qGr+9XO08MZvBslADq2IeiC3Au6TKEYjIt
	 ikUhjp/aV50f1+G8LyW+mSNMPO+UlAtb3AvuV2GHTyxn4+1HLRKzomOyQ7SmKbH7bumlt
	 rm3UxRKTJiiOa9KzHYfXW2WNfHIwG3C91A+LzUA66f1qqyjGaAUaKl14I5+Q0CICQYI3p
	 1L5JLb9biqfsM19BoQNhqmFGcDylAz6ZP4XPz/aSualoc+Qp27sPYeyNU8dwriRRT+omz
	 ktvzCbnv8bBbThr8XbaTLSy54j2xcAyNCaQNBdUnHXIMA1Hu5TJfHe/OXE5PdMJcsgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40DF01F00A05;
	Thu, 12 Nov 2026 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471810;
	bh=mOIDWOADODdIdFZtlIHRbJVwOJgcYqrpFp/gYJAH4aM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JDqze4QM2XpDIM4Whf0EvJrt4ihMt03bT0XxLarNnZSzhzzyADvOztQ4R9/sWqR+W
	 xo8a5NmRpDoQzQgBwDgrI5/dtjmQetybyql6LGaTYHbRqUW9jATvc742fld4U0tSki
	 fbg5H9bHAmr5ha3kna6aGz4LXY7lzbAKjwXdvqdz0+Ms2Tl8rkGqCuhYxs7BO+LGYf
	 5viwFseSXFeZ3c/dhG0gSrFmSq2Pel8sVkrhy0TSFhC5Us+y/+xccno3QKUIWjYVCp
	 hvvyVuwPWlCr6uUFKhIzmlT663p06jp9mKY15/AGoIES1EXStUosX/dvhyfc/WXLTZ
	 +E5ZzJ6Q+AWpg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BD1C049351;
	Thu, 12 Nov 2026 08:23:29 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:23:30 +0000
Subject: [PATCH v2 2/2] pmdomain: rockchip: report domain errors once, with
 dev_err_probe()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-pmdomain-rockchip-v2-2-5cd942a23df7@gmail.com>
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
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471809; l=7366;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=NjDgN0qxUNb8P6mWj/gQ4TDMTDd100w9vcSH2E4Nnws=;
 b=uCNgNWReaauPLf0MyoPtleQYM2BzI10ZFEpvl6R03KZd4/DcFIva5RZJU8iUeSG0tN/b2CUrr
 dHYBRH+bmoAAaOSJG2J8OpsPMJGNdyxyhJOehfNBhVULRcqM4WsYcC/
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

When a power domain clock is not available yet,
rockchip_pm_add_one_domain() returns -EPROBE_DEFER, and both it and its
callers rockchip_pm_domain_probe() and rockchip_pm_add_subdomain() print
that with dev_err():

  rockchip-pm-domain ...: power-domain: failed to get clk at index 1: -517
  rockchip-pm-domain ...: failed to handle node power-domain: -517

once per probe attempt, and the second line twice for a nested domain.
On an RK3588 board whose NPU domain clock appears late this is more than
20 error lines before the domain finally probes, and the reason of the
deferral is not recorded. Other failures are reported twice (once where
they happen and once by the callers), or only by the callers, which name
the node but not what failed: a missing pm_qos phandle and a pm_qos node
without a regmap print nothing in rockchip_pm_add_one_domain(), and a
failed clk_bulk_prepare() only has the message of the clk core, which
names neither the device nor the domain.

Report every error once, where it happens, with dev_err_probe(), and
drop the "failed to handle (subdomain) node" messages from the callers.
A deferral is then quiet and keeps its specific reason in
/sys/kernel/debug/devices_deferred, such as "failed to get clk at index
1", and -ENOMEM, which the callers used to print, is quiet as well. The
return values are unchanged, except that a failed
syscon_node_to_regmap() for a pm_qos node now returns its own error
instead of -ENODEV: it can be -EPROBE_DEFER (a syscon regmap that is
not registered yet, or a syscon clock or hwlock that is not available
yet), which must not turn into a probe failure.

Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
Fixes: 6be05b5ec161 ("soc: rockchip: power-domain: add support for sub-power domains")
Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 98 +++++++++++++++-------------------
 1 file changed, 43 insertions(+), 55 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 00c7e78f89b5..be077fb52f40 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -804,28 +804,22 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	int error;
 
 	error = of_property_read_u32(node, "reg", &id);
-	if (error) {
-		dev_err(pmu->dev,
-			"%pOFn: failed to retrieve domain id (reg): %d\n",
-			node, error);
-		return -EINVAL;
-	}
+	if (error)
+		return dev_err_probe(pmu->dev, -EINVAL,
+				     "%pOFn: failed to retrieve domain id (reg)\n",
+				     node);
 
-	if (id >= pmu->info->num_domains) {
-		dev_err(pmu->dev, "%pOFn: invalid domain id %d\n",
-			node, id);
-		return -EINVAL;
-	}
+	if (id >= pmu->info->num_domains)
+		return dev_err_probe(pmu->dev, -EINVAL,
+				     "%pOFn: invalid domain id %d\n", node, id);
 	/* RK3588 has domains with two parents (RKVDEC0/RKVDEC1) */
 	if (pmu->genpd_data.domains[id])
 		return 0;
 
 	pd_info = &pmu->info->domain_info[id];
-	if (!pd_info->pwr_mask && !pd_info->req_mask) {
-		dev_err(pmu->dev, "%pOFn: undefined domain id %d\n",
-			node, id);
-		return -EINVAL;
-	}
+	if (!pd_info->pwr_mask && !pd_info->req_mask)
+		return dev_err_probe(pmu->dev, -EINVAL,
+				     "%pOFn: undefined domain id %d\n", node, id);
 
 	pd = devm_kzalloc_obj(pmu->dev, *pd);
 	if (!pd)
@@ -849,17 +843,20 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	for (i = 0; i < pd->num_clks; i++) {
 		pd->clks[i].clk = of_clk_get(node, i);
 		if (IS_ERR(pd->clks[i].clk)) {
-			error = PTR_ERR(pd->clks[i].clk);
-			dev_err(pmu->dev,
-				"%pOFn: failed to get clk at index %d: %d\n",
-				node, i, error);
+			error = dev_err_probe(pmu->dev,
+					      PTR_ERR(pd->clks[i].clk),
+					      "%pOFn: failed to get clk at index %d\n",
+					      node, i);
 			goto err_put_clocks;
 		}
 	}
 
 	error = clk_bulk_prepare(pd->num_clks, pd->clks);
-	if (error)
+	if (error) {
+		dev_err_probe(pmu->dev, error,
+			      "%pOFn: failed to prepare clocks\n", node);
 		goto err_put_clocks;
+	}
 
 	pd->num_qos = of_count_phandle_with_args(node, "pm_qos",
 						 NULL);
@@ -884,13 +881,18 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 		for (j = 0; j < pd->num_qos; j++) {
 			qos_node = of_parse_phandle(node, "pm_qos", j);
 			if (!qos_node) {
-				error = -ENODEV;
+				error = dev_err_probe(pmu->dev, -ENODEV,
+						      "%pOFn: failed to get pm_qos %d\n",
+						      node, j);
 				goto err_unprepare_clocks;
 			}
 			pd->qos_regmap[j] = syscon_node_to_regmap(qos_node);
 			of_node_put(qos_node);
 			if (IS_ERR(pd->qos_regmap[j])) {
-				error = -ENODEV;
+				error = dev_err_probe(pmu->dev,
+						      PTR_ERR(pd->qos_regmap[j]),
+						      "%pOFn: failed to get pm_qos %d regmap\n",
+						      node, j);
 				goto err_unprepare_clocks;
 			}
 		}
@@ -1038,39 +1040,31 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 		u32 idx;
 
 		error = of_property_read_u32(parent, "reg", &idx);
-		if (error) {
-			dev_err(pmu->dev,
-				"%pOFn: failed to retrieve domain id (reg): %d\n",
-				parent, error);
-			return error;
-		}
+		if (error)
+			return dev_err_probe(pmu->dev, error,
+					     "%pOFn: failed to retrieve domain id (reg)\n",
+					     parent);
 		parent_domain = pmu->genpd_data.domains[idx];
 
 		error = rockchip_pm_add_one_domain(pmu, np);
-		if (error) {
-			dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
-				np, error);
+		if (error)
 			return error;
-		}
 
 		error = of_property_read_u32(np, "reg", &idx);
-		if (error) {
-			dev_err(pmu->dev,
-				"%pOFn: failed to retrieve domain id (reg): %d\n",
-				np, error);
-			return error;
-		}
+		if (error)
+			return dev_err_probe(pmu->dev, error,
+					     "%pOFn: failed to retrieve domain id (reg)\n",
+					     np);
 		child_domain = pmu->genpd_data.domains[idx];
 
 		error = pm_genpd_add_subdomain(parent_domain, child_domain);
-		if (error) {
-			dev_err(pmu->dev, "%s failed to add subdomain %s: %d\n",
-				parent_domain->name, child_domain->name, error);
-			return error;
-		} else {
-			dev_dbg(pmu->dev, "%s add subdomain: %s\n",
-				parent_domain->name, child_domain->name);
-		}
+		if (error)
+			return dev_err_probe(pmu->dev, error,
+					     "%s failed to add subdomain %s\n",
+					     parent_domain->name, child_domain->name);
+
+		dev_dbg(pmu->dev, "%s add subdomain: %s\n",
+			parent_domain->name, child_domain->name);
 
 		error = rockchip_pm_add_subdomain(pmu, np);
 		if (error)
@@ -1141,18 +1135,12 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 
 	for_each_available_child_of_node_scoped(np, node) {
 		error = rockchip_pm_add_one_domain(pmu, node);
-		if (error) {
-			dev_err(dev, "failed to handle node %pOFn: %d\n",
-				node, error);
+		if (error)
 			goto err_out;
-		}
 
 		error = rockchip_pm_add_subdomain(pmu, node);
-		if (error < 0) {
-			dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
-				node, error);
+		if (error < 0)
 			goto err_out;
-		}
 	}
 
 	if (error) {

-- 
2.55.0



