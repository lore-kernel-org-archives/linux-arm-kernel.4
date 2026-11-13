Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B08606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jsQsc1re;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEGSWt5P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KZ74UW0TYHmPuEppZWYj1rqUKpEM+BQypI3pzsCGhK4=; b=jsQsc1reFn6psh
	dyUIS8DLSj09ZcLD2FLQP9Uet6ttQIg35bVWvHfD3m0aKTH/dedVnCiVxdcr2kju7SbAYQuWbMYfB
	7yncQxV0ywoylC9Tdw7FZ63AqDvQm8TvZ1SMlWyfcY8u+tFMeOlxgmNAKBn8QcwOL0ILAfkNnB+g3
	+eTiaQX5svAAftN1nX71c+OT1/gibhbtAPPc3vqNkNitVCcytgZ5xrXGUayT7X0MnR2BT10Ye9kkm
	abDtgED77Nqlhnc4ksFEG8y4i6Aiq1/ac7Dy25KbsBm+P7wZJUGwhKyfYdIRITgoqSbPBAJcUXz/N
	G3yxl29X+PWxTEdwafnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoKN-0000000CKFf-0eQC;
	Fri, 13 Nov 2026 10:16:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoKL-0000000CKFE-0sR8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB4F544E83
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C079F1F000CA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564972;
	bh=KZ74UW0TYHmPuEppZWYj1rqUKpEM+BQypI3pzsCGhK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BEGSWt5PyoYcoZmBiIeq0CohHcsrFxELU+qdTbmL74Ij9U6IK5oGbyQQ422CpXCqM
	 VIHgV8e0jJqEbibLIypOeJiNatRsdrd551N13qRMc8pJAft4U30ARBSYVdhFsaFYdk
	 S7Dsd2GfRO5tHPvcEkLnGRM+saM6utpot+xeBxXg010G2IOrVqPziCd51gdUBWf0jH
	 SbZAW8bJvsDj8SOKpn8h5YRCaXerVjMZStXQ7UBhVaKPw1yvJdkXzSlxj1SAJ2h9zw
	 fq5c4jzYVz0PTdMD+tpsvR6QFNQWk1wJnzCNB86VKNJaLqwoJTv0MUCcnSApJXRlRv
	 IAYUDTQaP6Twg==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed0b68895so965200fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:16:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFze3SyNlwyfYAYVwdG4kTXqOF7AvzJ33d6snflY92iHuwsd2udiCSB8V8MicVf72iCoyMuhpBnO+GT+IH6bKep@lists.infradead.org
X-Gm-Message-State: APuU4Z+W2vCewtWdSWA4o887nCDfuO3+3DrJf8UEozOtKF93JXTvpNkh
	/CiOXeiDWNY/QeaqiAhSrwvg9pYoSR8UdOX4YOwufV6jXQTJ23ssUbRNs1JmdPieuZ5yO4OZ2A+
	QU492IVxZRLcpLo6Br48ynV9ZpeFBpdA=
X-Received: by 2002:a05:6871:824:b0:48f:e157:eb25 with SMTP id
 586e51a60fabf-4afdf7391e8mr2102560fac.44.1794564971946; Fri, 13 Nov 2026
 02:16:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104140820.65243-1-asv@kernel.org>
In-Reply-To: <20261104140820.65243-1-asv@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:15:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLn=T5YPDG--pPsdbV4tGxjNFH16ZaceN-Lw7B=TSJqhMw@mail.gmail.com>
X-Gm-Features: AclHuK_xp4juiDSf6WxJ1r0I6C2KBl-UfweFaPL-sasy9mlFdKqm6R0MIJqytLM
Message-ID: <CAD++jLn=T5YPDG--pPsdbV4tGxjNFH16ZaceN-Lw7B=TSJqhMw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: pinctrl-single: Add Alexander Sverdlin
To: Alexander Sverdlin <asv@kernel.org>
Cc: linux-gpio@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>, 
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>
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

On Wed, Nov 4, 2026 at 3:08=E2=80=AFPM Alexander Sverdlin <asv@kernel.org> =
wrote:

> Add myself as a co-maintainer of pinctrl-single driver.
>
> Link: https://lore.kernel.org/all/CAD++jLn8yxh3LmUzbb2vZfJFJB=3D_mCZ+VeQh=
nZktfmuMiv5uEg@mail.gmail.com/
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Alexander Sverdlin <asv@kernel.org>

Patch applied!

Yours,
Linus Walleij

