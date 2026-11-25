Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF36606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OJMhHdL8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4uHgzXP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=usb6Z06Hk8KYQV8odRZafo7lcqGHFhPDFCx6kFOexg8=; b=OJMhHdL8JKCPvugBpAXgGyhPq5
	gsSKhD0t55E2PBn0sPbVPYxxaS/sexEoTARUKwVU2l0vp/kgveDUsqGTZ48sYYDjAH6O6bmQqpWSH
	0XAtT8Nghw9GOXiV2vp9hJiDcZKOXGMHNA3lJvzuz5Y5W7PAaZTwbLIFhFPiuIZ/Pjfba3TaQqTzK
	DyN/muHKxsDD0CjjybJme0WH8u+byvNZKv8ispFse5Y6RT0g8qBG/zFUPPROnqJTE9Hadnf4K1c9B
	xJ6awfYpOsYycm7ibjApi5vHqTLCvsOJGFxGtTYfm7ccCvufzocglU+G79qt4MnW3A+206MJ+skPG
	bdJ72UlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWADY-00000009Rc1-1wvW;
	Wed, 25 Nov 2026 10:27:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWADN-00000009RaA-0ZsS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:27:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A61A4568B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0531F1F000EF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602420;
	bh=usb6Z06Hk8KYQV8odRZafo7lcqGHFhPDFCx6kFOexg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O4uHgzXPpddrs5gBqi8u9B2aC0SyE1KCf5EIAftXmQf0Yz2Bd+cgo1AM8A56/XQ9b
	 QsOVezx8SE9qn+lvrJWJL1PlTp4gI/ODzeAfNUdCBjt4Yzly+8YEdh5lAto1BeiBtW
	 /7CFZIny7BW8SPGrIJQECs6/L+Gmln25txeh1jerNuB2R5ZuT5WsODPt16jq9ZSXN1
	 TAdyxky7rcl0q80azCDqg0LQDzoEB1/CSIuA4WL/UAjvZTNT3qWM2GLj5N0aZvZz1R
	 L8ZFxRiK9+1MKiLQyRnSM6v7F5pPkCH2LHiOaGB1sMe/Gxk8SHMRpzsNCp05SnHtNB
	 EfR1nLIQmF2Pg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso4587679e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:26:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGypSMO2D6pZN+grHRefQId7DCy0qwKIadYGisnUJVqYqqUP7PISMdywGd0t4p4YgWjTb56ngSjY+XPyyebspwV@lists.infradead.org
X-Gm-Message-State: APuU4Z+2m5dBK8cuBuQWGYOIvLImDKOgRu4P922yQge4BtwHjcyBjpYs
	Epb5t1YNQtzlAb+mgwH1NXhYICeHpoyyuh37QgGsFD6IigNC4Mke8jNkS0484yoGaZ0IOdaIhdi
	vr0pPCeKEqkFa+dypF40ODDw9+0OBidQ=
X-Received: by 2002:a05:6512:104d:b0:5c1:5a83:2fd7 with SMTP id
 2adb3069b0e04-5c1bc907072mr5199313e87.66.1795602418769; Wed, 25 Nov 2026
 02:26:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 11:26:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLm6VvPYB5UQS8Zm73pYifr7Oi=xX3S4Wt5c3WE7uMv+fQ@mail.gmail.com>
X-Gm-Features: Aa3M54rtYXT0tNMww-_rAs-DbnpD3x58pzG3L6crqferpf2a4MJ3rhFXSlspZ40
Message-ID: <CAD++jLm6VvPYB5UQS8Zm73pYifr7Oi=xX3S4Wt5c3WE7uMv+fQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/15] Arm Core Local Accelerator Driver
To: Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

regarding this patch set I looked into historical precursors and
ongoing developments that could benefit from the same infrastructure.

1. Apple AMX: there is no ongoing effort for this accelerator but it
exists in all Apple silicon. This accelerator appears to be synchronous
using extended instructions and is just "some different SVE" and would
be handled the same way as these.

2. The PowerPC Cell SPU (Playstation 3)

This is more interesting: the Cell has accelerator cores that execute
entire litte programs (shaders?) on behalf of the CPU. These are
however not poilled like the CLA, but signal completion using a
mailbox interrupt. The accelerators are

What is interesting with the SPU is that it communicates by creating
a custom filesystem (spufs) mounted at /spu, so this is apparently
another design venue to consider.

I think Arnd Bergmann has worked extensively on the SPU so he will
likely be able to provide input on lessons learned, do's and dont's
when it comes to this and other accelerators.

My superficial appraisal is that the CLA is probably executing smaller
jobs, snippets of work rather than entire little programs/shaders like
the SPU does, so it is conceptually different, but may provide
additional ideas anyway. Arnd?

Yours,
Linus Walleij

