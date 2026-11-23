Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3dvLh+xS;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HSvYYxz4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XZB01VxXXHZ8JGUr/Kjr5B+9ghGqWLtm2u4oVk4hZ5A=; b=3dvLh+xSlUW8kk9OHTUQBeLWxZ
	G2gG4/IlUFjP7WxNF6RamYHhLDeN21uHBs1RZzKwvKUQOwrHQ8JGifl9u657tLH/Djrdg8BowLdaS
	YTCfjiEJK4nWUNPG4bcu3/H8HxJgyExpzkol7Avf6AdeIrNeHgAV/BXnGeGWxKAQNjz1z5dxvMDsU
	b9CeA8W0LhCjLLCgaG3DmOtywzLstq6oxFZJ3GMpe8ZInS9ZqS1tcNqg+QHQxM3ZUsqJr7yGJmjml
	HIpc1DT/T99o7CwddCBvGvtWKBCok8zu6x5+89lg1gkr5Tnd7KIn1jfNwKvXo05bzmH8NzcJsN42u
	YyQxF2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbjZ-00000004zls-0AER;
	Mon, 23 Nov 2026 21:37:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbjU-00000004zkL-0R5S;
	Mon, 23 Nov 2026 21:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795469867;
	bh=eqTz5I5hXDw/utCcHS4ZZHudHX0/EsrXro8Gc1lz+Ro=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HSvYYxz4hFHJFR/ULMOWK5fixWjJk8ihJMLLpTqi1mYhOy6TG6rGg3D1/NOgqSsTi
	 fZ2ZNH7LPyrS1+Pgdbl6FVtI1xAWwVsEBFbsRMEsWSwYJ+4tCmZKzgBPDyndmHvHBo
	 p3WMpS1d/1YQsnf1854UNB/KRzskp7MMD9G1Cg+l0z5BdABPu03LzZtNb/HfR9swnj
	 ooJIucIZFqjqiYMwyTqa/ro63A473ypL+boC7bKpb94t6GVIggS6dCKDjasj/h+jPB
	 yc9GJUFSRmNXnr+zDToQ6ZD/nK1ScW7MemSzYVIM3wswQFQ3gi6AKXIomaj7uMBwHZ
	 Os7BjdgPgsMHg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A349717E04F7;
	Mon, 23 Nov 2026 22:37:45 +0100 (CET)
Message-ID: <aa951ce0fd972085a4c9fb19a3c67e36ed90dc7f.camel@collabora.com>
Subject: Re: [PATCH v3 0/3] media: rockchip: Add the IEP2 deinterlacer of
 RK3568/RK3588
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp
 Zabel	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, Alex Bee
	 <knaerzche@gmail.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:37:43 -0500
In-Reply-To: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
References: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-FWklcH9hjr78QjddYyVY"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_133753_964210_FFF9EB63 
X-CRM114-Status: GOOD (  24.37  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-FWklcH9hjr78QjddYyVY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 11:30 +0000, Arun Iyengar via B4 Relay =
a =C3=A9crit=C2=A0:
> Add a V4L2 mem2mem driver for the IEP2 deinterlacer of the RK3568 and
> RK3588, with its binding and the RK3588 DT node. The V4L2 side follows
> Alex Bee's IEP driver.
>=20
> Tested on an Orange Pi 5 (RK3588S) with a 7.3-based kernel (KASAN,
> lockdep); build-tested on media next. v4l2-compliance 59/59, all four
> modes at 1080i without IOMMU faults, s2idle and deep suspend while
> streaming, unbind while streaming, forced watchdog and IOMMU fault
> resets. Not tested: RK3568. DMABUF imports of exactly the image size
> are refused, because of the 4 KiB OUTPUT padding (see 2/3).

What software makes use of this driver? Did you test in a real application?

>=20
> One case is still open: a reset during a transfer, seen only with
> forced watchdog resets, can leave the IOMMU busy. Jobs then fail
> without DMA and the driver suspends at once so that PD_VDPU powers
> off, which restores it. While another device of the domain, e.g. a
> video decoder, keeps it on, the jobs keep failing.

What do you mean by iommu busy? In the decoder, some errors would lead to t=
he
decoder core doing a self reset witch we believe wipes the MMU registers. C=
ould
the watchdog reset endup doing the same?

>=20
> Developed with Claude (Anthropic), which wrote the code and the commit
> messages. I reviewed every change.
>=20
> ---
> Changes in v3:
> - Drop the vendor kernel notes from the commit messages and cover (Krzysz=
tof)
> - 1/3: drop the linux-media list from the MAINTAINERS entry (Krzysztof)
> - 1/3: add Krzysztof's Reviewed-by
> - 2/3: start the job and its watchdog under irq_lock (Sashiko)
> - 2/3: soft-reset the core with the AXI side, CRU reset if the IOMMU
>   stays lost, shared IRQ off during a reset; no DMA until the IOMMU is
>   restored
> - 2/3: return OUTPUT buffers before CAPTURE buffers
> - 2/3: mask and clear all interrupts on completion and before a job
> - 2/3: suspend at once when the IOMMU is lost
> - 2/3: take the mutex in system suspend
> - Link to v2: https://patch.msgid.link/20261115-iep2-v2-0-3d8798cd9a55@gm=
ail.com
>=20
> ---
> Arun Iyengar (3):
>       media: dt-bindings: Add Rockchip IEP2 deinterlacer
>       media: rockchip: Add IEP2 deinterlacer driver
>       arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588
>=20
>  Documentation/admin-guide/media/rockchip-iep2.rst  |   32 +
>  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>  .../bindings/media/rockchip,rk3568-iep2.yaml       |   95 ++
>  MAINTAINERS                                        |    8 +
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   22 +
>  drivers/media/platform/rockchip/Kconfig            |    1 +
>  drivers/media/platform/rockchip/Makefile           |    1 +
>  drivers/media/platform/rockchip/iep2/Kconfig       |   16 +
>  drivers/media/platform/rockchip/iep2/Makefile      |    3 +
>  drivers/media/platform/rockchip/iep2/iep2-regs.h   |  191 +++
>  drivers/media/platform/rockchip/iep2/iep2.c        | 1320 ++++++++++++++=
++++++
>  drivers/media/platform/rockchip/iep2/iep2.h        |  108 ++
>  12 files changed, 1798 insertions(+)
> ---
> base-commit: ad6549a46748d00818483b535e5cd2a704685c98
> change-id: 20261110-iep2-b9a9c6e77c44
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20

--=-FWklcH9hjr78QjddYyVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawSyJwAKCRDZQZRRKWBy
9HpuAQD2iyW68QKwqexXSmR8w/lWArl2Njqs9To+Zvdg2jBNBAEA6vJcr0L5MZYS
Rnl6XvNw8L5b5ihSSaBSPLHj+IItZgE=
=1qmu
-----END PGP SIGNATURE-----

--=-FWklcH9hjr78QjddYyVY--

