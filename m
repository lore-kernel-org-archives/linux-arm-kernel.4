Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B75606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NUwJkZaP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxivgSKK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=szOvPNyxohILp8ypzy0QBe0wsGgv+77VvcXMFL1pBiI=; b=NUwJkZaPn8zicd
	Axcf+iF7/i/fzi+TlNnsjfdmz4jDcWQ1cz6+B+CMo6lRbCyw557CAONuDRaHmColRCjomj1/nBXQq
	8coegVGVb2NdJtSD18Tp8sbtbgqcM3ogpRwZdN+8mhfQSCxGyW4COky8JUY+z+SfXytPZ/GTKX2OR
	a4KuimGc8QaAx2K+5iDaU0KGeITgOhn4WPo5gqUuPepShJ851VYHo4okcjsUC1TP5zy4YW7ll2Smq
	+dAiN8qMRtvzvRaBYINGNhPWuEmUx2kduKdVRgWuwKGNCL5SLi11fd+8LYf5qdtxpMPvoAt8o6vHl
	l3iDdVa5CxwGSMVsi6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNt3-0000000BkVZ-2sRf;
	Thu, 26 Nov 2026 01:02:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNsz-0000000BkVH-0NcQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:02:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8313E46357
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 01:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C221F0093C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 01:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654972;
	bh=szOvPNyxohILp8ypzy0QBe0wsGgv+77VvcXMFL1pBiI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GxivgSKKpMAbosqUk66Yg4iqBddCw16F7dBmuZ/OIP0+CNyedhqtebgAKbjN+lZA2
	 XzrsTS5KEpJLSeD7i+R2egKS22N6blaIWVzB/WxRu41zP6lA0V7+QCkPZvpkqw7h5Q
	 DcOPg02AYjxyC9fGtPeZRjn5JjC4cMvQzgeZQxsOnejhZh008h9JVM8EDPJVQul17m
	 7Q/84bX6YEho/gL8wI/w9xIbCWrZKQ6eQ6loBY+e89YwfZc5xTsc96jiVKhMtbisPC
	 5IYou1zn8i7X+GbyR/XnCH4jYewJzSOCfd0jwZdQwc4RUmVL5gRGW+fKTKoc70yQ3j
	 Fom+4k4F7afMA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso906724e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 17:02:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF2BqSfkJkcc7jx2GQyb7ChK+hbaceL3zxlypkkVldD0+k85WZFWpuZrPwh+J17+Gar0/yScgJs+0jqGSLabxO1@lists.infradead.org
X-Gm-Message-State: APuU4Z/F74d7+v75p+TFeBtNsAyg3XQPOm9gjhDnvooP8QWXuDNtwdC0
	34uPVRIYmAwBbv3UQ13w4YSRLtYKA58Afh+S/9DoxoEHIC42fsNjd0yRrZlxVHrJIyVHyFtlnBD
	mmDqwGAsnGxATgJudVS0VeLQvjftoKUk=
X-Received: by 2002:a05:6512:b9d:b0:5c1:5975:a6d0 with SMTP id
 2adb3069b0e04-5c1bc813d73mr5576689e87.49.1795654970525; Wed, 25 Nov 2026
 17:02:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-3-fbdce4565a5c@free.fr>
 <avs4l1otw6ACW5P4@SMW015318> <avs9fmJqYShOIPMK@l3017729.home>
In-Reply-To: <avs9fmJqYShOIPMK@l3017729.home>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 02:02:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLnF07h3Ng5O=xcgKhTEkV9ij2ptzktAfi2Kt45smdEjpw@mail.gmail.com>
X-Gm-Features: Aa3M54pY2u0gcwGTwDEHxrFaQf4DHIpe5Fj8K7AAC6iAolS08Y7XLFFoVNzoAr8
Message-ID: <CAD++jLnF07h3Ng5O=xcgKhTEkV9ij2ptzktAfi2Kt45smdEjpw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] soc: fsl: guts: add the RCW override of the pad muxes
To: Vincent Jardin <vjardin@free.fr>
Cc: Frank Li <Frank.li@oss.nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>
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

On Mon, Nov 16, 2026 at 6:30=E2=80=AFPM Vincent Jardin <vjardin@free.fr> wr=
ote:

> Then, since it was unclear for me if the patch 1..4 are through
> pinctrl and 5 thru imx (please, Linus Walleij) ?

I could do that as long as I have the proper ACKs.

Yours,
Linus Walleij

