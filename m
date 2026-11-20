Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lws5YB4g;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSW7egoy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q1QGjoYaE6UMgYTk/6OhkgIovHiFq9oX5Rd20qQXkcM=; b=lws5YB4gCtDK+h
	sXo19A7G8qK5+zGIfi8F1p7y/eXbLtQ54+z3xkPjha8vGvITr67lthS+dm1Nn61WuQCf+Flsu9/gq
	j3l4Dh8w3nmvL5PLpcHxGZ51Ewc7xIgLqUaoh+h98azXoZpi7fcPgQnvLLSVaU4nlYRtjqFkoFcZD
	HWqr1hoIWIlZkEp3qLSZ8qxyuN9u8jb00qvUVc46Kia4lGG71pi6JAhsoQbj8puSRYvWBqi/6fHba
	3T65TwWiQJ9ijO91ixfV1pVzHFN3RMixeU9Efjis+uk2N7WLJ8RgcFenwJFslzff85+oLE0fkHvYJ
	K4qIrI/DVW5WfJ+RVN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPYn-0000000FFSE-2GCZ;
	Fri, 20 Nov 2026 14:25:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPYl-0000000FFRe-3ntx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:25:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2811D6248D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 14:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479491F000D0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184750;
	bh=Q1QGjoYaE6UMgYTk/6OhkgIovHiFq9oX5Rd20qQXkcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RSW7egoy9rhg8xJqUJfVlTEMIPnXfmxsfrzMietR33CDO/vMXcIJb8S7O97FRX6X0
	 jQMkYRSteW/+ukOvx77auvDZByVeqIuRl9H+p8Tc/Rf9oPhd8b1pnQkusUyB5PjZaG
	 Hp5KtsQhnFA/cEF2zHz471AFXMlCLV02xKAetKzzNqRGklWotzvN194O+RdQXXpLya
	 X7+D1xlE7pN+y8hAvta7NuDExL+8ijyd78DOwzoTPznOTDj5O6yyJYcIozA/YATaQ/
	 aBLTDXaF7Da5r46R5Qe5LCPFfv2k02zJm2ciPswr0yoq4KiQ+QENRJgVk5OEHHKLWG
	 sD39FHBWjP3Gg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso538040e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:25:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErET8UP1h8s2Xj1uqK8n57MdL0P7e/m/y7mPRM5hyraYDJigl+BcfK3i4zX0OT9jpIm44bmuyIG3v0Wadx3V9Iyp@lists.infradead.org
X-Gm-Message-State: APuU4Z9eJTVIBTREIp953zb0xf44OCZdK0aJyGD8osWNbFD4AEkPWBNC
	Giz0rmWsGdtCkFnndY6yUTXh6YCbPro15Jx4ga2rL4LcXE7yoyB8Z38ABpsjb9utd+kigr7upyd
	vA9FlCOmra5GmCBFNpumcOJVVAlNmKJQ=
X-Received: by 2002:a05:6512:1393:b0:5c0:b5c:4044 with SMTP id
 2adb3069b0e04-5c1bc690966mr1003471e87.1.1795184748672; Fri, 20 Nov 2026
 06:25:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120125722.209609-1-paul.cercueil@bootlin.com> <CAJZ5v0jNd7GofuUwWHvebMg6Sptwi_t_tV8ooncCA-DJjfyDbw@mail.gmail.com>
In-Reply-To: <CAJZ5v0jNd7GofuUwWHvebMg6Sptwi_t_tV8ooncCA-DJjfyDbw@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 15:25:36 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hfRXxT4TwFvTLbWLTr7zQwBR+dOGFHGDob6YM6eu8d+g@mail.gmail.com>
X-Gm-Features: Aa3M54povqz_jWT6xQy-9VjAiLWN-eILkjZ44bDZBGY43v6tsG8vP17rvzL8oWU
Message-ID: <CAJZ5v0hfRXxT4TwFvTLbWLTr7zQwBR+dOGFHGDob6YM6eu8d+g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ACPI: platform: ACPI 6.5 fixed clock support
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 3:24=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Fri, Nov 20, 2026 at 1:57=E2=80=AFPM Paul Cercueil <paul.cercueil@boot=
lin.com> wrote:
> >
> > Hi Rafael, Russell,
> >
> > Here's the v4 of my patchset that adds partial support for ACPI 6.5
> > clock resources.
> >
> > Sashiko complained about the clock names being too long still, as
> > ACPI device names can be up to 17 characters and the limit of clock
> > names is 16 characters; so I now name them "acpi-clkX".
> >
> > Note that I expect warnings from Sashiko that I got on my v3 and didn't
> > correct, because they are bogus.
> >
> > On the clkdev patch:
> > "When clk_find(dev_id, NULL) is called, does incrementing match here
> > give a (dev_id, con_id) entry a higher score than an exact
> > (dev_id, NULL) entry?"
> >
> > My answer is that you call clk_find(dev_id, NULL) when you know you onl=
y
> > have one clock provided, so you don't need to care about matching
> > priorities.
> >
> > On the ACPI patch:
> > "Should the con_id argument to devm_clk_hw_register_clkdev() be NULL
> > instead of name? [...] Setting con_id to "<dev_name>-<idx>" instead of
> > NULL prevents wildcard connection matching in clk_find(), so any
> > consumer driver calling clk_get(dev, con_id) with a non-NULL con_id
> > fails with -ENOENT."
> >
> > That's completely ignoring the first patch, which addresses this issue.
> >
> > So I consider that those two issues can be ignored.
> >
> > Changelog since v3:
> >
> > - [2/2]:
> >   - Change clock names to "acpi-clkX", because ACPI devices names can b=
e
> >     up to 17 characters long, and our clock name must be 16 characters
> >     max.
> >
> > Cheers,
> > -Paul
> >
> > Paul Cercueil (2):
> >   clkdev: Improve clock discovery with clk_find()
> >   ACPI: platform: Add basic support for ACPI 6.5 fixed clock resources
> >
> >  drivers/acpi/acpi_platform.c | 64 ++++++++++++++++++++++++++++++++++++
> >  drivers/clk/clkdev.c         |  4 ++-
> >  2 files changed, 67 insertions(+), 1 deletion(-)
> >
> > --
>
> Sashiko has feedback on this series:
>
> https://sashiko.dev/#/patchset/20261120125722.209609-1-paul.cercueil%40bo=
otlin.com
>
> Please let me know what you think about it.

Ah, you've already done it, sorry for the noise!

