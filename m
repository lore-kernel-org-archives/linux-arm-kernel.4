Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D723606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XsPQt3nr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8aiKsfU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+XR2h4+8MvQvTi2bbS1fy0AZgCh4x2fH03iocJkrhEU=; b=XsPQt3nrYEefUA1WASyIkdS8PP
	tHgVPvBS9D/AJrnI3X3h0J9XPJOs01yH2ZAFA/k+2fjbJhC2uNgtm5/OVIqdUooAaNBIiWylKWiNl
	cBjo3oDodTTJ6DQ5ZFbsEO+KSgtdePWv+aPzcjxdBme0ZHMFtKZqwYqJ+ZI9H5xD7AMOXNdQw1IIk
	y7KpGiEotduKCJyOknqBl+c1UNa9r7Ri26aiOfOR0LYhy7eTeInOZE1P8l09rUEmhY5B7v1tnLx1x
	XWWN3VanJDyb/Qkcq5IY72mSqxcEj+dZXz7/FxIfZ8Ojz/RGb5igJtko/QT3XQ8IqvbMDYCJO+Hm3
	lugjcCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT11k-00000003U9w-265a;
	Mon, 16 Nov 2026 18:02:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT11i-00000003U9K-2dYt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:01:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1826D62811;
	Mon, 16 Nov 2026 18:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149591F000C4;
	Mon, 16 Nov 2026 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852117;
	bh=+XR2h4+8MvQvTi2bbS1fy0AZgCh4x2fH03iocJkrhEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K8aiKsfUiwV6W8NFIhhRnf4nXHDK2FmTbeymQ3YANrTcOZaZCriRgN/sYFQpw9M06
	 xacSg0WwUHYi9Oph9u+d7/RLc9oap7rVK4E1GB/vJ5aVbe3FaF5s2Fbxu3sOWK3R51
	 CtUnsdtldixalUldHdct+nfRLZx/ibE8gjv68QwRhfLoHmOh2Wgd+rCFF22wxoxkVU
	 8OCGkkNOAXx0j0qJP3NTx47dFEv1UG3UvWHjb49MADEdfMwS5kJbO5kEAs5MTlS+JF
	 BgFzUp0gbxNiwRr9MSsVYQoyXLIsS9+D+NTvVWLPm1HGd/FbAwUJgCUO6H12ozJjIe
	 XdpOneQMPzuVg==
Date: Mon, 16 Nov 2026 18:01:53 +0000
From: Conor Dooley <conor@kernel.org>
To: VAMSHI GAJJELA <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
Message-ID: <20261116-compactly-unvocal-9d06dfb6beac@spud>
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-3-vamshigajjela@google.com>
 <20261103-handiwork-replace-25efd6b3d8be@spud>
 <CAMTSyjrYSzb57w9G6a+JVaZzRHBBV6zaW_Br_UcM7C5REWLgVw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+DjIXKjG01bnUhT1"
Content-Disposition: inline
In-Reply-To: <CAMTSyjrYSzb57w9G6a+JVaZzRHBBV6zaW_Br_UcM7C5REWLgVw@mail.gmail.com>
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

--+DjIXKjG01bnUhT1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:13:27PM +0530, VAMSHI GAJJELA wrote:
> On Tue, Nov 3, 2026 at 11:47=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Nov 03, 2026 at 09:56:06AM +0530, vamshi gajjela wrote:
> > > From: Vamshi Gajjela <vamshigajjela@google.com>
> > >
> > > Document the device tree bindings for the SmartDV IP Solutions MIPI S=
PMI
> > > master controller ("smartdv,spmi").
> > >
> > > This controller IP is integrated in Google Tensor SoCs starting with =
the
> > > G5 generation (codename: laguna, canonically written as "lga"), so add
> > > "google,lga-spmi" with a fallback to "smartdv,spmi".
> > >
> > > Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> > > ---
> > >  .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++=
++
> > >  MAINTAINERS                                   |   6 +
> > >  2 files changed, 132 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,sp=
mi.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml=
 b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > > new file mode 100644
> > > index 000000000000..e0512e60d932
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > > @@ -0,0 +1,126 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SmartDV IP Solutions SPMI Controller
> > > +
> > > +maintainers:
> > > +  - Vamshi Gajjela <vamshigajjela@google.com>
> > > +
> > > +description:
> > > +  SmartDV IP Solutions MIPI System Power Management Interface (SPMI)=
 master
> > > +  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
> > > +
> > > +allOf:
> > > +  - $ref: spmi.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: google,lga-spmi
> >
> > > +          - const: smartdv,spmi
> > > +      - const: smartdv,spmi
> >
> > I hate compatibles for purchasable IP like this, particularly when
> > unversioned as they maybe become effectively useless when a new revision
> > releases. The standalone smartdv,spmi compatible has to go at least,
> > soc-specific compatibles are mandatory.
>=20
> Agreed. In v2 I will drop "smartdv,spmi" (both standalone and as a
> fallback) and use only the SoC-specific "google,lga-spmi" compatible,
> renaming the binding to google,lga-spmi.yaml and dropping patch 1/3.
>=20
> >
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description:
> > > +      Core clock to the controller from which SPMI SCL is derived. O=
ptional if
> > > +      the controller uses a free-running clock and clock-frequency i=
s specified.
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      Input core clock frequency in Hz when the controller uses a fr=
ee-running
> > > +      clock not described in clocks.
> > > +
> > > +  smartdv,master-arb-enable:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [0, 1]
> > > +    default: 0
> > > +    description:
> > > +      Enable master bus arbitration phase (0 =3D disable, 1 =3D enab=
le).
> >
> > What aspect of board design governs the decision here?
> > Why can it not be determined from the soc specific compatible?
>=20
> These parameters do not vary between boards on LGA (this applies
> to all smartdv,* properties below). In v2 I will drop all
> of them from the binding and move the LGA controller configuration into
> of_device_id match data in the driver keyed off "google,lga-spmi"

> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> >
> > I find it hard to believe that this is the set of required properties.
>=20
> Agreed. In v2 I will make clocks and resets required alongside compatible
> and reg, and drop the remaining optional properties.

Cool, changes sound good to me thank you.

--+DjIXKjG01bnUhT1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtFEAAKCRB4tDGHoIJi
0kVJAP0TSXDxm69dhcAV/E3QmoFCODoisMu3RIOqI+D65B3u9wEApMEcHNDnlJMp
eu5/qrXsZ/bwOxIvMRcG0FvGkeBsuw0=
=KYok
-----END PGP SIGNATURE-----

--+DjIXKjG01bnUhT1--

