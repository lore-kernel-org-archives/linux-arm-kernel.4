Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97E9606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vjycVQ/J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kk4sEdJL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p9Rh/hXvg2jsBJjP0Yu4C+Eu3X6GZTjBohZpfnHeVMg=; b=vjycVQ/J75Ne4Y
	sP5x/nfg+yOqrC9FNnna9ipJRyTSVSeHLIiIi7cdxYGUdgGgTSc0H4oKMe/0+k4dKk4wJaZVAwKJF
	FHG4q2IxdEFjEcmuhoyTSx1QZwHGGLODPoUcFrh0fYFqOQFUegfsakvJNpjdIaDKU5W1BhIxHhl7j
	e6Dk/275kVCzacnh7/o63AW0wc1cOf5d4/wFpbF3El4sQHViSAAslnKij6uY1OLve53IdgYUIUvn5
	vdVEUtTBg4wrYpB8km1J5WZnKvz6M9qkTnDITnVn+tXP4qtO61irkCn1kmHqJMMQiyDEkwn3l9YQo
	8/YacsIOC+pyr1nHAWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPXg-0000000FFIt-0Tfv;
	Fri, 20 Nov 2026 14:24:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPXe-0000000FFIn-40FB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:24:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 611DB61828
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 14:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9481F000E6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184682;
	bh=p9Rh/hXvg2jsBJjP0Yu4C+Eu3X6GZTjBohZpfnHeVMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kk4sEdJLgOE+Hjw8W3OrY9BNWMGi5VD2BniHHp/u1AH3+J52/BtJTNBZ//LCWHyWE
	 ZSh7uMep9ihvdeKPnjnkAFffnkhvycoFWp9cfd8mLmrYCRl9EglIsN3BH5vcqANK3s
	 k38f8GHL60LxbqRyMurjMqOgkPpAP/YAGnZ1arararMBd/3Syj5njelU5RMpwr/oXw
	 LegRyo4kYLpNVK9PJHUFm1MQtYxVLiPODRcBFK+jCq7OOD8eIlZiOabDIDpA7hvYI4
	 0f1HVtfr1ITLQyqTurwLliT2+w8j40h1skqu/BTqIMSxtbLvCckLRt6g8dj+GoO0mK
	 Si6nuU6e63Ldw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso720235e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:24:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE8apKvruNb0LRMWISBKjY1f0fT8l5yzk6vg927vQl9w4kpNqdrfkWsR3QVc6nD9oMXKcM3axslx7gs5JIO2Apv@lists.infradead.org
X-Gm-Message-State: APuU4Z8XNSwJQ6cy3CGHc3QuWGqtxjgiJpC539fwAUv5IdSagsQB9SUc
	vZAXI3fgDd/PM7WM/ygEXxP4dOolMrD1eV2RspGC8vVY2BXUFfuvm3KxPRN+8vCSjkCVCD2rk7b
	g4Pwa3O9FzLU/qxApM76fu7w7TkrKQ6k=
X-Received: by 2002:a05:6512:3d23:b0:5bf:f76f:b5ff with SMTP id
 2adb3069b0e04-5c1bc8c950emr1064542e87.52.1795184680432; Fri, 20 Nov 2026
 06:24:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120125722.209609-1-paul.cercueil@bootlin.com>
In-Reply-To: <20261120125722.209609-1-paul.cercueil@bootlin.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 15:24:27 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jNd7GofuUwWHvebMg6Sptwi_t_tV8ooncCA-DJjfyDbw@mail.gmail.com>
X-Gm-Features: Aa3M54omc4JKmC3wru3Fek3ksqLimBrHCDgOmZzphfIO2NeKkgojyLoxQOCe-CQ
Message-ID: <CAJZ5v0jNd7GofuUwWHvebMg6Sptwi_t_tV8ooncCA-DJjfyDbw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ACPI: platform: ACPI 6.5 fixed clock support
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, 
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

On Fri, Nov 20, 2026 at 1:57=E2=80=AFPM Paul Cercueil <paul.cercueil@bootli=
n.com> wrote:
>
> Hi Rafael, Russell,
>
> Here's the v4 of my patchset that adds partial support for ACPI 6.5
> clock resources.
>
> Sashiko complained about the clock names being too long still, as
> ACPI device names can be up to 17 characters and the limit of clock
> names is 16 characters; so I now name them "acpi-clkX".
>
> Note that I expect warnings from Sashiko that I got on my v3 and didn't
> correct, because they are bogus.
>
> On the clkdev patch:
> "When clk_find(dev_id, NULL) is called, does incrementing match here
> give a (dev_id, con_id) entry a higher score than an exact
> (dev_id, NULL) entry?"
>
> My answer is that you call clk_find(dev_id, NULL) when you know you only
> have one clock provided, so you don't need to care about matching
> priorities.
>
> On the ACPI patch:
> "Should the con_id argument to devm_clk_hw_register_clkdev() be NULL
> instead of name? [...] Setting con_id to "<dev_name>-<idx>" instead of
> NULL prevents wildcard connection matching in clk_find(), so any
> consumer driver calling clk_get(dev, con_id) with a non-NULL con_id
> fails with -ENOENT."
>
> That's completely ignoring the first patch, which addresses this issue.
>
> So I consider that those two issues can be ignored.
>
> Changelog since v3:
>
> - [2/2]:
>   - Change clock names to "acpi-clkX", because ACPI devices names can be
>     up to 17 characters long, and our clock name must be 16 characters
>     max.
>
> Cheers,
> -Paul
>
> Paul Cercueil (2):
>   clkdev: Improve clock discovery with clk_find()
>   ACPI: platform: Add basic support for ACPI 6.5 fixed clock resources
>
>  drivers/acpi/acpi_platform.c | 64 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/clkdev.c         |  4 ++-
>  2 files changed, 67 insertions(+), 1 deletion(-)
>
> --

Sashiko has feedback on this series:

https://sashiko.dev/#/patchset/20261120125722.209609-1-paul.cercueil%40boot=
lin.com

Please let me know what you think about it.

