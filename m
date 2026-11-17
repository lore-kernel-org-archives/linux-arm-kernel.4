Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B35A606A891
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HqOrelMm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AcMgczfl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+b74yUvLDxoK8sglf86Bsb/v/4MffzabVcgz+/2mtCE=; b=HqOrelMmahJ281eWhuZYf/wNC9
	fzB199Grz0tMSmkihjtSwt1O6PZxe5TD5o3QHK4yNXjOGFByXFcG2Hs/E7c7O+k7SDUni8vNQVdSp
	Evko7beW3qlPBfPevcXpgpgtRifoMJQKpNdtG/1Qip6kEhHblWlr2zNhQojQZAZYQJkeL9w3mQTQn
	5DK2PUh6lCnShsqm3by4d5OyaW1XJuks8D7elGm5sbwl6BMVN+JhjaK2/gddqmT09HIAvBuWSWfLH
	OfKIuUsFg+uHZqyXvqHDsY2kXiFVDWuU78wuxZr9q0o6I+y/14G0/uwfJ90dC90nFigcA5szMm6Pm
	Wb16GnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTInT-00000005nOa-2vDM;
	Tue, 17 Nov 2026 13:00:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTInJ-00000005nHW-2fue;
	Tue, 17 Nov 2026 13:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F80D46980;
	Tue, 17 Nov 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794920417;
	b=eQZMmPL7PbG95XbrawjYxIxVxxVHtoOP2Hkr9CGBFB2qMoa57aBmUEtYSTAAt2lB/uyA
	 zacnsQjdu3GiRF1Jkhuo2HsflRCD2Rsf/f7LuAcMZxDd31dLH7XzfUVXU0NPcSDtXEhZk
	 qpz9aWm9NCVf4P4tC7vh8kpiyEOFrG+l3Zzw9tjkNV144pWTS8r89RMWqbl0eSavlQtGK
	 R1HvfHSUKq0siil/3+oeFsqODQei5nbpHTV0W/KTKoLkLG1UXmQFw90rNIux8Vv3KW24h
	 h9PWcfwZJsPl0TCMbTQnltQar+C7EzCrMmusdlivwGkValYTztZxr8V2rgbk3zoXHNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794920417;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+b74yUvLDxoK8sglf86Bsb/v/4MffzabVcgz+/2mtCE=;
	b=vRZZWwb9KUR+FTxmLcudhq047r3aFmXqJpn9z5f3XD61m5AA730ajGyuFo/dHPiUUrJN
	 09SOktWjI877GM3RzTGRXWUvQDVmINOLbZznibfCWKfUCP8XdLhxDSgUx16QhZfmuVJuo
	 Gd7gKKA78iei5dRylZ0TsY7lXXH48UoAqPK+eHUkaPAc6Tw+vSd1sCnv/0e8qZqbfrQcJ
	 jlKu6S3cNCRIUwse1jysAdLvOK76/6jVBQLTpR5jDZO7ixTrPa4GzjedKyaSYXoENjVuZ
	 GMpye2WLGkuyT7enOpqwAuz++WKBHmPlaTzEtB+p16Has0KLh+HMw01whsC2oxXnE5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 171C71F000C7;
	Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920417;
	bh=+b74yUvLDxoK8sglf86Bsb/v/4MffzabVcgz+/2mtCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AcMgczflY4FwrwhKc10eeMIlTWR3l85AsApHpANlLGH59OZ2PM7FciXXY0SwsMXai
	 gMcXtlsLaOaM8LLhBXWB7PhFHX1tTeVNVc+Tk7HtjVUQAhkJlCUaosHa0alCYwJvEo
	 OG9vuz7ES2dwpYMtWMNGqW8PDj+Q2hnuDtjptyNIfT9is9rkhxTOSNjnpjC7PoW3Hd
	 fGdKbBqHxLefyiWQaSed3rylCIV9epzZRaRYHLs7Og5OZbA2KAOhFUaAk+Q1+aiun3
	 eff3mqoYYkBIGpRju0tYvtRQXscQ6TFxcH3txwFTotfQNI1IvoNYkud9WJT89pTEP4
	 OlqVW/hoXDtrg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 949484A971;
	Tue, 17 Nov 2026 13:00:15 +0000 (UTC)
From: Roadbobek via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Tue, 17 Nov 2026 13:00:43 +0000
Subject: [PATCH 2/2] phy: sun4i-usb: Assert reset before deasserting in phy
 init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-usb-sunxi-reset-fix-v1-2-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Roadbobek <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794920443; l=1163;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=OVg8qc9Dvbt0DpBBY/dML99s9283yAaJeOiCsaXqahQ=;
 b=5z7gVCV2tubzbMgwKmN+aLOEQ1vWqqKL1z+6YQv0bljLTSE+qxlA1SMTklz+ncPdxMcuB/qF0
 WYOLvj2KjZKCI6wo/koiAq3H3sn2WkQP5ZJ+dadlnl7RRIt2cdEXYw2
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Roadbobek <admin@roadbobek.com>
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
Reply-To: admin@roadbobek.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roadbobek <admin@roadbobek.com>

When a bootloader initializes USB before booting Linux without
first tearing down the controller, phy->reset may already be
deasserted when sun4i_usb_phy_init() runs.

Because reset_control_deassert() alone is a no-op on an
already deasserted reset line, stale USB PHY state can
persist across the bootloader-to-kernel handoff.

Assert phy->reset briefly before deasserting it in
sun4i_usb_phy_init() so the PHY starts cleanly regardless of
prior bootloader USB usage. Tested on an Allwinner A33 Q8
tablet (Laser MID-786).

Signed-off-by: Roadbobek <admin@roadbobek.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index f26eed0db17e..05e6dcf035a1 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -270,6 +270,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
+	reset_control_assert(phy->reset);
+	usleep_range(10, 20);
 	ret = reset_control_deassert(phy->reset);
 	if (ret) {
 		clk_disable_unprepare(phy->clk2);

-- 
2.53.0



