Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA543606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1oBWZ8Sa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GsUgNWgo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=; b=1oBWZ8SaylRrfg
	shgBa6mlsKgSpZm0Ki0HVdFGX/6MjMBoelCtbHo7ME9UvbY/b/8u3Lyr/5uqodl6Knw25vEgBhZ27
	Q2uZXUnanWSXBP5e+iB/92sI5rOShjWrn3AwvPc2fL9Zy512c7F4P8mN5HWxVoFDuuRny7vCj6UKl
	xm5dTQbxpXO1VeUQiIZCBFKLxUk2MwmMBRBAqwfd5hwLKmfQJEYPqUcMWnf5j7apZrK5g85eqQ9zp
	DyL20rSYHt4Vsbm9Mx6FnHd2J0h7Q/HkDNtq3rf4a//fdoYCL5KBDMcqaVJeU4zNQjo9lVTLs97aa
	u0oFvFVLAp828xF47gjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqkX-00000004obi-2HR0;
	Tue, 10 Nov 2026 18:39:17 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqkU-00000004oav-45fH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:39:16 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso22984331fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794335952; cv=none;
        d=google.com; s=arc-20260327;
        b=AVo234BwZpxIeebwXyWDZMtT4cIRx/nqtukaTa43YWZCLHAREKO681pGg6YW8touAW
         mT7RemPIyBClAdRdzNZFhrNryCXqT6uVCcPR8ElY6jUC2yQfThgO1i11Qt1IRxfF7M8i
         LtFWpSyni+NvB5yRuDImHwcjS0+RDkKwXP5+q6xmupMig9CK8VsDHhKf/g6tdj4Ddmer
         0DieXZpJL1Y7Gxe+3DVjIoXyktIYdfHc6jQzhJzIWg2GaU22M/zaMOitPl8EKrIHjY2x
         UW9GcRM4FjT+dqK1RObmB9jY9jAv8XDAPszfKwrPXMeFZqisJc5Tx1Z5yV/LirGdaM4h
         BhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        fh=d1CKL0+dKD/oLUfh+xBi1a0a1snaW9WsEWyaq1j/Ye4=;
        b=lFke7IbgX1mVMnMwht3IUtOKk9AbNy0RSlDT9PC3ih09RH0hMv084JBo4Frn6zotVb
         SgVvJbLSKGeJ6Jq1dF1Qo6qxbVwUZyAE8GZqYyHtwElwQ34qgHz5ZemlkdpiN0SXPkPE
         uPEuGsEPlkrJ3ZIE4yH2uKp/bl63b0Ml/uDOzo3roPf5MIW90o+46fjbiajJsQHKQpSE
         JnoMEPrxHHyjEaO+x4cSKqqzOI7RkWUA4nbwRbFhcv2Th/PN3MuS9VV91MnNmganAaqY
         TyHWVgT3G0FAgjKIv2fUJ+dsOrAgw3zui1kYDM8VzG44LIQ9oiNkbPS/r6Psp9F3U4Op
         AbZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335952; x=1794940752; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        b=GsUgNWgoOxMU4bzoUw3YE9KzuoROtRCgXpqi1ScDfuTSGS1Tv5c1ob5Tb+XNX7BV0B
         Jc3av6yFrGKqhXaYADpLZI0Bfwo2Eoxsp8/HA3ZDJ8micV0Spwh6q+bW444vegYNrDkL
         HvCGKoWHQ3seW9FeCdhRWJlkE7x5JOfPadV+OY+PYd88OTOOe+PVsgbsxtcxZXAALKCm
         AQ/qRuWCJB5zPVSCSTofJyBwyqRakHQQXqW+UiiJjE0t50weKM3Vc9EuSfsOYfaEQO1O
         B9nM6kqHd9GDyOW65wSmE7+IIr6idyUgES93CPIrnePaQLTJpdlwKCxwbdRXHHNjXTQU
         l+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335952; x=1794940752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        b=r3y85W3RcsphoYIk9qe8DpgplqcRnAbV2b2xOkc6oE/vM3MjUSD9lAdzXDDg1+Lrub
         cRnkvXf8IgOG6BMkDY3/WsDaTDC5iXGevQe35DIILdULDTgUMPKEps7/MKknX6q3N3VD
         Q5jvkPjz9Gu6LqXBgSIR69VGETNYqxVhtmEd8HM7dR7Ferv/6Hw9wTMzqT0McIJS9DVm
         Df0Ugvngg9wzAdzuXMb0EdosF9mt12z62Ittm9C308TJbnu61OekX4R8nO1lSG2yyxk6
         OGf4ypyKEfBF2CGZyoN1QmA7O7BVc2oq9Xw+qc0OMW4hBWVI1RBkbskuI1i4saiK6P/O
         gr9A==
X-Forwarded-Encrypted: i=1; AL+hErHTPg0UCflE4xgErU4vGZKEDJPFaAEuJu+kowDGNPrMzN4BgFvAOtxuhWmGjhU6Z3SzgJ9WgXepd5Hr6A4etxi6@lists.infradead.org
X-Gm-Message-State: APuU4Z+5ABSCPMDdfVBJxnz8kiqONvPBBrrNMtn2Fb8lJ48ba+vQSGN3
	9jbErl1jksYjKW1QkMVt6ANeSbi2ag3o/EdYnt5wizP3okhyeDqTuj7UY4MCe2aOJlKbuPWm+3W
	e03AYxqA5tUi++b0wftB9Syqm97Pt6yE=
X-Gm-Gg: AYBFou2Pd0FFobAColBNm2ULphajABp0X930ogv0W2VEBX7mUTF5ExJmtMZTE4Xx9eL
	wT6quhxuM8u5Cy9jntgOZ/2Vbyqmbdtacu59wQiY45oycIPFFTPnOfxyxHZtIq220lrhanEeLiy
	AcLk92sbC0F4XiD+1kHGwWtW9Y9RvMoaMf4KI59pQqMXyhC4KVbJDYmZJm2rHRGqMZfTdWN724s
	n0SB+g2IOo3V1j7oI7m7pT9a+zZp3v4YdKt/X6t/w468UUWRWuuJGvxWgeHSjfV/Dpo+o8zCMxh
	TO2B/PCOer2OlK90lbJ7E5jP6SrAmN6M57taNUVP9r7x95q87aF83iWUbBYKHKlYJe7u28BiKVs
	mRxMZiQrqhLBpnjObYx0IMWLL543d9F2fHP9DOEh+mwCdGuvFp2CIW6ETQXewlnJQiBnd7c+b+G
	kuYRu6RCKDWzmwRxY6Cd1jmgZ7vTJHJSkkH64A523IvBzq+12T
X-Received: by 2002:a05:651c:b12:b0:3ad:de02:e9a8 with SMTP id
 38308e7fff4ca-3ae0967065cmr7621621fa.18.1794335952183; Tue, 10 Nov 2026
 10:39:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794334398.git.stefano.r@variscite.com> <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
In-Reply-To: <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 15:39:00 -0300
X-Gm-Features: AclHuK-Z_-LDXVn1T9DAos8gp7iZX9KtLfARNWk7UgbNlE7ndGND8A4QqRcbfD0
Message-ID: <CAOMZO5AuK9coQ5m3h7s3teW-jrX6a268aLSsgVbt2cbndGVSbA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8mp-var-smarc: Add support for
 Variscite Echo board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_103915_034654_8FCA95C5 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefano,

On Tue, Nov 10, 2026 at 3:21=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       ft5x06_ts: touchscreen@38 {

The ft5x06_ts label is unused. Should it be removed?

> +/* Header */
> +&uart1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_uart1>;

Shouldn't you pass uart-has-rtscts, as both RTS and CTS lines are
described in pinctrl_uart1?

