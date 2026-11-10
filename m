Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132B60A381E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XlcjJ/FN;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=MWk+1hke
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LGVJZGIzBqq23FRuwiA17JN76P7yNaAe68+qJxIW3Fc=; b=XlcjJ/FNQzcylqWJ9FcG2wAukc
	Dar0bDX1kcg9fTZ70IegPTmR/6sotrEHnkuHYYed21/uWyisFP6Ap6scjV6osKRewyroS+PylHspl
	SAFyZQiMqM/q4koDGyo0pVGzFvcBagjsGHCF4xtkw2SDKhVNGCJOeOiJiKiMFqhdIzz0OMptqa6WD
	pxagTLTdtE7N1CmjB7BgTdYDoRGL8bkPuID6jX6pR6f9cY2BQQE1RwI3b61VttOytXKrq1RQMh7K3
	REvJhvwbjPaigYOhCtZf6sAHSopzPTmCqiu1EvR8+tW9Ifi7ZF0cGYWKH4qgvOyURkE7s+9cLzHoD
	DaNhawXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmtv-00000004DFy-3JcW;
	Tue, 10 Nov 2026 14:32:43 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmtr-00000004DDQ-3tIb;
	Tue, 10 Nov 2026 14:32:41 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542cd9c45;
	Tue, 10 Nov 2026 22:32:26 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] phy: rockchip: inno-hdmi: Fix potential stale clock provider
Date: Tue, 10 Nov 2026 22:32:25 +0800
Message-ID: <20261110-9f141e6bc8-phy-rockchip@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c5dfe33a03a1kunmc234772916cdd1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE1KVkJCH05NTkJJTEsdQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=MWk+1hkeivr0+ehsU/vkIeW+yDKau72EylflaaUK3n/vIRt3Sb22ZK3MlhztmYNAr2fXEcGc+P8+4i3gk6Q5SGW0nRfhG3Sf2VG5fWU/g9VtPx8yLWjjzS27bGUB/bvwGGpR5RDsVqzzePCKikUrUGWBISLhEp5R3q1UKm9ztQs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=LGVJZGIzBqq23FRuwiA17JN76P7yNaAe68+qJxIW3Fc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_063240_219632_E5F92019 
X-CRM114-Status: GOOD (  10.50  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The clock provider remains registered if PHY provider registration fails.
Device-managed cleanup then frees the clock hardware and PHY private
data still referenced by the provider.

Use a device-managed clock provider so both probe failure and removal
unregister it before the clock hardware is released.

This issue was found by our static analysis tool under development.

Fixes: 53706a116863 ("phy: add Rockchip Innosilicon hdmi phy")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index d2c2b17df5f3..09608f204798 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -1068,7 +1068,7 @@ static int inno_hdmi_phy_clk_register(struct inno_hdmi_phy *inno)
 		return ret;
 	}
 
-	ret = of_clk_add_provider(np, of_clk_src_simple_get, inno->phyclk);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &inno->hw);
 	if (ret) {
 		dev_err(dev, "failed to register clock provider: %d\n", ret);
 		return ret;
@@ -1454,11 +1454,6 @@ static int inno_hdmi_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
-static void inno_hdmi_phy_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
-}
-
 static const struct of_device_id inno_hdmi_phy_of_match[] = {
 	{
 		.compatible = "rockchip,rk3228-hdmi-phy",
@@ -1472,7 +1467,6 @@ MODULE_DEVICE_TABLE(of, inno_hdmi_phy_of_match);
 
 static struct platform_driver inno_hdmi_phy_driver = {
 	.probe = inno_hdmi_phy_probe,
-	.remove = inno_hdmi_phy_remove,
 	.driver = {
 		.name = "inno-hdmi-phy",
 		.of_match_table = inno_hdmi_phy_of_match,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

