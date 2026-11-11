Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0910A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IQgyLb5N;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=sXl6Ca3B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0P2VV1oALOP/3gmFL87eTvjlTzFKQUaWGHBRZ3suqaQ=; b=IQgyLb5NqtubYq
	u2mn7WS/PFP2Q1tIMppCSJ9OVYDAoOSmvs0WukdbqdKMFtDifjxk3Wb0yhz9emT/VbCATrzBChTY0
	tNQMKmlHiFGcho4mqrVoPO3ZJgWz2B2YMLvcBetXwWpUa4QOm+MU/LceM5TzNdAgpoxB9hp1tYiHS
	ccE6MePVacQLQtALfr3hMT0p5OhfnHyRArA0QXg7yKuVc3le17MEtVd4SxfzyWj4rj4zUgQFn282O
	O/ETDESTSWFKWarqbz4nTtL0U9YeoRKdXTELmkh0GJ3aU6oPrgR1rXOlIOfX/K7Lb6T/iLzycHuhn
	si+u1plaIxbfrB6ez/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQywR-00000005Xj3-35UY;
	Wed, 11 Nov 2026 03:24:07 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQywN-00000005XfF-0dgp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 03:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794367441; x=1794626641;
	bh=0P2VV1oALOP/3gmFL87eTvjlTzFKQUaWGHBRZ3suqaQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sXl6Ca3BJ9dUwcv9XKERie1ur21D2I+R7/jLiIire0v4jz94N9xKkpmbV1b8lgJ1C
	 CXkNHxXQpSWaMck0+AnNTKXX2uJ9dNj93hmQbOKZOOctAOGpidmgKTcyy+NhArS2s+
	 l7WcDv/b7PkAqjKwj1edYX59Ut1IfAfA3VAvj4lyyTRdSjsgdVgojIcZEGTsrC7L0O
	 aordiuNL98xNSlPVdkfbxOkdxQfcxCA+2jXBtDZgTBaB4AG67UQYty23wcIphIpxhk
	 7ZnIJatD/KMBeeMyuRKiRmMP8QCTsOJ1vlmCO2D7SNFnslld8+Q2EWKBD4cGWwxgNL
	 wCVeTfhhELVeA==
Date: Wed, 11 Nov 2026 03:23:55 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>, stable@vger.kernel.org
Subject: [PATCH v2 3/3] phy: exynos5-usbdrd: fix HS phy init count imbalance on Exynos2200
Message-ID: <20261111032309.3365794-4-soheyb_boulaa@proton.me>
In-Reply-To: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
References: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: 5d696f9f01aced19a70b4608e0bcbfc155d0b32a
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_192403_348683_3F21157D 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

exynos2200_usbdrd_utmi_init() calls phy_init() on the high-speed phy,
but exynos2200_usbdrd_phy_exit() never calls phy_exit() on it. The init
count of the high-speed phy therefore never drops back to zero: after
the first init, every later phy_init() of it returns early, and its
clocks and supplies stay enabled across an exit of the UTMI phy.

When the high-speed phy loses power while the controller is suspended,
it is thus not set up again on resume, and the DWC3 core soft reset
times out:

  dwc3 11210000.usb: DWC3 controller soft reset failed

Exit the high-speed phy when the UTMI phy exits, last, once the rest of
the exit has succeeded: the phy core counts a failed exit as no exit,
so the high-speed phy has to stay initialized along with the UTMI phy.

Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm co=
ntroller")
Cc: stable@vger.kernel.org
Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
---
v2: the high-speed phy exits last, once the rest of the exit has
succeeded, after Sashiko's review of v1; v1 exited it first. The comment
is dropped, after Ivaylo's review of v1. His Acked-by of v1 is left
out, since the exit has moved.

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung=
/phy-exynos5-usbdrd.c
index cf0597a..041a555 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1510,8 +1510,15 @@ static int exynos2200_usbdrd_phy_exit(struct phy *ph=
y)
 =09clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
=20
 =09exynos5_usbdrd_phy_isol(inst, true);
-=09return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
-=09=09=09=09      phy_drd->regulators);
+=09ret =3D regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+=09=09=09=09     phy_drd->regulators);
+=09if (ret)
+=09=09return ret;
+
+=09if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
+=09=09return phy_exit(phy_drd->hs_phy);
+
+=09return 0;
 }
=20
 static const struct phy_ops exynos2200_usbdrd_phy_ops =3D {
--=20
2.56.0



