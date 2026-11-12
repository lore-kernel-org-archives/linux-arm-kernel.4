Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376B6606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QDdaNHM7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dov5eEhJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f/K/dT4G7j/2V0oqueVsADMWh93CbLx6C63d9vDA5x8=; b=QDdaNHM7S/E08rz/epIrQRh+ZT
	m69q1zEqIZX4C6dnXjpTtZ1JRDAotk5ufc9SAC+I7SumGKEf14Sw++/nTfIn5ntkS5LK1mGlK6F52
	K3EXnGJIbtTjbl4N78lMPVyA+ty82ZF/+lxoc1luaxpGHNNWQFFtOsf8ibqjxwK3fUrbWWqvD6t96
	LTiVvuCwUpSd3S/ckCu03Q/Vlc8qzEbCCyPY/5NsXbfFWqkscqV88nqTq0bfZFoOTWpadajTokxM1
	QTUMlgWDE42Q6UAXWS/rO4XL3sAnEkbXbkr/vzuzeMFEMw4aKuTiiCVgjha1bZl7VlZOz6fP++NVS
	2IPdbfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPrS-000000091yG-3Yhc;
	Thu, 12 Nov 2026 08:08:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPrR-000000091y2-2UiI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0118643733
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84D91F00A07
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794470924;
	bh=f/K/dT4G7j/2V0oqueVsADMWh93CbLx6C63d9vDA5x8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Dov5eEhJPw9J1UHAeJgAmdh8myoy8L7sxELnUxlL/7fc3MfsnL3rY+pt0+8hcD/OX
	 NfKVKmZHCSPoyWy7mkKoLnoIxDvrxRcNuwJaJ9nUegaE+61xlN8qMxTFSaSlBvNVnM
	 gC8nuPC892qUwVuaHk/xtalK+nZ69SYCg9ic+yG4lnTAG2TEzmO6zRtZcNRgERsSEa
	 f4s1T3y4PWKuTZHs3r2JvaQZMdIEGarXDsPEIPQ2w+5RPQzKNCKE3W65gGTBhc8RhV
	 pZcgN21CCgADnpJFba1R4Eg+I1DPL3CxzqpVrpcroyk8Fpo0RI9VkvMLVOWn6sVHZh
	 DApu0rN2toQBg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so1109231fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 00:08:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGPuzFXxU53OXFftNoa+EOmBQDUOZkWwoPVsmLUMLJZYDKPiu6WuXTYN7++rl1F8srbooRlAfLk85kbI2Vll5wR@lists.infradead.org
X-Gm-Message-State: APuU4Z90l6Tcuar9VSA8zwy6MPXLABd45GfT7XHkEOXI8NHr0Zb079ah
	f7mbaY1rnA58MSkeljeIIR5iecbfz4vRey3r36A5FoFCjVGGILiv88wRSQdwIO4PAQ8ItEoDNFy
	9vt4hOG41UUPtJiD1469+rNgs5PWaaBY=
X-Received: by 2002:a05:651c:31cb:b0:3ac:ff0a:9d9f with SMTP id
 38308e7fff4ca-3ae1266bd28mr10702011fa.5.1794470923286; Thu, 12 Nov 2026
 00:08:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
 <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com>
In-Reply-To: <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 17:08:31 +0900
X-Gmail-Original-Message-ID: <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
X-Gm-Features: AclHuK-4Nt4Ya-T8NosoJJyqrIsgDGmHMB4Vbzc5kPzl1tQ_x9NWcs04d9vsDrI
Message-ID: <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 5:00=E2=80=AFPM Arun Iyengar <aiyengar1990@gmail.co=
m> wrote:
>
> Hi Chen-Yu,
>
> On Wed, Nov 11, 2026 at 02:35 UTC, Chen-Yu Tsai wrote:
> > Would this patch covering all HCDs be better?
> >
> > https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org=
/
> >
> > Also see Rob's comment about covering the port numbers.
>
> Yes, yours is better: it covers every host controller, and
> generic-ehci.yaml gets it through usb-hcd.yaml. Rob's point about the
> port numbers applies to my patch too.
>
> v2 drops this patch and builds on your patch 1 instead. Only the
> Orange Pi 5/5B DT patch, which now goes to the Rockchip tree on its
> own, needs it; that DT passes dtbs_check with your patch applied, and
> also with 'reg' limited to 1 and up as Rob suggested.
>
> The v2 cover has one question for you: patch 1 there looks the graph
> ports up by root hub port number, while you have said root hub graph
> ports should use the raw xHCI port number. Which one do you want?

I don't see a v2 yet. So that's patch 2 of v1.

It should definitely use the raw port number, since that is what is
supposed to be used in DT (and what is used in ACPI).

FWIW I'm also pushing a series to wire up USB on M.2 connectors [1].
That also has some code that does OF graph lookup. I still need to
push a v10. And I have a few other patches that fix up port lookup
in other bits of USB OF code.


ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org=
/

> Thanks,
> Arun
>
> On Tue, Nov 10, 2026 at 6:35=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
> > <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> > >
> > > From: Arun Iyengar <aiyengar1990@gmail.com>
> > >
> > > The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> > > always reach the same host controller. On the Rockchip RK3588, the
> > > SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> > > of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> > > which EHCI root hub port shares a connector with which SuperSpeed por=
t.
> > >
> > > The USB core already reads a hub's OF graph, with one graph port per
> > > downstream port, and uses it for the port connect type. Allow the sam=
e
> > > "ports" node on EHCI controllers, so that a root hub port can be link=
ed
> > > to its usb-connector node.
> > >
> > > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++=
++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml =
b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > index 908b02d9175e..9dcba539d60d 100644
> > > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > @@ -160,6 +160,19 @@ properties:
> > >        - host
> > >        - otg
> > >
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description:
> > > +      The root hub's downstream facing ports, linked to the connecto=
rs they
> > > +      are wired to. Needed when a connector's SuperSpeed lanes go to=
 a
> > > +      different host controller, which then pairs with the root hub =
port
> > > +      through the connector.
> > > +
> > > +    patternProperties:
> > > +      "^port@[1-9a-f][0-9a-f]*$":
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Root hub port, numbered from 1.
> > > +
> >
> > Would this patch covering all HCDs be better?
> >
> > https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org=
/
> >
> > Also see Rob's comment about covering the port numbers.
> >
> > ChenYu
> >
> > >  required:
> > >    - compatible
> > >    - reg
> > >
> > > --
> > > 2.55.0
> > >
> > >
> > >

