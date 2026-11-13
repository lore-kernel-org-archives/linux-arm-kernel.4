Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081260A2600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gu5pzLxG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYKuBPvK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rae9V4FPwbslU8FMOU+hcXCS6mYLPzOc1lkOL01C3s0=; b=gu5pzLxGL5O+Hn58KDd0C2PRTI
	+dbFOqJP6INXyRhs70pgFuZGkrwd+qW26Mv7ENFHIEdt1cGECRrBtYZwB+aNT+AcJ74wdf2LzH71N
	99UF83BC/otJyXIMHZT2ircF6R9kj9+WiImeOKfTg21P9uoMANU41rKay53xSVdZZOb5+EE1mb+Br
	qnc1RWbr5q1XgAzmaIL5IP6i2NsU9vWt+N5At8By1wMscFokvucDDbbHiOGRUNcd31VCf7oQq4RJr
	3wowHT+LETHAfwNg+eM+Z+kEoq+Rikq1FaACo7Y9ntNCd81p+kukU6fscTCwsjddYslv5EXVCqP72
	HzURSIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmrH-0000000C6ri-3FwK;
	Fri, 13 Nov 2026 08:42:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmrH-0000000C6rL-17SO;
	Fri, 13 Nov 2026 08:42:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD91040545;
	Fri, 13 Nov 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794559326;
	b=sFx21Kac/fW2y4wBcvemMuR8ScV/H62nUgFIYCgOIfXZ1VFajEMDlu6bMPU41UNHD2kt
	 VzJ5KjUJM2qpH8BpE/kD/fBmxiVQi4DIiToDv5wVaV8+jmCbsr5gSjVP3WD1tV3Egadhd
	 /bYa/XbtPFwJ992bksQDAan0BCqV0FJRWoV6aRYVstDoV6iLXFtfAhnAnIjp7+kPVYVH8
	 X4VNRskyJiXEokCq7yyBzn93qHjGvgK4JI4o0jak9HXttZmLLnzRQwEGV+/r+le79HtWs
	 xsmZQyaEUKEvJwGBnVPk0D2pt7c3mIoTXQ+/Ie5gWspn8CiLs74ejNs76cSiJ37j3+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794559326;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rae9V4FPwbslU8FMOU+hcXCS6mYLPzOc1lkOL01C3s0=;
	b=oi7xpdaZkj0s1QmDGahsqWFQUjbGQRHLCvXyD2lxU7/3ADYwpBjabw8EWvPW1WJcXzn+
	 HHaWwd7G2AIxAufSzlWN6NSEmfIuEZgkQwfWQCk3kCESn1shx1xnPLsan1nJNj4M/Gtmj
	 Av4nABytHSQr1v/h7cz2t5um2ezQrXL4WeDMIYHn2nzl0GSLtigDPoyziAiWjw+S/dvqa
	 sE9QRCfAPoyjGBUX6NeUMqNy7+X+B1zb+2aGcuIKqfaOHvyl9Ah0HJi8WSzB9GrFE7WKi
	 cYtOmFMDg9ECU4Vm3tC8CsbM70AV3GZTNa4tJKQ9AkDUuYn2QHNyR+/33jr1opoOw7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3363F1F000C5;
	Fri, 13 Nov 2026 08:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559326;
	bh=rae9V4FPwbslU8FMOU+hcXCS6mYLPzOc1lkOL01C3s0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FYKuBPvKHpRRRkNV7ndHM2kEo0oTSeZ8EfPSmA5ey5bD4+b+ob/VGbVLg70+IUu2V
	 oR47LJ+EVa7HVeSkz9cWPSeYruJ5/lU8PS1TV9BHfGqN0t2E3G0AA+kareod03dEOy
	 hxGa8CyejUGXVXsV4vbbMgj9OIqXctkXMH0GTnD+BMHSN5YeOqUzUtCs5VYvBlc2jl
	 eEReiQRxIRlXmGLyPQTKrSb2yk9qgP6gxZp31uP3HNZcEH1EdyN4gx+BFzL1hal6nf
	 bJlLXgvbc8ztr4gRK5L6Ik8X8QRl+vQqXWWSgrbfQiRKV/bXVZhCbCW/8i0S8t4Esw
	 MuSMB1Z+k5Mzg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B572B476A4;
	Fri, 13 Nov 2026 08:42:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 08:42:05 +0000
Subject: [PATCH v3 1/3] pmdomain: rockchip: remove subdomain links before
 the domains on error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-pmdomain-rockchip-v3-1-b7039ca30b87@gmail.com>
References: <20261113-pmdomain-rockchip-v3-0-b7039ca30b87@gmail.com>
In-Reply-To: <20261113-pmdomain-rockchip-v3-0-b7039ca30b87@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559325; l=2410;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5iFWkjIpYXw+8Ro3BXPVNak7cKPCkmaVzIP2b4nraWU=;
 b=asyIT48IM4s8kSCIe3IC3jSAcinyiaFuKPPhEvft4iP7yvo+5vWaJ16gRUZRiY4AxCuoJnCps
 bNZx1FzvK8EDGzJL3KfM5MvcahRaEGh0xKWwMRDuVy1iyOH2d2taU/A
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

When probe fails after some domains were registered, the cleanup calls
pm_genpd_remove() in domain id order. That fails with -EBUSY for every
domain that is still a parent. Reversing the order does not help: on
RK3588 RKVDEC0/1 have a parent with a lower and one with a higher id.
devm then frees those domains while they are still on gpd_list.

Remove the parent/child links first, depth first over the DT nodes.

Fixes: 79d12b7a7f22 ("soc: rockchip: power-domain: use pm_genpd_remove in error cleanup")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 86b5074b0469..df3f43d0c01b 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -955,12 +955,45 @@ static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
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
+/* Remove the links depth first, so each child has no subdomains left. */
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
 
+	/* pm_genpd_remove() refuses a domain that still has subdomains */
+	for_each_available_child_of_node_scoped(pmu->dev->of_node, np)
+		rockchip_pm_remove_subdomains(pmu, np);
+
 	for (i = 0; i < pmu->genpd_data.num_domains; i++) {
 		genpd = pmu->genpd_data.domains[i];
 		if (genpd) {

-- 
2.55.0



