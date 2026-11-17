Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E035B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p7+N1MUM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJXcCEro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1n4akinMU4Hf+AOUS7LX8ylkG85tkNf4WcZP+gMfH/E=; b=p7+N1MUMQ3MLyl
	qZ7jEIPKOna3ERbgXjNT7sfgnny7foZO46jm0V0gBm4ucVigTa3pgUuRSHjQi+oI5yzWsqQz2xM1A
	7dZHJOA3Lb1rMZMcC0c+YzvSh6gDc1nOT7VVRIW8VRkEb91bZNBapcG125PqIk+YhUcgHHPfTnE9L
	WqXQubBHvr/Cg7wTn1q58afQdaWxs82/XihKozCFcq8R/gAXgdY/UbX7GoeVpLUmlRBbNzTKvYgGb
	BvrDUiKW0QwkuvMFPnM2lBveLAxPwkMtV+2/X/KZOIeITx4asop8UuYC+peyiFXRYr6+eIQz5C3Mj
	2wwKMqPLh/SOwkk8nSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJk3-000000062Fo-01SS;
	Tue, 17 Nov 2026 14:00:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJk1-000000062F1-2SFZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:00:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 074F042AEB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 14:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED581F000C7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924056;
	bh=1n4akinMU4Hf+AOUS7LX8ylkG85tkNf4WcZP+gMfH/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XJXcCEroAaV7bIV2RBbIv9cQ8IK7q7IczrpxrkMMo/2FTVWOiZZngfZJShFb+Krxu
	 CeuvkYFMof6Q5FXfWeasA7J6Q5yM3v0nSXzDbZHS3xdC+2DD3Vh6HIy1yVcDw6mai7
	 Tx337CPuzb4SDQISkZELEhbK2WHPEvyW+TGUDr1jiu+bh05gUiXgXigMus/G/ZZ5Tg
	 JioMC1f7LPYYfexBdKBqxART6byY2phKj/ze27ao18Pd4JLyjdxtJi2c7+grzi9myY
	 dSkeA6OJaViGjZITJE0/UzjONOl4ndx9Oj5ol5W9DKsrfjJg/XCcl4BK7tBQ0tpTyr
	 L2W1048ZY0WoA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1a3374400so430789e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:00:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE9y+ryfQ5JEr2jhs32PNPMz7W2bcvr6FXcf/9B8Bqpi7riVtxLhiFZOkQlF3M6QXP50Q9ASYW9MWrGUSivSPqC@lists.infradead.org
X-Gm-Message-State: APuU4Z8j4XLAH8mPIhWliJTt/VPqi6YDoQtxC4HYGjWIMbip1/znaMlE
	PRwCuynvK5aejeOw/O8qZQadPNqMWDcwyO50fahKnivaucJJu0iHy6ZfR2GwGhzmjs+ccsLDSbm
	5bPDsASWuXnaM4nYvgzyGHkyM3XqYgjQ=
X-Received: by 2002:a05:6512:3a96:b0:5c1:4e4c:359c with SMTP id
 2adb3069b0e04-5c1709c44cemr4959950e87.36.1794924055639; Tue, 17 Nov 2026
 06:00:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com> <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:00:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLmNSdgJPG_8dVKBLxN2ewvYJm99S+32SyKj_psa0DX53Q@mail.gmail.com>
X-Gm-Features: Aa3M54pM4N8FrMarps7ie1VxRtJp-XfzSOJDJp1i6ICkP2NWqZ4utwFMO5THjsE
Message-ID: <CAD++jLmNSdgJPG_8dVKBLxN2ewvYJm99S+32SyKj_psa0DX53Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Use managed pinctrl registration
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
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

On Mon, Nov 9, 2026 at 4:57=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:

> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it on device unbind.
> The registration can therefore outlive device-managed data.
>
> Use devm_pinctrl_register() to ensure the controller is unregistered
> during device teardown.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Changes in v2:
> - Add Fixes trailer.
> - Add Reviewed-by trailer from Andrew Jeffery.

Patch applied as nonurgent fix.

Yours,
Linus Walleij

