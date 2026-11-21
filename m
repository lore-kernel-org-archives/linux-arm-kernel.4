Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE7606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kCTf53p3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhMdTVcv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TwRAZOxTtTXy+S3cTIsOYqmghOtnES71mWdup4rt0co=; b=kCTf53p3e+0M3W
	P+Zza0UQfHzTJRBiBRUxvWnu37eSU1XVtutTUcMKtuyyuETK3B6w/JHn5OkQsWoa+MYcdzUkY4rWE
	sng3hdyyLNIhB+4SgVWspuG7nTqBlBeMdIBA9qYVad82mm1Gb7q9SC65F0lQ/meY5bnW7m+I8pTBF
	1Wq2HuW3UtfHDwQry9FHHb6Y+wfcKVAfdGvjzqIrNgseD5PIfAArzf+PXhtHd76UB1o7mpWTSlcfu
	n5fp9t292t2HxC5fdt9BXA2sccbsDv2trVV4RBX7i+9I9OIKycjzq2ktJsWZEHvABg6tOkV9GlUfK
	1HXORB84z1W4P/p1v71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsUg-00000000KP5-2qKl;
	Sat, 21 Nov 2026 21:19:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsUf-00000000KOw-3L5R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:19:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 794A743AF1
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 21:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582CD1F000E0
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795295973;
	bh=TwRAZOxTtTXy+S3cTIsOYqmghOtnES71mWdup4rt0co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FhMdTVcv7hTTIDYEMkZDmUO3HkhrUrXxLq3vHaLlCKM7YzylsICoYIYrTJzEPLoo9
	 74m27GMvvah0DCKBWuQ6PrnTPtuQi0Mj5HochkXuFFLwSUgkupkE8pd+D4gi6l8yMY
	 WiUsK6auPbm+CABDYq9ad1u8O4HV35tHtAx5BB0lbe7E/mMLpijZg+MBBW/og4WDVH
	 PnrfIXeF49zLuvj/Zw5vW+24lreUmuBdqsnfKXERsHh8i+AdH9+H6q+Pj+wwBVoq9c
	 4qZChs2Zy+IC0Q+zSRy0r9qNqwm36fY+aC33daLbfWwMzTKC/LoszT1mf+BmYgeGrY
	 KtJv2l90OFpxQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3013546e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:19:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHJCcuyo/McgTrEx+TJMxXjO2MDdBma1hShCr6JhaEULwJ7u2CG/17wFZHUaGIcZsvhCGnpQCfmTHO3yw2Xlk29@lists.infradead.org
X-Gm-Message-State: APuU4Z8D0Muec3hqtRe7fVc5H/8S35fm8+RboNZ/icqITmEMZ4r6KN3I
	D63EBa0kFzs1unJYMQEe+iRBNFjxPEYAH6Fe90N75le1UC0iDuBwOQbwMtp+a/4PB+0zvL6TZh/
	RsXYbb0dVhQ0eJVzBK5LavcBfUm/ODbM=
X-Received: by 2002:a05:6512:2c90:b0:5c1:7c6a:fefb with SMTP id
 2adb3069b0e04-5c1bc822245mr1829531e87.5.1795295972116; Sat, 21 Nov 2026
 13:19:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com> <20261015142552.4128028-2-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-2-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 22:19:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLma8atXB=eT8TvvYfKMg=h6YGPY4THsYhLCeo2VumeJrw@mail.gmail.com>
X-Gm-Features: Aa3M54r702fjHjrynCh9jy5iyOc-dutIFRI6s0mpbPcKoEHETe8434E7oYhGyyA
Message-ID: <CAD++jLma8atXB=eT8TvvYfKMg=h6YGPY4THsYhLCeo2VumeJrw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/15] misc/arm-cla: Add driver skeleton and documentation
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

Hi Ryan, Jean-Philippe,

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:


> +/**
> + * struct cla_dev - CLA device
> + *
> + * Immutable state:
> + * @cpu:               The CPU this CLA is attached to.
> + * @dev:               The platform device.
> + */
> +struct cla_dev {

Don't abbreviate compulsively, cla is fine, I would
call it cla_device.

> +       unsigned int cpu;
> +       struct device *dev;
> +};

I will argue in other patches that this should be a proper
struct device and not a pointer to a platform_devcive
&pdev->dev.

Yours,
Linus Walleij

