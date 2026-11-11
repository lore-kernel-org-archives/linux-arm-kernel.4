Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1219606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CjBcZS+t;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=XeJtmV8N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8D935cCybZcKPmLSQDzuIWE83ffg1Yvgg9sYd3csxZM=; b=CjBcZS+tWPIx/h
	IHO3+Z1Yfj1RWJVFE3FAs/FfEG/kXjdtzSw0SWUqUQUzftDfdF99EEUtBxR4Lh6ClVkRSjnI2H8ol
	VPRyZirE9pSvrvNf6NDo5ulj5rgQjjlCnS5DO/rPqGy9xsm9OY6cO4YmVSfUJgKA+16ciYzUVaawQ
	LYBolEjEQ6kQk+WARMleK1LjPiMJzHrU+AejLMcW2X+B9DbKQXwXSXie7ZGyxFm+h3tdE3hjUnIQy
	PUbH4vQ78NDzIZC2ynd2teHq750a7gAXlBVqVilMI25bv5LdMwLbobShAfms2IlQMwccGVRZbysBl
	aB3M6eTgC2ikR2w5Wnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyw1-00000005XUd-3DdF;
	Wed, 11 Nov 2026 03:23:41 +0000
Received: from mail-43100.protonmail.ch ([185.70.43.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyvz-00000005XTc-2I44;
	Wed, 11 Nov 2026 03:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794367417; x=1794626617;
	bh=8D935cCybZcKPmLSQDzuIWE83ffg1Yvgg9sYd3csxZM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XeJtmV8NBp5ph4zvL+nrMi8n1dx3ilMrS03XQWrw5GAZ4XtnNeC4jNsFgV5p7yuBW
	 iu54L3mnAUm0FBC7OeCp69xEELIDnF9QYWtpO40u57URraEUrGewOhPurUSrA8ea9f
	 IlBjqIPJponT+zVOpJB/sXOMK9f1vkJhQMTLSkldUVYcTlPiTXW/fMj2zTzTUZem9t
	 DmacdZhvtgsNULlCc5RBCnHoKwMq4twO2f4o56gKkhseBobtcR+tW6V+el4U6g+RD2
	 2bnLz56TMhtN0pTMKNvabFhElGTeGMAqSTERB9R21eYOmCLsi6R1ns34/LLGidMmYf
	 Zalk9RZIJn9DA==
Date: Wed, 11 Nov 2026 03:23:34 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>, stable@vger.kernel.org
Subject: [PATCH v2 1/3] phy: exynos5-usbdrd: power the Exynos2200 phy down when its init fails
Message-ID: <20261111032309.3365794-2-soheyb_boulaa@proton.me>
In-Reply-To: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
References: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: a639c261283024b524429f862b345c132fd67912
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_192339_737643_C539B629 
X-CRM114-Status: UNSURE (   9.12  )
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

exynos2200_usbdrd_phy_init() enables the regulators of the UTMI phy and
takes the phy out of isolation in the PMU before it enables the clocks.
When clk_bulk_prepare_enable() fails, it returns without undoing
either. The phy core does not count a failed init, so no exit undoes
them later: the phy stays out of isolation, and its supplies stay
enabled, until an init and an exit succeed.

Isolate the phy again and disable the UTMI regulators when the clocks
or the phy-specific init fail. The phy-specific init does not fail yet;
the next patch makes the UTMI init return the result of the init of the
high-speed phy.

Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm co=
ntroller")
Cc: stable@vger.kernel.org
Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
---
v2: new patch.

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung=
/phy-exynos5-usbdrd.c
index 087d552..a6fe779 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1462,7 +1462,7 @@ static int exynos2200_usbdrd_phy_init(struct phy *phy=
)
=20
 =09ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clk=
s);
 =09if (ret)
-=09=09return ret;
+=09=09goto power_down;
=20
 =09/* Set up the link controller */
 =09exynos2200_usbdrd_link_init(phy_drd);
@@ -1475,6 +1475,17 @@ static int exynos2200_usbdrd_phy_init(struct phy *ph=
y)
=20
 =09clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
=20
+=09if (ret)
+=09=09goto power_down;
+
+=09return 0;
+
+power_down:
+=09exynos5_usbdrd_phy_isol(inst, true);
+=09if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
+=09=09regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+=09=09=09=09       phy_drd->regulators);
+
 =09return ret;
 }
=20
--=20
2.56.0



