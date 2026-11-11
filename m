Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 01:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OVyfq3tg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzcHbaeB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pKNSEv8C73HiYzEB3RbrIHHT7Qnrx0wZsVyt2zdAEyo=; b=OVyfq3tgcbsp/M472ky9yXL+Rp
	oq15pHNI9z7IOpMBPv3mZ9b/JQnaAschua5k+BtPXFdb+YkGRplZHdU1LUAciYcZ+M4a642pPKjiM
	nAAaet289GAQJaTEgrIA8yP1cJIsCdrtP5r4+8KVdZL+uylwPOaQ5czXsiKl6c/1Z0SdtJkLJGE4p
	WERKbl3QbNg6yMgfraFq/uNDy5vIpmaYiIwlaPqL8iXhu9mcMZ5e5VBiu3vRpiK8PpIi6G4BhslOW
	2zP3n2N8Uy+9OqzRtGL9l+1cqiOSYiT69nuXG4sx+rHSSnc7t0rZPbhjzt0KQfWAk977uYzf4LGuC
	Fm87DjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQx5d-00000005NDh-0kZK;
	Wed, 11 Nov 2026 01:25:29 +0000
Received: from mail-oa2-x0b.google.com ([2607:f8b0:4864:30::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQx5U-00000005NBu-1mXH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 01:25:28 +0000
Received: by mail-oa2-x0b.google.com with SMTP id 586e51a60fabf-49e2cb73ba3so1152846fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 17:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794360319; x=1794965119; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pKNSEv8C73HiYzEB3RbrIHHT7Qnrx0wZsVyt2zdAEyo=;
        b=bzcHbaeBxeXQ4B2RQFUySptCctVacQ55bKCFflU8jl9HElQAR9tTukx/8Acu6BFVxp
         1NomBUJmtbSDDpq7hZGB75XDxKlHhF3p5k2u4bgP8nA5bi/n/v+WoHBf2nRhdh6JzaG2
         9JFDSKQyp/jzsaUJKBB8HYSBDzaSgKmc5xb/rRkDDR/BgK0UKPZeH4yvJzfKESTv+Siw
         j76qT5CPln2y81wDrninOyD1vt1FHlYy9THPRZmwBoZWwZ+efYe4S0MuzvwwJCl6I9LX
         hFP96Pm/Eh7jHn3X7qJKsvBtjwVcFdMLdEbyzywZ1/5ipGWW4Lw2NEDtG+fXZzSA4SP7
         zyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360319; x=1794965119;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pKNSEv8C73HiYzEB3RbrIHHT7Qnrx0wZsVyt2zdAEyo=;
        b=xBiEIaUaU3rdYEpUYoYMD+2N7tz1x3nvoU2lQ5mtkfcGjRKxEanGcGhy0hRDK2lmpn
         QJRLRc3WWWZzrcXxi8M81JDuDH47BzQRUlfrSZxsO6UTmtlfXVoFInqkV5iFeMvGyTqz
         vs/Vvu87kfVcpq2rs7CunLrzRXLZdFqPITyqvMMJMkEtg+NdHGA1Msobmromc27v5boJ
         8sFMsikoUS+tJBu/F75XAGdQTu6HnjE3qY5qUZOAz8wEHDzdpyyhpPJSKPslZ7yEtJTj
         RCYw/XOt/JQDKqXMgP0sv2sgA5A2g+jQJIaz1d1UsrzcPaKcNLscuuPSVjqOGdfZk8r8
         OaIQ==
X-Forwarded-Encrypted: i=1; AL+hErEly2sLFEPim8Aqh5ROXg0EfMcxz6mJLnsazvkB+JHHO8vBlz17jSO8IyHxwiBcnR9G0nTcgLVC8Nq73X+atyvK@lists.infradead.org
X-Gm-Message-State: APuU4Z+s82BPKpPr/q5znhQf57fx9qokSKP0Ly4ctDxGcC0vzM68bgWq
	+2sgFMsj5BhZXBzIPPjUXT3tIsAhpoLH3+0WDDWmVb/uaVPz1RMhLc1M
X-Gm-Gg: AYBFou20LmIQJ6juup1XBKCFiyZXnTDROVbTNYbSNi3pS+iwzy/UT4lPimWVrpxM5nw
	15LojrwluAdr4a09IG5H9m3oLd3dOrbN7cjp4dSbFM2ueRAKC6mhzBw+1pF+coGMGVCEAwapdud
	lW1rod/nSo++x1sOAo9tDE8KvCudjW2W0nJUaLrcLIE342qePafxR+CV8rHKe5OTf3mloj9bBjw
	PUPStjrZIC6SegAMf93odAgJ0dDunWB+F2if1Omv9E2SOY5dJkAgUpsLUJ1sbgyDt5BvHPpsbt/
	eZSV2szGAa8MehcinwDVhlXWyzX1wbPVbrsOVt8RW2bmM+zM/5TYlgMsPZVSpycXRQTX8TG4P52
	nlMwu+LFR7LvQf5yNVf8CzgHfOjT4JdA7bzym/pThMeFWBT5JmaPbuIxlQTkArYrdB9OsOUdAOO
	1adlbxVx50bi09nXRAZOmHxysmIgYT6twHiFS00ScZqVOTng6PpAh0Nw3/wbGBK0EsoQdPtGSZY
	5JZhh8XzI0kgyAypsMtDGNR6LoEPtjIkBclZ4lORsAGYRhKy7yK9uTJqrtVCTieCbCjfqAfgB1M
	71G3zQMHaeiGYrQ4kjtfLKRj
X-Received: by 2002:a05:6870:8127:b0:4a6:a925:e13 with SMTP id 586e51a60fabf-4ae46ab8173mr993348fac.14.1794360318595;
        Tue, 10 Nov 2026 17:25:18 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fc0d08sm2561558fac.8.2026.11.10.17.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:25:17 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 10 Nov 2026 19:23:57 -0600
Subject: [PATCH v2] pmdomain: mediatek: Don't power cycle domains on probe
 deferral
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5XNQQ6CMBAAwK80e2ZNW1CRk/8wHKBsYaNtSQtEJ
 fzdiC/wOpdZIVFkSlCJFSItnDh4qITOBJih8T0hd1AJ0FKflJQXjG2cCdNMb5zHNEVqHPse3XT
 H0XXBNeyxI0sRpTHlmdpSF1JCJmCMZPm5X7c6EzBwmkJ87fWivvpblFR/LItChW1hCmVsfsmP9
 tq7hh8HExzU27Z9APnT5Z3iAAAA
X-Change-ID: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb82400
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: =?utf-8?q?Nils_B=C3=BCchner?= <nils@buechner.me>, 
 Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794360315; l=8041;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SCW+i7LGMyAr5TBjjicZAEhFH9gU2c4NY/q5LOyF/r4=;
 b=hJgGJR2w7XjGB70xKQLeJ0QH6CLIplcyvd3j913D0ftk5/n1CoLWNiL/TmQshf7C6HjLCpmvN
 bGnN1Djp6nDDWOixBtpo1bLCWUwmPTKNwdYHE5UWz4eCVIUgc7d0rbI
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_172520_529123_C4E53568 
X-CRM114-Status: GOOD (  30.27  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

scpsys_add_one_domain() powers each domain on as soon as it is added,
before the probe has looked up the supplies and clocks of the domains
after it. When one of those is not available yet the probe defers, and
the cleanup powers off every domain added so far, whatever state it was
found in. The retry then powers them all on again.

A bootloader that leaves the display scanning out does not survive
that. On the Amazon Fire HD 10 (MT8173), mfg_async's domain-supply comes
from the MT6397 PMIC, which registers after the power controller first
probes, and power cycling the MM domain under the running display hangs
the SoC on almost every boot.

Power the domains on only once all of them have been added, so that a
deferral leaves the hardware as it was found, and on cleanup power off
only the domains this probe has turned on.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found on an Amazon Fire HD 10 (2017), an MT8173 tablet whose board DTS
is not upstream yet. Its bootloader (LK) leaves DISP_OVL0 scanning out
when it starts the kernel, and the MT6397 regulators register about 50 ms
after the power controller first probes, so the probe often defers.

The deferral was forced for the A/B with a local test knob that returns
-EPROBE_DEFER at the first domain with a domain-supply. Each boot attempt
was counted from the host's USB log, since a hung board is reset by the
watchdog into the same kernel. The hang does not happen when the
display is stopped before the power controller probes, which is what
our downstream kernel does today.

elm, hana and the MT8173 EVB also give mfg_async a domain-supply, from a
DA9211 on I2C, so they probably take the same deferral path. Whether
their firmware leaves anything running across it, I don't know.

Only MT8173 (direct control) was tested. The HW-voter cleanup changes
the same way, powering off only what this probe powered on, but there is
no such hardware here.

This patch was developed with the help of an LLM.
---
Changes in v2:
- Rebased onto pmdomain next, on top of Nils Büchner's "pmdomain:
  mediatek: Don't power off default-off domains in probe cleanup". Its
  KEEP_DEFAULT_OFF check in scpsys_remove_one_domain() is kept as is, so
  the cleanup no longer passes that condition itself. No other change.
  The patch does not cover this case, since it skips only KEEP_DEFAULT_OFF
  domains, and MT8173 has none, so there a deferral still powers off
  every domain the probe has added, and the retry powers them on again.
- Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com
---
With the deferral forced at mfg_async on every boot and the bootloader's
display left running, 61 of 63 boot attempts hung before userspace
without this patch, and none of 5 with it. With the patch, the cleanup
left MM on as the bootloader had left it on every boot; without it, it
powered off all seven domains the probe had turned on, MM included.
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 59 ++++++++++++++++++------------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 1b5cc9eb920a..6ec77ed0dd66 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -984,12 +984,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		pd->genpd.flags |= GENPD_FLAG_IRQ_SAFE;
 	}
 
-	/*
-	 * Initially turn on all domains to make the domains usable
-	 * with !CONFIG_PM and to get the hardware in sync with the
-	 * software.  The unused domains will be switched off during
-	 * late_init time.
-	 */
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
 		bool domain_is_on;
 
@@ -1001,15 +995,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		if (domain_is_on)
 			dev_warn(scpsys->dev,
 				 "%pOF: A default off power domain has been ON\n", node);
-	} else {
-		ret = pd->genpd.power_on(&pd->genpd);
-		if (ret < 0) {
-			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
-			goto err_put_subsys_clocks;
-		}
-
-		if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
-			pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
+	} else if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON)) {
+		pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
 	}
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
@@ -1087,7 +1074,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 	return ret;
 }
 
-static void scpsys_remove_one_domain(struct scpsys_domain *pd)
+static void scpsys_remove_one_domain(struct scpsys_domain *pd, bool powered_on)
 {
 	struct scpsys *scpsys = pd->scpsys;
 	int ret;
@@ -1112,11 +1099,10 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
 		goto put_clocks;
 
-	if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_HW_VOTER) {
-		if (scpsys_hwv_domain_is_enable_done(pd))
+	if (powered_on) {
+		if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_HW_VOTER)
 			scpsys_hwv_power_off_internal(pd);
-	} else {
-		if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
+		else
 			scpsys_power_off_internal(pd);
 	}
 
@@ -1125,7 +1111,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 }
 
-static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx, u8 num_probed)
+static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx,
+				  u8 num_probed, u8 num_powered)
 {
 	struct generic_pm_domain *genpd;
 	struct scpsys_domain *pd;
@@ -1137,7 +1124,7 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx, u8 num
 		genpd = scpsys->pd_data.domains[pd_idx];
 		if (genpd) {
 			pd = to_scpsys_domain(genpd);
-			scpsys_remove_one_domain(pd);
+			scpsys_remove_one_domain(pd, i < num_powered);
 		}
 	}
 }
@@ -1374,6 +1361,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	struct scpsys *scpsys;
 	int num_domains, ret;
 	u8 num_added_pds = 0;
+	u8 num_powered_pds = 0;
 	u8 *added_pds_idx;
 
 	soc = of_device_get_match_data(&pdev->dev);
@@ -1449,6 +1437,31 @@ static int scpsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * Initially turn on all domains to make the domains usable
+	 * with !CONFIG_PM and to get the hardware in sync with the
+	 * software.  The unused domains will be switched off during
+	 * late_init time.
+	 *
+	 * Do this only once every domain has got its supply and clocks,
+	 * so that a probe deferral leaves the hardware as it was found:
+	 * the bootloader may still be using a domain that is already on.
+	 */
+	for (; num_powered_pds < num_added_pds; num_powered_pds++) {
+		struct scpsys_domain *pd;
+
+		pd = to_scpsys_domain(scpsys->domains[added_pds_idx[num_powered_pds]]);
+		if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
+			continue;
+
+		ret = pd->genpd.power_on(&pd->genpd);
+		if (ret < 0) {
+			dev_err(dev, "%s: failed to power on domain: %d\n",
+				pd->genpd.name, ret);
+			goto err_cleanup_domains;
+		}
+	}
+
 	ret = of_genpd_add_provider_onecell(np, &scpsys->pd_data);
 	if (ret) {
 		dev_err(dev, "failed to add provider: %d\n", ret);
@@ -1459,7 +1472,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup_domains:
-	scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
+	scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds, num_powered_pds);
 	return ret;
 }
 

---
base-commit: 09078f3f8a6fca5c3a2d674b7059f4d7b46e21c6
change-id: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb82400

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


