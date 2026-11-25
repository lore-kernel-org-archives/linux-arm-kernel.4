Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B046606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2CKRa7uq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1vZt4bz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4jTbRTZRitaWiCSV09T/AEZ1U865c63Eb8AZUxy/ufw=; b=2CKRa7uqNC0ia3
	8OH2QGQKuQzc3SxIu+L9sSO0L4lFjd+B98MvuC/6vBQSBTCpOPA2uo81p85QX/DwxoQxb9ZLBck+K
	dT4fD8/eQGseC9kZ6ob9qER5v4yLBju7es8VX+cSYlTJmgngwtEC8Zmhsrekomsc2FBhlhEkaQebK
	+5oSNP+SktwRInnnp9ht8Bo+ar1/0VZlXqj6/iN6PDXnpL5sHN87vTJ4nbOZjfAezblvb2FaoEuq3
	oIzzJZ7u1XOcxEB/x4R7TrdtEMItd18fuKQDWH5ZVjdaE2O8OC/r3D2n7VEPEeam4ASTk9PwMDmYa
	q4IISZEM9BVn2JOueg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHUC-0000000Ay2E-34sy;
	Wed, 25 Nov 2026 18:12:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHUB-0000000Ay1y-0HiN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:12:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AD0A62629
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59E81F000ED
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630369;
	bh=4jTbRTZRitaWiCSV09T/AEZ1U865c63Eb8AZUxy/ufw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E1vZt4bz0JhSxEtEeTI7AoUtNANPm+CYHwBUNqhHgFr/iJU34ypA4gyvEobRGVVWG
	 9sNy2Kp4eRirU984KbHPbBQwRxAMBw0cF1sENozuKbbGNZb/O50pacgvRU6EFJnoFB
	 e0663LxDQsaZnwh8If5SheyJM/1JF5a1ioNQQWnt8O1SqtINZLxt7JmM8TIBcYnl70
	 fj0eds0EpB+nRqjdBY8K3MX2wK2PshqxZbTAerzI0E9u/sPsDPNFFX/ITT7JCW9mrz
	 FhC37POqO+y8cdgD/Fld0E0zttEIf8yVuZhvk+yS4l1Nym+PDNrT+ZV1zf/lgrACLN
	 IfMhEfOT1UEmA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c1479a959aso4589520e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGEU5K+KqaaNlGtIHX+UP5hMf51zYa1Xji5EV1S/UKC5EPKE1CwLfH5+oPaGMmiW2nUCpmpees9Jys8XL8+TLqh@lists.infradead.org
X-Gm-Message-State: APuU4Z8bbr0NXq59n0JZXIxR1fmylsKks5c6dKmEaTnOBHu5N5nyoNTy
	ZGLb0+ZB8KFKZZmol82aloZTEMumrXlpVyrn8HtOP33jyABy9j9NjWgPp48GGc+EGzD4VOXEiby
	mdesBZtFPrLEf9V1tVI1nD7U6UURN3RA=
X-Received: by 2002:a05:6512:b86:b0:5bf:ce24:2d20 with SMTP id
 2adb3069b0e04-5c1bc7bc30bmr5709392e87.22.1795630368568; Wed, 25 Nov 2026
 10:12:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106230746.21954-1-wahrenst@gmx.net> <20261106230746.21954-4-wahrenst@gmx.net>
In-Reply-To: <20261106230746.21954-4-wahrenst@gmx.net>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:12:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLn3Se-NzQDMatXN__8+xFQUjVr2DJbigjFfy=PE20266w@mail.gmail.com>
X-Gm-Features: Aa3M54rzEawPDtXAOeD0tX6yiM-y94vFsxRv9P0IIXZxjhuCad4qET9fZgXDR1Y
Message-ID: <CAD++jLn3Se-NzQDMatXN__8+xFQUjVr2DJbigjFfy=PE20266w@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: gpio: mxs: Allow gpio-line-names to be set
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vincent Mailhol <mailhol@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org
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

On Sat, Nov 7, 2026 at 12:08=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:

> Describe common "gpio-line-names" property to allow DTs to
> specify names for GPIO lines.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

