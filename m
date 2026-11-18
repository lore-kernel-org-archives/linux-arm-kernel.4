Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0B4606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GHgdS30i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/v+eP0h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jr2i5Ws8efXcq7fsLottyNoSDK02f27nflx3w/WwBX4=; b=GHgdS30iYo3liB
	ZQZ5HRMMIXQx2Cf2wdofiGSwShVkrvzaVMPvbfcoG8Bjbzv9VS5hfcMk6g2OUF0HljEYkpNq8Vx5J
	VlmjvHGKRTlPXOxScnlZF3s8r6n0TeT8to2t5yvDnJ+GD7ArysyfibumJEXnASzPrsBThJgVY5LyA
	ZVOcj+SqBBijdnjOye/8LhztLC8SEZhaBOXuMdULakhx0p7LTB5Ln5tvAbj8fNy5BYQ427VErpTWy
	bESgv3tteEziGsdAvHL5skCnJ60RYOu7lSU3q4dCZ/buwvHE8sMoZHXJsfcjrpGXQWbgAuq3x3xff
	wA1hJCrhA1IP6BjVkxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmuj-0000000AHgx-3g8H;
	Wed, 18 Nov 2026 21:09:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmui-0000000AHgW-3KIb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 21:09:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5B3563D99
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 21:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704381F000CA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036195;
	bh=jr2i5Ws8efXcq7fsLottyNoSDK02f27nflx3w/WwBX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e/v+eP0hWOV6kjrBAYvATcWqJ/gpTYajGabAuTPKDi7RdPofCoC4e4edajjc5vl40
	 9yfvw4ZdmUN7Uf2c53lZTCOqs505LhW/o4zhZIDc+pnvObwR31spw8mxRUee1Al9y8
	 tMCLQxfN0H8Y8nP2MqZA1EC3Wyb3Hb0imIEt6VKrRrtYYbZ0OfGkb5yehDHQqfy5DZ
	 fNqnR2Ds/v3WKlR+NbSZQ1jSa65a8kBBXS8dDyquOO89DCX7OWtqJiKP51UimA9hNt
	 W+8MYCG0JCTZKPxdOJ8Zz7jjSftDVIP+0zfe7+dV58zgGOzzdco5q6OTz8JltFYLQP
	 EpFBCJR/jEn5w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so1251130e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:09:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGYo3nclcAVRFiF59VmkPCyKB7obwaSZ74huHbQqJiomVQxud314TUMintsMqntxU1B1yzYE7rV1ot/Vg5SFbHN@lists.infradead.org
X-Gm-Message-State: APuU4Z8GswfgQw/PJbFCsrVDH9587Bxe2ydbqFS1IzYBZOc1d3QVVxri
	Se0JtlOTN9vi53ZVkEUr+Hc9vJw3BeNIO84kUpWAtQaFM2QdwB4az3Hl8XmvDOYZq2e8djCo3CC
	RCza5cN1g4nwXjlqonenHv6xijR59yHM=
X-Received: by 2002:a05:6512:6891:10b0:5c1:b107:2bb with SMTP id
 2adb3069b0e04-5c1b107097dmr214230e87.29.1795036194225; Wed, 18 Nov 2026
 13:09:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:09:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
X-Gm-Features: Aa3M54qVfEnBQGnC1md9osy2E13w8uoX854ImpVfar6VoMvtX9B4F6U4NV-DAk4
Message-ID: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Nov 10, 2026 at 9:32=E2=80=AFAM Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:

> Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>

Fix your email address in .gitconfig please so you don't use
your login name as name.

Example:

[user]
        name =3D Linus Walleij
        email =3D linusw@kernel.org


Yours,
Linus Walleij

