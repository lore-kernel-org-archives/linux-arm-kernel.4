Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA00606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PMgkLeNE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCwb0LF0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e+QKN54s5dJC9PcohR2oIJVPHcl5qCaMa3M6f93yiFg=; b=PMgkLeNEqbrZ2A
	MprNVA0RN6taaQnGlBkd+SUvl00a/OkCz0gmVswMc0M8jYJDAtaOaEd2jTgytEPQCB6dn4ORUdme3
	ihEGAt71vTJmLbzWei31RDKZK9nlNl97NRQXIX0EYJ5e1BTrcjYCuHwgpJ+JRPVk76Z3TyfqF4X7H
	Nwl4TExLHMR295Q6HRlik4OwXcPtqkQygAUko9KQsrP1Hrt/OpuVhqYlbT8YBOpQVLZBhEA/tM+2h
	n2sQOF1wzEGn8juJ4HAq46VoFEIHjMBiwqlndMOkVDIrIq6c6PktWnYqPdHuAe2pVeNoDXuJja+Cb
	x3qS+o7O7B6Re2eUbF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoOh-0000000CLCm-2EqJ;
	Fri, 13 Nov 2026 10:20:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoON-0000000CL57-2yvH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:20:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08DE562681
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23BB1F000CA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565222;
	bh=e+QKN54s5dJC9PcohR2oIJVPHcl5qCaMa3M6f93yiFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OCwb0LF0A7Ak998VUdtZ2VMQp/bWG5nTo4fWRdQ86sWF1HhYqYuwSOOsxFzslsBeu
	 H3lDd9zvJdCMIkI9dbFBIYg7Z0u8eufwm8IHvs2VCrxER75RflOQAMZ6ykHRnll1R/
	 IxSj1nbNmWy0vG/aiDkcwtRl/yxhggDb6BqYURymPBGESFt6q8AFjUOJWdicW4p+VO
	 1CjfofiGVwhSN+/6xEbcg1bArAivOaDY0/kN4ux5aVd6fs5LdraYO3rEb6mSuFI0UF
	 VqH94MxONlDy2nJ8zyxFcXVrTFSkPp67d+CPSvkFu8mFV5C5aVHuCxvN/HEE9moyWk
	 +Bck65Oa4vbig==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6e560e00a86so986020eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF4ZJm8QLC/Na12mVUD0s28pJiZJgk1NfQJVOOciwxgup3XaU9B4otLvWFMwEkT7TIgymZTFprAM9wJ6gcVOO30@lists.infradead.org
X-Gm-Message-State: APuU4Z+sWRh5hZoILjafU80vCZc/Fx0/EAwbpK+pMEvxKIhPtSMitmRu
	KGc6XhlZSo0nAM3HZelD+uqUS7l+EYlxWUkf7ZlUnDDJBPmlIVg0JzWsYFEHVZJtN+Y7vkWf8+n
	ham9VSFjlWOSmnYRQ9wCNHh8tEwyJa4o=
X-Received: by 2002:a05:6820:1505:b0:708:f388:af75 with SMTP id
 006d021491bc7-71ab5076282mr1109599eaf.46.1794565221874; Fri, 13 Nov 2026
 02:20:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:20:06 +0100
X-Gmail-Original-Message-ID: <CAD++jL=uDOiz7R5KJAfh66HudBXD_QpmETq=7LTouTcqgTYb4A@mail.gmail.com>
X-Gm-Features: AclHuK8ALm5dcSJS8WSzctJPTDL0CYbD-RRIi6GsaRl2wItphby29XEFcySloIU
Message-ID: <CAD++jL=uDOiz7R5KJAfh66HudBXD_QpmETq=7LTouTcqgTYb4A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chester Lin <chester62515@gmail.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
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

On Thu, Nov 5, 2026 at 3:13=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 pin controller provides the pin muxing used by peripherals on
> the supported S32G boards: the S32G2-based S32G274A-EVB and
> S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
> some peripherals never finish probing and a defconfig kernel cannot
> boot to rootfs on these boards.
>
> As the driver is required by every supported S32G board rather than
> being optional, make PINCTRL_S32G2 default to ARCH_S32 and keep the
> user prompt only under COMPILE_TEST.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Patch applied for v7.5.

I don't understand what Sashiko is rambling about, if there is a problem
the build robots will find it and we can fix it in-tree.

Yours,
Linus Walleij

