Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B0606A880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UAOrU4+c;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEeci/xn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TOb078lsago8a0KkxFs3YjV+tnlupXKQCizlFrbKWzk=; b=UAOrU4+cGJwHvR6XwMwz+CiB3I
	S/4A4DprfcQuGIgLrJ1d87zQgroygHdWJb0EZHH06yQHiiTvNpz7Z0xt5Wc1l7yUCddzXPerEVEg7
	F7xb0Mwceva99gUQbmoJ81W3fMIrALPGH/Ld/CUeHyD7rGtlvD+iwtujBpvy9x1VOryelAxG8T7cb
	RlvUisGJM5cPzwUfWTGHCQrzlae5OinQUWpwSAm1BSyc+3WuD0gZnTmRraEgujuI1MZVVJNSi+gTD
	0zSSN90GmNVjRDY0bYyCP/6s+sL+s8WhcSayKJ8Bu4v2ouQJDublCUWz/EPQ/AALW3Bj6cA5YN4j+
	SyLhC9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupR-0000000DhOg-14OB;
	Fri, 13 Nov 2026 17:12:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupP-0000000DhOQ-3cTW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:12:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0747F628DD;
	Fri, 13 Nov 2026 17:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B4D1F000C8;
	Fri, 13 Nov 2026 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794589962;
	bh=TOb078lsago8a0KkxFs3YjV+tnlupXKQCizlFrbKWzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WEeci/xnaiuQGQByLuyrzwe58dxVS1MuSoI1GwT0W8JZy2Z2u9ty4Xwp5s+xxr0ET
	 X+m11IqFqy5T35F3VBzZsjS3YfAgAqRlPAzedW4Tbof64A/ANcNSD9IN44f/n3/1Q0
	 GTLzs2X2QcU+igqs+quFcVecM/mjKlLKr6ZR+WGdylsrkkEzICz61hWSxSDs6hu8SK
	 ICnyfXMkPPeiTPDF19gWYYp6ho+qJ1OxIt65CXweXmDLVItdmc/XV5v/VLwbPRgbg8
	 gq47i5xyEhq6K1y0Imhb2rBpZR6cFGBDJwGSvKj+X3SmLsQckO53yMvzDEBggDYIE5
	 /ROeRdUH2BllQ==
Date: Fri, 13 Nov 2026 17:12:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: add STM32MP21 regulator bindings
Message-ID: <20261113-crafty-quilt-2a9b9d3b0754@spud>
References: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
 <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gH/mmR2uiZkdhUOA"
Content-Disposition: inline
In-Reply-To: <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
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

--gH/mmR2uiZkdhUOA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:10:39PM +0100, Patrick Delaunay wrote:
> These bindings will be used for the SCMI voltage domain.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

I don't believe these are bindings at all. Where is your software that
is using it?
They're no more bindings that interrupt numbers are, since they're
defined by the firmware, rather than what binding headers are normally
for: inventing meaning for numbers so that we can have an ABI.
These numbers arent even fixed, changing the firmware can change what
regulator these IDs represent, although anyone who would do that should
probably be taken around back.

IMO, if you want these definitions for your dts, move the header to the
dts directory.
pw-bot: changes-requested

Thanks,
Conor.

> ---
>=20
>  .../regulator/st,stm32mp21-regulator.h        | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 include/dt-bindings/regulator/st,stm32mp21-regulator.h
>=20
> diff --git a/include/dt-bindings/regulator/st,stm32mp21-regulator.h b/inc=
lude/dt-bindings/regulator/st,stm32mp21-regulator.h
> new file mode 100644
> index 000000000000..fcafcfb6dc54
> --- /dev/null
> +++ b/include/dt-bindings/regulator/st,stm32mp21-regulator.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef __DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H
> +#define __DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H
> +
> +/* SCMI voltage domains identifiers */
> +
> +/* SOC Internal regulators */
> +#define VOLTD_SCMI_VDDIO1		0
> +#define VOLTD_SCMI_VDDIO2		1
> +#define VOLTD_SCMI_VDDIO3		2
> +#define VOLTD_SCMI_ADC			3
> +#define VOLTD_SCMI_VREFBUF		4
> +
> +/* STPMIC regulators (STPMIC25/STM32MP2L/STPMIC1L) */
> +#define VOLTD_SCMI_STPMIC_BUCK1		5
> +#define VOLTD_SCMI_STPMIC_BUCK2		6
> +#define VOLTD_SCMI_STPMIC_BUCK3		7
> +#define VOLTD_SCMI_STPMIC_BUCK4		8
> +#define VOLTD_SCMI_STPMIC_BUCK5		9
> +#define VOLTD_SCMI_STPMIC_BUCK6		10
> +#define VOLTD_SCMI_STPMIC_BUCK7		11
> +#define VOLTD_SCMI_STPMIC_LDO1		12
> +#define VOLTD_SCMI_STPMIC_LDO2		13
> +#define VOLTD_SCMI_STPMIC_LDO3		14
> +#define VOLTD_SCMI_STPMIC_LDO4		15
> +#define VOLTD_SCMI_STPMIC_LDO5		16
> +#define VOLTD_SCMI_STPMIC_LDO6		17
> +#define VOLTD_SCMI_STPMIC_LDO7		18
> +#define VOLTD_SCMI_STPMIC_LDO8		19
> +#define VOLTD_SCMI_STPMIC_REFDDR	20
> +#define VOLTD_SCMI_STPMIC_GPO1		21
> +#define VOLTD_SCMI_STPMIC_GPO2		22
> +#define VOLTD_SCMI_STPMIC_GPO3		23
> +#define VOLTD_SCMI_STPMIC_GPO4		24
> +#define VOLTD_SCMI_STPMIC_GPO5		25
> +
> +/* External regulators */
> +#define VOLTD_SCMI_REGU0		26
> +#define VOLTD_SCMI_REGU1		27
> +#define VOLTD_SCMI_REGU2		28
> +#define VOLTD_SCMI_REGU3		29
> +#define VOLTD_SCMI_REGU4		30
> +
> +#endif /*__DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H */
> --=20
> 2.43.0
>=20

--gH/mmR2uiZkdhUOA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdFBgAKCRB4tDGHoIJi
0o0zAQD/HtnpN/mSs+nWUOkbzquwYOk2tL/upMS4luxmfuwosQEA+GeFByT7n+/b
u4Ur3KYnuJMGSdV9lRadXirqfBgwJAs=
=kOMh
-----END PGP SIGNATURE-----

--gH/mmR2uiZkdhUOA--

