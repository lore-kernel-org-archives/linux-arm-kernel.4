Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA53606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qA+JOa9r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QB5z+R34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S0XA8lNxZ3R3GHk2klTObywwFs3Z7RSzUthP5GZiX6o=; b=qA+JOa9rHjnwyC
	AU4Wr/DREvXf0u6zHrliSqE9DFoKMh3U5Df63rEcRwSU5b9008QNCngssguPO+oZ+EzK+KOi4U2c/
	nI+hyulK61BshMLN2ASungnzbwAJrWVvM+Qylv665WR/SOd8rKYg7FwaUL5MpXdKNsMZ/GrIq/2XT
	JWlz9Cj5Nskp3BKCyKu25y7GW6CuerGNE0JnyiwX3tBK3KPRbocp1IRUypsvrvurxdgYxPMj3BagK
	O2FSNzlIIGvuHKnfr92w4+XojOpHvgLVBytL232TGpRdQjY4trAwIOLgbKPNXGS6SADGfNJm2UCXn
	ab5NAucZMK79CT2bTH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoCM-0000000CIsK-1E7G;
	Fri, 13 Nov 2026 10:07:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoCK-0000000CIrn-1Bqn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:07:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54FCF6265D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAF21F000C7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564475;
	bh=S0XA8lNxZ3R3GHk2klTObywwFs3Z7RSzUthP5GZiX6o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QB5z+R34JgjSKXfdTuQQ4z5Vl3JWBLQzBFWeEA6acYvWfibhM2Rffli/kvKZux4vr
	 MYh8+DiEPhITQf8jKKKz9vDQQ85fvRos4R7RZkzlBjyxhUlkHAgy0OSfr2SFn5c+Ww
	 S4z7xJqcTzwnh86Gm7zTVOFPrh+KSN/vdKlOa+T9t/TWDrPQ4h2xQr1FmXNwUqUyOl
	 2X9yIEHKT9wjquLxU2vag5N0nS+K0iVjdAkr/IaACUbpFSr0dnZRZtnO2x+NkM98v5
	 d4zfoXbk/7ZWF1eF3UTKkTvs1uzp6Z74ISEzKGLl/Ct8OVqU2MHngWy07ePd3k6Tsf
	 yf927Q1beTwRQ==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6fe4372c5f3so973396eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:07:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG83SiEpn90CSnJDkazASxjcNA8XjFUARUzjuzbzpVEbN1XVoeR2+xiv3nCrMzMNAFyxX81+H6k0hPD/RTEpWmu@lists.infradead.org
X-Gm-Message-State: APuU4Z9o3oOD2rf0+pNvg8mdgrFq5aauIB89FE17R8eoyeaRB5jib7jv
	Rcl36BVAOLjB67S8WumLepN9kBWTMEEHmnKRQYaAZvHC9jH7yhuW13Q45AlGGKSEsoATMc6CYol
	ka+CuZkdrg5/cczQ1jr7xiROOxdsThbY=
X-Received: by 2002:a05:6820:7084:10b0:716:c53c:3f4b with SMTP id
 006d021491bc7-71ab52797f9mr747028eaf.88.1794564474160; Fri, 13 Nov 2026
 02:07:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:07:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkjbHxbJ2-p4oe3ecdpdC4Gh9fTiufkrvKBzF+bfz1HNw@mail.gmail.com>
X-Gm-Features: AclHuK-a3uoEAZFrK5h2rEztceybIFl9qYaKDq9CCMUyZ6HAOHlDJiKihMms9VA
Message-ID: <CAD++jLkjbHxbJ2-p4oe3ecdpdC4Gh9fTiufkrvKBzF+bfz1HNw@mail.gmail.com>
Subject: Re: [PATCH 01/11] pinctrl: scmi: send the drive strength in microamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij

