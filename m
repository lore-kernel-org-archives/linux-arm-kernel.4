Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D199606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1im9IWF7;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PnSAMjBp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PWh9Kr0XFJPQCqbWVOwCtKI5Lauc8b6aI2PRFLhyIx8=; b=1im9IWF7J18E4Y
	Cer06zAHTMP+vapX20AW1/cP7sV8D5pI/GwpF/xTGKJ4/EPl8tHpcsPfp+XBnTMy95BXkZ8R4nsFC
	YwIH64bsYahWwUXga4jeVPq87ybmBePCw7nNHPrY2rh7zjAv5Wu5a4EqcQAPgbPTUH0ohkDjKjjdP
	pvGoh+00PVzTXr9xWJg4Yjm3Wsuwh6TCme9SfvmgBm8tP4H7sVYbvupkFArIpfPML6oxIv2+00aQE
	WC5+yZK2TSKEtWqwtWAn25VgEFGcWmYUkvQHc+pSXHR/oRV2oeiYqx/PrIunJ5x2H7vlaGmCbJCj8
	BmcjxKp7S7ZldaHS/uiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9D4-0000000FbIO-0Pnc;
	Sat, 14 Nov 2026 08:34:06 +0000
Received: from mail-m1602365393.xmail.ntesmail.com ([160.236.53.93])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9Ct-0000000FbC6-3aEt;
	Sat, 14 Nov 2026 08:33:58 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54aa8868b;
	Sat, 14 Nov 2026 16:33:49 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 4/4] MAINTAINERS: Add entry for Rockchip eDP phy
Date: Sat, 14 Nov 2026 16:33:39 +0800
Message-Id: <20261114083339.600986-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261114083339.600986-1-damon.ding@rock-chips.com>
References: <20261114083339.600986-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d930ff2603a8kunmf52e9804102266
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh5MVksaTUNOSEJJTUxDHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PnSAMjBpUSh/RdCNFtNWPMPcKjFnQug4jv28YwHMo/UnlDHGhfSE0L/a39lSuzM5OxsDWBM5YQsIwMf0FS9ukpw5Aw/5cQlTyjeRojQoCyNUl7MKBhsEELDwDYOZAh9JxHF2CnZ54z1VhABnot0ny3/FQ83LNxaJnCALp21EwMk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PWh9Kr0XFJPQCqbWVOwCtKI5Lauc8b6aI2PRFLhyIx8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_003356_506404_3E2034B8 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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

Add a MAINTAINERS entry for the Rockchip eDP Transmitter PHY driver,
covering "rockchip,rk3568-edp-phy" and "rockchip,rk3568-edp-phy-grf"
DT binding schemas and the PHY driver file.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c4f4e48774d0..824f1b8d9c3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24375,6 +24375,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml
 F:	drivers/crypto/rockchip/
 
+ROCKCHIP EDP TRANSMITTER PHY DRIVER
+M:	Damon Ding <damon.ding@rock-chips.com>
+M:	Heiko Stuebner <heiko@sntech.de>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
+F:	Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
+F:	drivers/phy/rockchip/phy-rockchip-naneng-edp.c
+
 ROCKCHIP I2S TDM DRIVER
 M:	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
 L:	linux-rockchip@lists.infradead.org
-- 
2.34.1


