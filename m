Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tzMP/qvs;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=w4s3brv45bb4vpv2oglioynaxe.protonmail2 header.b=LOMHU3ID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9lockZfiZPq35Rqgx+UZNXxzny62IZytp1+NEi8Zxc8=; b=tzMP/qvsgxftxRQZqcWKFuHUIj
	q+ywlz55ZEsk/O35X9UOH9qSf4ujaK5ZHnbm2szM66WgdLbKx2ISj0S/pm0EUWuXKe71VdE5NAcxN
	EjxLH0ncJpwgUNhyeusQrUOAjwEoeQTygYGMq9efCgqS7vjwl3s+12JTDkzJg9UClC4AxlBPE7I2l
	IphzWrfdkFO47cKQq/Kd5r/IgSDeVyx2GzOwju7Q7tW2ZsW/C5QYJzIbFx/++8Y6cD3aaR66AELD3
	w2mhW6bbnvJguXv816kS4Rk9PRWOjESszX5Jni3V9XyGsWr+558ZY6HbYYbqBHKeKzV267jQkaZ5A
	zijCaEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS7Ux-0000000FXSG-25rv;
	Sat, 14 Nov 2026 06:44:27 +0000
Received: from mail-244123.protonmail.ch ([109.224.244.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS7Ut-0000000FXRE-20lq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 06:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=w4s3brv45bb4vpv2oglioynaxe.protonmail2; t=1794638659;
	x=1794897859; bh=9lockZfiZPq35Rqgx+UZNXxzny62IZytp1+NEi8Zxc8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LOMHU3ID8CgrIuaL3663yRwaNLjXWrQYpeoryiXWfQh2ZVAsL1nWT7pSoIa9CTWBM
	 fKqPlKPztZFTCJENrmViYsAYp9J/8iI26r5LWDP6akb8OlukY+wHIpuMwA6q8d8yUc
	 D/ueb540JUpgEjAZEiH85/IueldzC+h95SyfOECG9XuDaKM230L3e5aK6NiHOSryjM
	 /UGTwaLpjUz6WuDhsP2sDxWsbnLRpE2m/WQyHCgo64n+yAN+tkZkXkvbeZWOjlDmzw
	 wpTyD4gc5BBItlWLyXjRDXCEyPrBlyaB84K3xcSChQ1OxecdXGSuLDSwzWxn9ypzac
	 UdBUzESzDdtLg==
Date: Sat, 14 Nov 2026 06:44:15 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb Boulaa <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb Boulaa <soheyb_boulaa@proton.me>
Subject: [PATCH v3 0/3] phy: exynos5-usbdrd: fix HS phy init count on Exynos2200
Message-ID: <20261114064400.45572-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: 1c2bb9a36e534ba52fb78d90e0df16364b079c84
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_224424_162803_01B4D806 
X-CRM114-Status: UNSURE (   7.87  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The UTMI phy of Exynos2200 initializes the high-speed (eUSB2) phy but
never exits it, so the high-speed phy is not set up again after it lost
power in system sleep (patch 3, v1 [1]).

Sashiko's review of v1 [2] found two error paths that v1 leaves wrong: a
failed init of the high-speed phy is ignored, so the exit that follows
takes its init count below zero; and the high-speed phy exits before
the steps of the UTMI exit that can fail, so a failed exit leaves the
UTMI phy initialized and the high-speed phy not. Patch 2 returns the
init error, and patch 3 exits the high-speed phy last. Patch 1 undoes
the UTMI init when it fails, which its clocks path already lacks and
which patch 2 makes reachable from the high-speed phy.

Changes in v3:
- full name in From and Signed-off-by, as Vinod asked [3]; no code
  change
- Link to v2: https://lore.kernel.org/all/20261111032309.3365794-1-soheyb_b=
oulaa@proton.me/

Changes in v2:
- patch 1, new: undo the init on failure
- patch 2, new: return the init error of the high-speed phy
- patch 3: exit the high-speed phy last, once the rest of the exit has
  succeeded; drop the comment (Ivaylo); his Acked-by of v1 is left
  out, since the exit has moved

Tested on a Google Pixel 9 (Tensor G4), an out-of-tree port on 7.3-rc7
that uses the Exynos2200 phy ops and powers USB off in system sleep:
USB comes back after each sleep, and with each error path forced by a
test-only switch, both init counts stay balanced. Not tested on
Exynos2200 hardware, nor built in linux-phy next as a whole.

[1] https://lore.kernel.org/all/20261109221522.2796426-1-soheyb_boulaa@prot=
on.me/
[2] https://lore.kernel.org/linux-phy/sashiko-outbox-205724@kernel.org/
[3] https://lore.kernel.org/linux-phy/avcPwEEAfCstmORh@parshuram/

Soheyb Boulaa (3):
  phy: exynos5-usbdrd: power the Exynos2200 phy down when its init fails
  phy: exynos5-usbdrd: return the Exynos2200 high-speed phy init error
  phy: exynos5-usbdrd: fix HS phy init count imbalance on Exynos2200

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 28 +++++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f

--=20
2.56.0


