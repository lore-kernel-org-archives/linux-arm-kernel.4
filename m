Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFAE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 22:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bDsHpDCG;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=nLWFZvSY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kE4syZx4j/5qX4L+2YVxHbOJsxFk3bQcYDZtlzgC2zA=; b=bDsHpDCGK83co89Si1IsqfcQAq
	jnwejM73gV4HGDVf0jtOg54CP0QO0GYBwQVxwx4am+oPoSijJ/d/7tTcMr7x1dUKraQniXYUV0cXB
	kwPkgT2DdVcgd5M+3Nek4tFe/aJjIJgPp90zTpkZVidO43kxVvC5OiB/H5OuACiBToNJJfLT5Tjx/
	IzQv0Bkf7HmMIKwJEtMyjikSvS66gkP7zRZXYBEQNgFmvgkDP20XUtSXvo/eRlEk/NiV80JKT6GBf
	KpY8FVgWYxp/1JZkX+PvJ6JlhdD6GQ9sOtdeVN0kIPzXpoVd4jC/q94Dgfq/pHdm0qpb659EmyNhz
	rMEy3DdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXey-00000001rXq-1UFV;
	Mon, 09 Nov 2026 22:16:16 +0000
Received: from mail-24416.protonmail.ch ([109.224.244.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXes-00000001rX8-3VIv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 22:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794262565; x=1794521765;
	bh=kE4syZx4j/5qX4L+2YVxHbOJsxFk3bQcYDZtlzgC2zA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nLWFZvSYE9lR2C9K/r8k0MTD19qXnddoMFxZKLIOatwKpWURP0sLdOB38Pow89wpS
	 UA4tJjDcc+9FZBvm5oGkRwLPrL5Zlb0uWg1Snqp53csXFY8tHH9PxfGfWzBZSFINW6
	 YdPF9X2TsTcQbIjQB81Q81+4K+89p780GR0Vi9kA4BSHzhDWCrXTxnxo3BhNNdQHVP
	 3QSSMdAdM6ccd1CYfytwB+k3qROci7ZZMVDabBn+cf7Q5zje2xisB/VuW72oxLXwrV
	 ogz08D4DKyNxlC0GXxF2NJObnVdO+/aZmZsZlasJS/c10IpI7Gt7NQzq7qJUsq7AZr
	 a1aZPYQaobvUw==
Date: Mon, 09 Nov 2026 22:15:59 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>, stable@vger.kernel.org
Subject: [PATCH] phy: exynos5-usbdrd: fix HS phy init count imbalance on Exynos2200
Message-ID: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: 5ec8a07a4fff850a81f2eff5aebc5744ac5da29e
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_141611_500520_4ABEB3D6 
X-CRM114-Status: UNSURE (   9.11  )
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

Exit the high-speed phy when the UTMI phy exits, first, in the reverse
order of the init.

Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm co=
ntroller")
Cc: stable@vger.kernel.org
Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
---
Tested on a Google Pixel 9 (Tensor G4) with an out-of-tree port that
uses the Exynos2200 phy ops and powers the USB block off in system
sleep: without this change the soft reset failed on the first resume;
with it, USB came back after each of two system sleeps. Not tested on
Exynos2200 hardware.

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung=
/phy-exynos5-usbdrd.c
index 087d552..0bee928 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1486,6 +1486,13 @@ static int exynos2200_usbdrd_phy_exit(struct phy *ph=
y)
 =09u32 reg;
 =09int ret;
=20
+=09/*
+=09 * The UTMI init initializes the high-speed phy; exit it in turn, so
+=09 * that the next init sets it up again after it lost power.
+=09 */
+=09if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
+=09=09phy_exit(phy_drd->hs_phy);
+
 =09ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clk=
s);
 =09if (ret)
 =09=09return ret;
--=20
2.56.0



