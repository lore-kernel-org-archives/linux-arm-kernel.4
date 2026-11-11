Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A11606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=itJqVWAb;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NFsfLl7a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kuGszS9Lfrf5RfF4V1hI8Xte0k/ziHqDGXb0U45lOag=; b=itJqVWAbtijz8g
	TIwupYdd+Zaj95CHOPNlpO3HhOxMoct1sXL2S4mAxTuRALiOPMR4ZlKJa6QKlM/zbl/ZLp55ltHKc
	9HFt1oaCGRGzq25iZgVRp3b5cTtGN6q3+ISqPiVwNlhxrF1OLm2YP+3+gKjAFZoWVdFhxRBSMEeeK
	424BHkeGKoSMwY7h2KtP3fV9hfBI/eQEB6PoCdwMcoaXl9uRj5wqjJte7hLom0jlKfveDpGJ7jGNV
	jUTD1NW1dPooeREwxs2eUZ4PTJa5DWTtbxAfV05z48vq6zBy1Kz5zRTJkXHqu8XxthC3MAhHGgQYo
	HWl50aoQ5eb1C2bCqm3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQywJ-00000005XdU-0E7i;
	Wed, 11 Nov 2026 03:23:59 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQywG-00000005Xag-3SnL;
	Wed, 11 Nov 2026 03:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794367431; x=1794626631;
	bh=kuGszS9Lfrf5RfF4V1hI8Xte0k/ziHqDGXb0U45lOag=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NFsfLl7aVQ4cR5Ieenrw4HvqnfXE158VrpFlHlYih5YhoMb83sjl+FckAyRAStgT7
	 vTaYE9doV4ckhIEa/vzNT5cDyOVTEyYfjNh+Vhg3We1PHtu/1NrWUq5o8FxnP1jDnN
	 K1uxjQUkKj1QwgGOidw5dmczWjWMa/i/cIQCXmdwNu5TWa8tiMykFv1mpAlkDzTZip
	 kX2vEUYcGIJ13BKXx6LSNwbAcIC+7NbLyCgv70LkUS33ACafCs44pPTjFIUO1qSo6e
	 oHsfCI8xVZza5h3rg3nYVxONKh4uCL8lW4d9QRUWaY+2PNWM/cdwpJVv2fsxz/gnl+
	 Y/73vkj4l/ghg==
Date: Wed, 11 Nov 2026 03:23:48 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>, Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 2/3] phy: exynos5-usbdrd: return the Exynos2200 high-speed phy init error
Message-ID: <20261111032309.3365794-3-soheyb_boulaa@proton.me>
In-Reply-To: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
References: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: d855c3b8805661db49d988325c6216cccc83caf4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_192357_016030_BD0D000F 
X-CRM114-Status: UNSURE (   8.75  )
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

exynos2200_usbdrd_utmi_init() ignores the result of phy_init() on the
high-speed phy and returns 0. When the high-speed phy fails to
initialize, the UTMI phy thus counts as initialized, and the controller
goes on with a high-speed phy that is not set up.

Return the result of phy_init(), so that a failed init of the
high-speed phy fails the init of the UTMI phy. The next patch, which
exits the high-speed phy with the UTMI phy, relies on it: an exit after
a failed init would otherwise take the init count of the high-speed
phy below zero.

Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm co=
ntroller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-205724@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
---
v2: new patch, after Sashiko's review of v1.

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung=
/phy-exynos5-usbdrd.c
index a6fe779..cf0597a 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1369,9 +1369,7 @@ static const struct phy_ops exynos7870_usbdrd_phy_ops=
 =3D {
 static int exynos2200_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 =09/* Configure non-Samsung IP PHY, responsible for UTMI */
-=09phy_init(phy_drd->hs_phy);
-
-=09return 0;
+=09return phy_init(phy_drd->hs_phy);
 }
=20
 static void exynos2200_usbdrd_link_init(struct exynos5_usbdrd_phy *phy_drd=
)
--=20
2.56.0



