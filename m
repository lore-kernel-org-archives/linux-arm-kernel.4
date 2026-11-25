Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A908606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Shoj7uLV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qs80hY3H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RJR8nWpEg4o08Sj0Cd0BjVNAY/eMxmKPRWluSSHnWwg=; b=Shoj7uLVwoB0ZG
	6b4VEsAtREi19MEJzKD0hR/fnlhLjg/97PCwclpetpbJCPDQult0MM0fbVC8ydTmmDvXBI8vjHcdY
	vhIxnZ7bGN4+L1qb6bMQ0d/VIK3MMf9ularoPAhf/vmzdD3dtpQfdCvZOmJNLQDr0J9/hRw9h6v+Q
	sBPbBQNy/iFlP0Gbr3rpfiAZ5j4jv9DxqI9nd8pSZCWIkeBapwj+Eh4GSqoDufiEKo096u0Bou1J1
	VgX9ltHbktqXokMg18rYRKN528lovJapEU6FN0dOLF6zDJFqZnnmkzRXOKx54KHUCFL/g10pc5aNE
	6j1tspBBXD4fA+Xmvb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCb6-00000009v97-2yQT;
	Wed, 25 Nov 2026 12:59:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCb4-00000009v8S-1XN5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:59:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A5B9B62A22
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8931F000C6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611576;
	bh=RJR8nWpEg4o08Sj0Cd0BjVNAY/eMxmKPRWluSSHnWwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qs80hY3Hnx+E41/WYlJQLZyl5dDQTCTaLIdR9Bu98XFsywGKT8LvrTDf6865w+68S
	 zFySJki7C516IybnLQoOeK8a+IIyBTCulGH7zFljfufTvRjyJOzhJCWH92Ozj5Nfs8
	 e1KeHQZN7VFA09NAZUMmBNR4hPnu+GglvCyUERhDY4kPVTyRrZY0i0tW+UUMjR+Rks
	 Q/Z8o6dfZZ6zoc7H5EX60TylISOGDa+B7gqZOHGQTXxt2GJEwNk/aKgoyt4o8PnLSl
	 k+zkAnpMrV31oTfbeHy9t6vHznoUViQ4VJLf1GcpXbC1H8KyrzDamgGFErh+FjQFsJ
	 xmX648vkOPy3g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bccecba199so5542830e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:59:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFZDG6XRvHxxW9c178CwjLZVPub6ZogKWCY9pPxoqYAl6TTpEtWIx0PIujJdtf+u2L4MQc4vVlG++1BBIzf2wpE@lists.infradead.org
X-Gm-Message-State: APuU4Z9DEJkQvlCDpyavyHP6fLPFpsawIacTqB32bczEspS4zGcGo/oF
	psUGpfCUiGi3EFdW5EoEf0DWpfMah1wHacKujdZe9I1jn9b10Zof5h99iBmTA40EnoxMzwf9Ezo
	wsmRmFK1aVpqqrXSZtyLKrkB68058FEo=
X-Received: by 2002:a05:6512:3503:b0:5c1:5978:863e with SMTP id
 2adb3069b0e04-5c1bc8506d6mr6376432e87.61.1795611575686; Wed, 25 Nov 2026
 04:59:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
 <20261125-smooth-miraculous-eagle-ae81f4@quoll>
In-Reply-To: <20261125-smooth-miraculous-eagle-ae81f4@quoll>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 13:59:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLn4hdGDWhZfdxjLaay4D-Lkf5_1xVh6RfrN3-va2Ab-UQ@mail.gmail.com>
X-Gm-Features: Aa3M54rGVMu_MelOlJLO-iIHaXugLnXCr_-_WGzU7N-JJFmanHnX_GN4fmlWBr4
Message-ID: <CAD++jLn4hdGDWhZfdxjLaay4D-Lkf5_1xVh6RfrN3-va2Ab-UQ@mail.gmail.com>
Subject: Re: [GIT PULL] Ux500 Powerdomain DTS changes for v7.5
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> >   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.gi=
t
> > tags/ux500-pd-v7.5
>
> I think I commented last time. Please, please fix your mailer. You keep
> stopping me from simple line selection and pasting.

Oh yeah I remember, sorry. I don't know how to fix it, it's the gmail edito=
r...
I.e. I generate the PR with git request pull > reqpull.txt
then bring that up in a text editor and select all and paste into
gmail,

It would be great if git send-pull-request existed and would bring
up an editor if choice then send the pull request the same way
as git send-email... ChatGPT suggests making a bash script
based on it send-email --annotate, maybe I should try that!

> I applied this one.

Thanks!

Yours,
Linus Walleij

