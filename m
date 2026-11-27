Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02253606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=acSLDB3z;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fnizvGli
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+37UfqKqX+TJbR+xq7UVWHeaqVYwEZPU+usFmpTGwuo=; b=acSLDB3z305hwZQbW9CWXk8Rhm
	mpFCgxbmnYgYVoSLpfQorokeIAeT7XLeaFK7dqUq2LcVVCcQPKF/HWYKnLLNmjqIkknAqXayZRQ9A
	+xkZ7utnydmCsC2WMXGcxzeVnD4V6vyizRGanaePdUV4sqSgjq5QHPQLCdnHetd1S/QJ8+VhMcVww
	8d7rr9KIHL3zsRzCQfvFFpN2yiWmIiLkv5eIv6D0CGyNEMKSpP1x7y8Osp1REk4x9cVSj7prdcZW6
	CeFRneyFaK7pbS9AuRu5vJKfULU9DGrzElIrGiT8988JaDYmSL/i5I/22EUA1JuWT79/hXHa4xOFD
	g72i5lrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtqz-0000000FkUk-1pJf;
	Fri, 27 Nov 2026 11:10:57 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtqv-0000000FkUJ-2Op2;
	Fri, 27 Nov 2026 11:10:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795777829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a8kmxRhuP5lxuxlojNXAIhQ1L+75cRsEbByPLn3ftBHMUj9oG9mTx7PArvI5a+ZS6iWDmDyu4JpuvZkCC6p54iVlkOLudBQAYIPpQdCQGpv75aE7/N2eiAV2OBpAA9mOVCCxGxfxQaHaAbw1hyNpfqwj2zjKpoDxnatTON/cHYw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795777829; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+37UfqKqX+TJbR+xq7UVWHeaqVYwEZPU+usFmpTGwuo=; 
	b=PWuZco1L4rVObSyiC+jWQeRLyLZONNIywFAOSO76as126ZRJ/eE+MqdPExL73bPaVbSOQyLRCdZVsvEudybloNDqRCpowUMVSihqQkv9KTDVzOG9UQgpqgZ8jdCBhQ+y/vsH147LXvWOnZrYW2qfsN9NKw0fX1+eUr8vVaNUW4A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=fnizvGliRm6udOM5RoPw6WuI/I4rXFx18OTEGxxtyOWVCNDKJYkD/l3zc4wfinBMONiA+k+XK6c6sg5vvgsto4mXqA4N6vbC6cTzt1te0TdSrfUyJX6LLVlTZwNEepk0cDFMw4x5G5d1CdgNv50MdxCgpKkF16VZJ9JN/2xyEOQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=+37UfqKqX+TJbR+xq7UVWHeaqVYwEZPU+usFmpTGwuo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795777826148667.3884646870919;
	Fri, 27 Nov 2026 03:10:26 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 94313180918; Fri, 27 Nov 2026 12:10:21 +0100 (CET)
Date: Fri, 27 Nov 2026 12:10:21 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 0/3] drm/rockchip: vop2: Add 8K support for RK3588 vop2
Message-ID: <awljo3X3KWpSovjx@venus>
References: <20261116084555.1061-1-kernel@airkyi.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xz5roaz37kmfattc"
Content-Disposition: inline
In-Reply-To: <20261116084555.1061-1-kernel@airkyi.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.7.7.1.5.4/294.473.96
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_031053_643394_8028D240 
X-CRM114-Status: GOOD (  25.80  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--xz5roaz37kmfattc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/3] drm/rockchip: vop2: Add 8K support for RK3588 vop2
MIME-Version: 1.0

Hi,

On Mon, Nov 16, 2026 at 04:45:52PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> This series adds support for 8K output on the RK3588 VOP2. HDMI is not
> ready yet, but I believe many people might be interested in this.
>=20
> 8K output on the RK3588 is done by splicing two VPs together, with VP0
> outputting the left half of the screen and VP1 the right half. In
> addition, 8K planes have to be split in half as well to stay within the
> width limit of a single plane. Similarly, there are a few post-processing
> details that need to be handled.
>=20
> Note that splice mode is not only usable for 8K output. This means the
> mode can be tested at 4K and even lower resolutions, by simply changing
> this one line:
>=20
> -#define VOP2_MAX_VP_OUTPUT_WIDTH    4096
> +#define VOP2_MAX_VP_OUTPUT_WIDTH    (3840 / 2) /* for 4K test */
>=20
> And yes, this has been tested at 4K over HDMI on the RK3588 EVB1 :)

I've done this test for 4K over USB-C DP AltMode (using my pending
patches to get that working in the first place) on the RK3588 EVB1
(I disabled the HDMI interfaces and routed USB-C to VP0) and it
works:

Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>=20
> Changes in v3:
> - Link to v2: https://lore.kernel.org/all/20261029081429.862-1-kernel@air=
kyi.com/
> - Cast the result of drm_format_info_min_pitc() to u32 to avoid 64bit div=
ision.
> - Rework the left-window splice check to avoid pulling an unrelated CRTC
>   into non-modeset commits, and use the new CRTC mode instead of the
>   stale splice_mode flag(Sashiko).
> - Reserve the splice partner window when the partner VP has no CRTC, so
>   it cannot be assigned as another VP's primary plane(Sashiko).
> - Only set the partner VP's CFG_DONE while the new state is in splice
>   mode; do not force it when leaving splice mode(Sashiko).
> - Program the main and splice video ports in a single layer-mixer pass,
>   and apply the YUV overlay mode to both VPs(Sashiko).
>=20
> Changes in v2:
> - Link to v1: https://lore.kernel.org/all/20261022071737.508-1-kernel@air=
kyi.com/
> - Missing removal of the replaced line(Heiko).
> - vop2_win_get_pstate(): use the left window's state only in splice mode(=
Sashiko).
> - Reject splice windows already in use by another CRTC(Sashiko).
> - Check the splice partner via drm_atomic_get_crtc_state() instead of the=
 runtime flag and unlocked read(Sashiko).
> - Set splice_mode_right/left_vp before the error paths of vop2_crtc_atomi=
c_enable()(Sashiko).
> - Validate each split half against the min width 4 and max input width; a=
lign NV20/NV30 like NV15(Sashiko).
> - Latch overlay registers at the left VP's vsync; don't wait for the part=
ner's own cfg-done(Sashiko).
> - Program the color key on the window actually being updated(Sashiko).
>=20
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Chaoyi Chen (3):
>   drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
>   drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
>   drm/rockchip: vop2: Support 8K output by splicing two video ports
>=20
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |   5 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 579 +++++++++++++++++--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  66 ++-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 370 ++++++++----
>  4 files changed, 857 insertions(+), 163 deletions(-)
>=20
> --=20
> 2.53.0
>=20

--xz5roaz37kmfattc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsJZRgACgkQ2O7X88g7
+pqU3Q//R1kUfPIEKaFvN9LmvJDBrOItlO/k7Nwle8vs14eDYVet8bkNUiE5T2mJ
PLBSzoc0w9KM1+wGCNzlysIH89dh8o8RZzQPpg+6v+D4TRijTLAuhfA11r6SfVkm
wtcag4MCwgcMTcVxf7V1bT34sum/Kxnpg4rPw7GpAb3CD0Mu+c0BbWig+ndNp7QS
iXSi9PECwLWP5o2YSY/GdV6dXy2B74QofXUJmw9ve31fNyNQDI8mj4AyObHgSPbV
Dk0p9SGCij1ImqyESt8jeMM2sgAspQbKJs2nKxvY6C2L1yzK9zuPbIaooPwTKNfl
IyJ+c+6rcMWltQRTFkWaNiiWIDPkUxDki2qit3rju8FSxDe5yM3jZTVbTDOYECVA
e2ysSTjqk9EPMPcpE3UbTJ4w4TVNErIz6vrCmjTpJ67da4kV5iTiBpX1QRRT6poj
wrWR45O+HzASyAdGbeAjDoibZnrGMBSXSXQl+2VPR2RV6irK8faUn+owW/UvHnxr
OUinP9Ek67fNCpr7y15V+hBUihSI79IOBK3IR5XAt3l2gFTN39NMiif9UZkX9lDZ
M6SoADc/lYTfmbScC4QpPQxuMoYuV4IEhcUEC3Jnyp/BPmJ36dY3lll4xac1SESA
AtW3pXF1WiPxGoY2Ndb5iJ0tn18hzXC10qY56vp6esS/et7zcQg=
=cg/c
-----END PGP SIGNATURE-----

--xz5roaz37kmfattc--

