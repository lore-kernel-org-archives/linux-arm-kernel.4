Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 04:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SUL0+dL+;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LU4wVOAW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hBFZyIMzTpRCClztXW2d7H8DbxXWA8BTfhf8v4D8rVo=; b=SUL0+dL+Q1b8WoEl8XPXyYZNY6
	9hPfYSIAm+wtb2d3WhVjMOj1Pl1Xbc9VY9UWwLIkNHxO7vO6dJsRoHH3Rour7PcYAfLVAQekuQZTZ
	gs3ksPQ8gQLggeowFa8O7vA08QDWtw2TCyuU5UNO90PIBJ0SF/47nraUgdQdrL8LUrUmzFWm9vQuQ
	4/zS9EMn1V3KhGrgQ+j44s/GC6u/l1T91pdI/Kmh1toDRkcbtgkcbzQV1FDDwI3T+nuhwbnt9zIxz
	l3O7hSsxhFL+i1FG+gQP4pbHnG7cytmuOHMgS+SiO/9F7t+pPttn+KuelUatUO+aVvUUlV6T/XKWj
	TSpgIWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmeX-0000000ErxA-3mef;
	Fri, 27 Nov 2026 03:29:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmeT-0000000ErwU-3x4X;
	Fri, 27 Nov 2026 03:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795750169;
	bh=6hgTPZ4zy0eISHNyVPO+zkIjKtXrw/0PSMG7EQRo1SE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LU4wVOAWnPKkeebBDv587cHKEP/uG+yyEJOIQrZ/KK0ctY2Nn/SKtC4Q9QxGoU74v
	 sRoc2XDxgbRGgiz+03OablSFVT92/FVhb21rpwbJ/Yj9BMkjwStjouTU/0cL9IBr2c
	 FRDUHyDqPW+8kRa9Y4Zn7szzwvE5txv1iTPR4DPFbznroeOwSLcI2lUvnq9MTrjC+3
	 wDS9QBkCsF5RVDem3PNmt+Jp80VWxqwJNm3e3ltoTTIfIiILqe3sKY3V/oT5ErVgJ3
	 noHe8Qhq5rxfaZk1DT68Qs7/9JSQqH4xhaCVyU/gJV97OFEztjstXZ8/q0+L56o51G
	 p18WuL1LYolHw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D54D17E02F2;
	Fri, 27 Nov 2026 04:29:27 +0100 (CET)
Message-ID: <4cfa6a26c53daa3ab188c1cf8251888d176c0045.camel@collabora.com>
Subject: Re: [PATCH v4 0/5] media: Add fdinfo support for v4l2 drivers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner	 <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>
Date: Thu, 26 Nov 2026 22:29:26 -0500
In-Reply-To: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
References: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VcyGQLmGUJ6o2ePG/wFB"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_192934_248806_C44C2785 
X-CRM114-Status: GOOD (  28.24  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-VcyGQLmGUJ6o2ePG/wFB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Detlev,

This series have sufficient valid sashiko report to be worth making a v5.

Nicolas

Le mercredi 25 novembre 2026 =C3=A0 10:11 -0500, Detlev Casanova a =C3=A9cr=
it=C2=A0:
> fdinfo is useful to poll information from the driver.
> Unlike the ftrace interface, it lets userspace tools get a snapshot of
> the state of the driver at their own pace, instead of getting events for
> each driver status change.
>=20
> This works better to get information like HW usage time or clock
> frequencies, as well as memory usage.
> This patch set focuses on mem2mem drivers that are per-frame based and
> an implementation is proposed for the Verisilicon Hantro and Rockchip
> rkvdec drivers, limited to main clock frequency and HW usage time, as
> well as HW cycles counting in Hantro.
>=20
> Even though it is not used yet, per core fields are appended with=20
> `-<core_id>` to support multi-core drivers.
>=20
> To ease support in drivers, a v4l2_metrics struct is added.
> It stores metrics information and provides helper functions to write
> the fdinfo file in a standard way.
>=20
> An example of usage of this from userspace is implemented in v4l2top:
>=20
> https://github.com/cazou/v4l2top (Check the upstream branch)
>=20
> checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
> definition are kept unnamed to match with the rest of the struct
> definition.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> Changes in v4:
> - Rebase on master branch
> - Add missing documenation fields
> - Fix missing indentation spaces
> - Link to v3: https://patch.msgid.link/20260706-v4l2-add-fdinfo-v3-0-d556=
568cf38e@collabora.com
>=20
> Changes in v3:
> - Rename the fdinfo key prefix from "media-" to "v4l2-", and "stats" to
>   "metrics"
> - Restructure the documentation to have mandatory and optional keys
> - Add core ID to fields
> - Add HW cycles count support
> - Add ABI documentation
> - Link to v2: https://patch.msgid.link/20260617-v4l2-add-fdinfo-v2-0-d298=
e98ce06a@collabora.com
>=20
> Changes in v2:
> - Simplify key/value pairs by removing repeated <eng> suffix
> - Add media type support
> - Add v4l2_stats helpers
> - Add support in rkvdec too
> - Link to v1: https://patch.msgid.link/20260612-v4l2-add-fdinfo-v1-0-7232=
11abc861@collabora.com
>=20
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Detlev Casanova <detlev.casanova@collabora.com>
> To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: kernel@collabora.com
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
>=20
> ---
> Christopher Healy (2):
>       docs: media: add documentation for V4L2 driver usage metrics
>       media: hantro: Add per-context fdinfo usage metrics
>=20
> Detlev Casanova (3):
>       media: v4l2: Add callback for show_fdinfo
>       media: v4l2-core: Add v4l2-metrics interface
>       media: rkvdec: Add per-context fdinfo usage metrics
>=20
>  Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129 +++++++++++++++=
++++
>  .../userspace-api/media/drivers/index.rst          |   1 +
>  .../media/drivers/v4l2-usage-metrics.rst           | 137 +++++++++++++++=
++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  19 +++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   1 +
>  drivers/media/platform/verisilicon/hantro.h        |   4 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |  19 +++
>  drivers/media/platform/verisilicon/hantro_hw.h     |   1 +
>  .../platform/verisilicon/rockchip_vpu981_regs.h    |   1 +
>  .../media/platform/verisilicon/rockchip_vpu_hw.c   |   6 +
>  drivers/media/v4l2-core/Makefile                   |   2 +-
>  drivers/media/v4l2-core/v4l2-dev.c                 |  12 ++
>  drivers/media/v4l2-core/v4l2-fh.c                  |   3 +
>  drivers/media/v4l2-core/v4l2-metrics.c             |  78 ++++++++++++
>  include/media/v4l2-dev.h                           |   2 +
>  include/media/v4l2-fh.h                            |   3 +
>  include/media/v4l2-metrics.h                       |  47 +++++++
>  17 files changed, 464 insertions(+), 1 deletion(-)
> ---
> base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
> change-id: 20260610-v4l2-add-fdinfo-a790fceab329
>=20
> Best regards,
> -- =20
> Detlev Casanova <detlev.casanova@collabora.com>
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-VcyGQLmGUJ6o2ePG/wFB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawj5FgAKCRDZQZRRKWBy
9J18AQDp3IR3pfQcKcnw6xF/dT5LdRqqiaES0m1nfecWo2kNDQD+PU71pmZPqO7l
9h7qqg6hjHADUqOEf75xVTKCdu68FQU=
=mSs1
-----END PGP SIGNATURE-----

--=-VcyGQLmGUJ6o2ePG/wFB--

