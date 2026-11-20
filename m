Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFAD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dPmmfArN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJutmftZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o7rTaAsHFk/tyQjF/KkLQG7BkQRWi0iSLzAHM4JNo3g=; b=dPmmfArNwTRCpX
	wCcSNxME0h+E/GvWqVlTgib+JDvYNDJrGWxL6W0gbz/JijNoN9L3/vLReGynJ9cLkbM7zLwC4thwj
	LuZVZChOIR+rC3Tx/1zAaDDxlfUwYtA0+oGnrl8xE/96yOcABKxE9dwLjw3AdL8ewh6Xkrv33EI0L
	BvfYs8ecCrgPpUckN40/rHvFwTVQzmhK3aklKmGZPa1j68AMF3/3IvyZF8/2Z5ndZzBcvgXaxAOKZ
	gTT6htLEZQbgqO/hwz3WkOSqYwwSjMrFjooYwOtJLNvjNk4hXIOkQX4CJQO0v1qiIf+8Yg7av7T+L
	Ut/UDP0Ik+qD5WNPYYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPeu-0000000FG5C-3Fld;
	Fri, 20 Nov 2026 14:32:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPei-0000000FFxf-0XZf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:32:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BCAE627A8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 14:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243BE1F000E1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185119;
	bh=o7rTaAsHFk/tyQjF/KkLQG7BkQRWi0iSLzAHM4JNo3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JJutmftZH/J1SIO05hmjDLTFCC92pR72ldIBM1PODII2oyoICOs3aE2vSDtI+hoLm
	 sXTbRAiKa5kEQNNBDEVgtVvh+Si0wBo4+5+EEfeThnkXTm0eFW5IGbK/PO3qwaBQ86
	 kJeDQYTjRLsp9iR2u3ktpc7jsVzNP6ghsP79oItpdtlHPfNZybTmL6nb2KbxJRqHql
	 nrgRFYSrPSlkjZS+df2ZJFVWAaI2+iyuN49uKEk6C1ZnGD38/QMRBV2i3+YmvkqZg2
	 IIZcCLM7O7eFcOVZAs61+5hFjNnBRd1GQXpvJOSjdyGw8zEq372hETtrSLQbMQnIdY
	 jPXJEknSOi/pQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so545352e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:31:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEK6LORKDzteiV826CY7NvdZi6LDa41ulp7JPTDTmUc+HrecM3kynrdiYE2opKKgVJzN4K1iSBQHROT70eUmnJ8@lists.infradead.org
X-Gm-Message-State: APuU4Z+HDeheP5tfBcGL86awVeP8MrI8i0bfTAET+ENFDNv4oCfTUYUJ
	LrFrS17SXEMUPmL0ERxzmprDXZnD0rqTo4ZZpJMm+5IpcuLg/PhmqKUedazlWkq7dh2f0dfEFvO
	UhGC1gdUbVi6KasSTREv6SrjtrSR5754=
X-Received: by 2002:a05:6512:1153:b0:5ba:3443:aa2e with SMTP id
 2adb3069b0e04-5c1bc7c3484mr1161827e87.21.1795185117367; Fri, 20 Nov 2026
 06:31:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120125722.209609-1-paul.cercueil@bootlin.com>
In-Reply-To: <20261120125722.209609-1-paul.cercueil@bootlin.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 15:31:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i4ybwsOKfj_LS_m7EL-AYAhPQJmLNWBm8gdZ5uvfcJug@mail.gmail.com>
X-Gm-Features: Aa3M54o-jgZ0qds3pKp74aFKU-859gv8bMIPLYPPqZ_KY6XXerlWsab212FP_V8
Message-ID: <CAJZ5v0i4ybwsOKfj_LS_m7EL-AYAhPQJmLNWBm8gdZ5uvfcJug@mail.gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
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

Sashiko has a new comment on the first patch though:

https://sashiko.dev/#/patchset/20261120125722.209609-1-paul.cercueil%40boot=
lin.com

> On the ACPI patch:
> "Should the con_id argument to devm_clk_hw_register_clkdev() be NULL
> instead of name? [...] Setting con_id to "<dev_name>-<idx>" instead of
> NULL prevents wildcard connection matching in clk_find(), so any
> consumer driver calling clk_get(dev, con_id) with a non-NULL con_id
> fails with -ENOENT."

This time Sashiko complains about something else in this patch AFAICS
(link above).

