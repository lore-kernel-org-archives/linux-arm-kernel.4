Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A19606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 00:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KwBzRocf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEtJ0Z3R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rYwFnnQpoq8LFGaav+MzPqD+Y6qhmYWK6HkRe9C2QeM=; b=KwBzRocfzNge2J
	75uPKzAaNLouTAAa1OWWe9QmbLPtuAmq/bOWC52yfB2dqK+5E4KaUmSte12gX1Zig1uyssJACQEze
	f6iHaNN9rtqusJzBFZVkn8OMurRwvuiidSYLrJOIaoukFgWNlk5jFmcZIoHctXaE1vs1GcUisCvRc
	ar30LrmrhkHcw/vjSDbYLdXaPDzJzhkoFLU+dAVddImtHOZUhTSyiG67xGxHACZkVigEX27/fGoBM
	WCJCgn5Xv4xIZkXFGp3QXX0bs79xWyRJRhLh5yOC0Be026Ar3FQyOK5iLtI+PFcfiyZersWQDE0Pn
	aqGIEEyEhuar3ksVqiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUv3E-00000000Yo5-2e4U;
	Sun, 22 Nov 2026 00:03:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUv38-00000000Yne-45KG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 00:03:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BA876120F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BE51F000D4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305797;
	bh=rYwFnnQpoq8LFGaav+MzPqD+Y6qhmYWK6HkRe9C2QeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VEtJ0Z3RFtXNNE2efuwBF9CxDfb5B95yqKPcNQxO+t6NQf2t7QVUT+e83OzRKAMas
	 Et0FX6zr/HpTXZ5u0nCFgtAJcbM3xmt+CdbOTavu7JuGUwlLBBCzSXWSBMUHF60mot
	 W1ZNteOFWWRkKFzRoukBOv18VzqXbm1bdBQSQZ+YkPx6etZg5GiT4lxSLMQVjMSGJm
	 N93oZS9RYlL4Rhdrjy/c6vsZybDkDHQd4i/Kc7D6X/edXWGCsEA7YjMzk/e3TGl26A
	 yJFtqNMD3FGLZ8qKwWBx8sP5O3wXEbjRHI9lzpGMrneITPKqXsS1KiLBXvZ7Uf1BQ/
	 74VNAmNGVNzbg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so16923041fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 16:03:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGhCcTcE0M/vdJW4UizBZr8xFMnJlbDRj/y2//z+v+Icg5fDevYhcC+wG0UKKO9YBrKhc36HmGWWvqtBDgBuuG9@lists.infradead.org
X-Gm-Message-State: APuU4Z91mQMwFRetSKDtkdeR2lNJ0lyWPVxHRgXsNmCDzDnrmBHWYL2m
	TCDClP4t8EKvtDQJWA+xxNydHalyLh8p7n5RAEigwEygfI/Pb1KwGw0dcZatDB9Uya7QuWhQ8M1
	ExvyrbBdh6XIp9jr0IHsvdcVsImdDjfs=
X-Received: by 2002:a05:6512:238a:b0:5c1:4bd9:d696 with SMTP id
 2adb3069b0e04-5c1bc6803dfmr2119235e87.8.1795305796393; Sat, 21 Nov 2026
 16:03:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 01:03:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLmd=+v0c+zZwLVafR0aFRnt95weQ=_oaOaYdHUbXktvdA@mail.gmail.com>
X-Gm-Features: Aa3M54r3uff-3u27-GWxVyER9ELrI4OraGs3jCVFrFZTcTH5Wtzi-qad91fCkZY
Message-ID: <CAD++jLmd=+v0c+zZwLVafR0aFRnt95weQ=_oaOaYdHUbXktvdA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/15] Arm Core Local Accelerator Driver
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryan,

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> * Driver interaction with architectural support: I've opted to treat the =
CLA as
>   a device rather than a CPU extension, so it's implemented as a (mostly)
>   self-contained driver.

What the current proposal does is to create nodes in the base of the device
tree, which makes the device tree parser instantiate those into
platform_device:s,
then each cla_device piggy-backs that platform device.

I don't think this is a good idea, I wouldn't use platform_device for this
since you can just look up the nodes and instantiate the cla_device:s
with a proper struct device inside all of them.

I think it's a better idea to put these inside the CPU nodes themselves,
they are there after all, intuitive right? Init code can loop over the
CPUs and instantiate a cla_device for each CPU directly without
having to detour over an opaque platform_device.

Devices inside CPU nodes will not (I think??) be populated
automatically, so you can add code to loop over the CPU nodes
at device_initcall level or any time during the boot process deemed
helpful. This also saves you from adding devices for CPU cores
that are flagged with status =3D "disabled"; which could happen.

Yours,
Linus Walleij

