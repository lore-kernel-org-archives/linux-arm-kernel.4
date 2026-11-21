Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BoufzGIS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JlEBdC2H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rAgcqIqOw6zcaQD0GaowJvtaNg3/b1Y5Y23WzFleRQ4=; b=BoufzGISycpg2wwO5yMrBWskcX
	epO/hjws/3+t39AL+EzWIFf6dVkXpy/BW3sb/yPST4fAxMuwkMOFixJQFfla++5D6d18Yx7HUXpQt
	9SggagvtRNB5xwbGlpxcRr1HGBuNNPTnPvlveMJw/0tbtTG4mccULZhvzfIyqkQJgmQPJMIBWEwvZ
	jdTKVrxIXlloNH+LnmGVZ3TUguaM+6u9fKeS1HBA7rcBn6XxM0rSJ13BqJ6N6wGMZXoedba2MTDOc
	zF6Q37nrXSRZIO7TTtQXGwZQ6Wl2Jz+A36Xl8JvGD9NwUVkSNyZoLA06Roy3jqU6SzTBXdkWI+kKF
	60hT9WNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqfT-0000000061h-0anq;
	Sat, 21 Nov 2026 19:22:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqeg-000000005N0-0YSH;
	Sat, 21 Nov 2026 19:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C509545B26;
	Sat, 21 Nov 2026 19:21:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795288905;
	b=Yt2V6k8/DXdclqCos7oC1WThjl5gk983RApxu3TFT/X9qQJCidGF7HsyTLMIEAzEFUmy
	 42Jh4bhCLxcs+CCFJTl7peLd0ewERxoSdfitFlvH1ojC1iA5rzk2T5MXzaJfaaGfOuSO0
	 /+mI0ViWOPSeJVH27dFmKYZhw/8qmk/pbVuGcBZOPMsNhlQ7e3h7QVYnpNKMKtTfLS3sP
	 IO5zhDUKFfkfhVy/prp7Wp7Q8/bRcM5XTX89bNkEvk0plNTMq/dCgM1WSl1iL0Wtuq5Sp
	 sX/ZV6SbloJvEvd3WqfPHkY0+gthWha6dBPgXSBp1KBVflQs4VFtG/XapTGLq4HK4Mw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795288905;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rAgcqIqOw6zcaQD0GaowJvtaNg3/b1Y5Y23WzFleRQ4=;
	b=dw871ckaIm0LZXCEb4Gvd2tHAtW2/jXCsZVdwsva40EQgmr/iztj/id6+DeiqOWXl8CT
	 2ckVSoRqg5mbiJZP7jBAKMdB+waQenajktOElizDIdqARbkSJMzsvJv6dUpbWiK3YdSMq
	 MZhgshH1tu5mXy1eyvL3zmMlp+P9OjncXI8YAQgpM09c+QpSC6QGYSyYqWNgGFKoZ9Bf6
	 y8qFJ0T+ofVDimlpOOBfg6rFFTdNIXsi5GcyZdXNEBNLqSbApYvTLORRj61dVqsomSnLM
	 KrT795xkcNmv5QeuLmYE2u2n+Ib7C1hQkF0sCTypwTOXcVkbY/usUC0H2eyp3b4sgbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A1031F000D3;
	Sat, 21 Nov 2026 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795288905;
	bh=rAgcqIqOw6zcaQD0GaowJvtaNg3/b1Y5Y23WzFleRQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JlEBdC2H/30seFlcxFGPk7ym6bF9oBRq4CAuAOeBkV2JdBxUxIUlRzG5kWpygthN7
	 I938eLXO4oEE5N8KFFY4HmLe08dL+K4tx9P3Dc51lzL1oF6ZEGWB9Q0F4P/llVoOOE
	 OEKRLKsUV2YUqyrNst38FvGsqro0+u91e6CQ/csJTmUtW/EwLu0WjKSJ/gElBctvbV
	 r9srK660KdXfgt5cYCIYRNxixW95dPCPN6INU5RGjbChQiCqqalOBu1VBXZwB+GWIy
	 ls3QqRQi3mVbgGKg8q+2z60H5iusFAAripsVAfPspC1kA5b9Qpe7jjHgsFjFNUGKV4
	 Zm+XPN+ddC0vg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 257064BD7A;
	Sat, 21 Nov 2026 19:21:39 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sat, 21 Nov 2026 20:21:08 +0100
Subject: [PATCH v3 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-meson-drm-create-hdmitx-phy-v3-6-f8f471788076@aliel.fr>
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
In-Reply-To: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=2pSroicxmn87L6WpeMI1TQ71NJdXRXfygd9gmAxHGRQ=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQzbjeyNd/pLbHSLbNC9O7Kpl3LCmtWPdlw0x26Z8ct2+b
 F4R+4KjHaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBEShIY/rtH9t6YeTTJafnp
 9R9ffZ8eufZx5l6Jn+wuL6YyvprF2HqV4Z99JNPl6lw7zxLnFWsfzZ+R/Cy0M3Zmq7DQ/47JSc8
 2PuQBAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

When a power domain is found already powered on at probe time (typically
the VPU domain left enabled by the bootloader), the driver registers the
genpd in the ON state with GENPD_FLAG_ALWAYS_ON and never calls
meson_ee_pwrc_on(). As a result, the memory power-down bits of the domain
are not touched.

pwrc_ee_is_powered_off() only checks the top-level sleep bit, so a
bootloader that enabled the VPU without waking every memory block
leaves those memories powered down, and nothing in the genpd framework
will wake them since pm_runtime_resume_and_get() is a no-op for an
always-on domain.

This is a preparatory change: a following patch drops the explicit
HHI_MEM_PD_REG0 write from the meson_dw_hdmi driver, which relies on the
power domain to power the HDMITX memory.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/pmdomain/amlogic/meson-ee-pwrc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
index 338f70d77bf0..b3ae5cd7bea8 100644
--- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
@@ -392,11 +392,21 @@ static int meson_ee_pwrc_off(struct generic_pm_domain *domain)
 	return 0;
 }
 
+static void meson_ee_pwrc_mem_power_up(struct meson_ee_pwrc_domain *dom)
+{
+	int i;
+
+	for (i = 0; i < dom->desc.mem_pd_count; i++)
+		regmap_update_bits(dom->pwrc->regmap_hhi,
+				   dom->desc.mem_pd[i].reg,
+				   dom->desc.mem_pd[i].mask, 0);
+}
+
 static int meson_ee_pwrc_on(struct generic_pm_domain *domain)
 {
 	struct meson_ee_pwrc_domain *pwrc_domain =
 		container_of(domain, struct meson_ee_pwrc_domain, base);
-	int i, ret;
+	int ret;
 
 	if (pwrc_domain->desc.top_pd)
 		regmap_update_bits(pwrc_domain->pwrc->regmap_ao,
@@ -404,10 +414,7 @@ static int meson_ee_pwrc_on(struct generic_pm_domain *domain)
 				   pwrc_domain->desc.top_pd->sleep_mask, 0);
 	udelay(20);
 
-	for (i = 0 ; i < pwrc_domain->desc.mem_pd_count ; ++i)
-		regmap_update_bits(pwrc_domain->pwrc->regmap_hhi,
-				   pwrc_domain->desc.mem_pd[i].reg,
-				   pwrc_domain->desc.mem_pd[i].mask, 0);
+	meson_ee_pwrc_mem_power_up(pwrc_domain);
 
 	udelay(20);
 
@@ -478,6 +485,8 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
          * prepare/enable counters won't be in sync.
          */
 	if (dom->num_clks && dom->desc.is_powered_off && !dom->desc.is_powered_off(dom)) {
+		meson_ee_pwrc_mem_power_up(dom);
+
 		ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
 		if (ret)
 			return ret;

-- 
2.56.1



