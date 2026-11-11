Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9272606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UgfMn/o6;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=BannX8Mc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RQwFcfL/S5fxoV5ZZP6bv05kdrQN64Lm0MhAqt2DEsc=; b=UgfMn/o6WfvVFC
	vqtEajhLbBwhg8Y0+X+0PJdReWYRB/QoHWWwiNiO6+qQvX/yAOkcM+jk2w3yATBA+yMB5DZqfjtSI
	pje3xeCDLdN4r1ngeWQVb+yHzTtxuw1YSe2eH+WI/nQ8VH01Nu1nWew5nnpN379+fAYcdpGsi278I
	ITfX6g4ItJpqXtd0mX+qEKB1mO4WzRKPs1cn0qAYhbPuZ7pQBxEmEVvFbAKJ5wfnzEw96Fs65cs27
	kvg1W7HSt2IVShQKtrSbQfzJG7AiiQQzEfGqH/9cOsFTZExJ6D+fOiHdqvkxNTHBlZCOqH8DsxmBa
	XBeD0HCIt9e8Ljwn4Gjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3fc-000000062SV-2xqw;
	Wed, 11 Nov 2026 08:27:04 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3fZ-000000062Rm-3Ae6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:27:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 369B910C661;
	Wed, 11 Nov 2026 09:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794385615;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RQwFcfL/S5fxoV5ZZP6bv05kdrQN64Lm0MhAqt2DEsc=;
	b=BannX8McrFBDBCC3NmFHLmcApL9Z1rk/kCc5wmDQFuuInZHQgQGXOYM/mk1K5OgmNBwbFH
	TtUsXsSvk9lTk84m3PMNUgJgEDSI7g1E3Lfgkq3woXurV0pUHDRCQYFCoGftni0H6uTYSv
	ziDKGqcLVVJB3g9Xm+KcVOTj5DsTJnVhg4OgGxEL5c6O+5PBgoXSWbzL3aB6nd5L0tTo3K
	5Fi50EH2VIqxCQu4OZazETRYvLYHoU9hzpvuCSMMFrTxKH+V9XIfFVlQsrjZJ2j/NI/02P
	pWzsLExAKOzlxRE3ZNxr/whxlsUDMA7kv9ePB6cbxoh1XhmTPCZyFo/BwzypVg==
Date: Wed, 11 Nov 2026 09:26:53 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: Add device tree definition for
 Cloos CBASE with i.MX8MM
Message-ID: <20261111092653.0df91d0d@wsk>
In-Reply-To: <CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
References: <20261110150546.1535950-1-lukma@nabladev.com>
	<CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_002702_004046_7D4CFEBE 
X-CRM114-Status: GOOD (  17.83  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fabio,

> Hi Lukasz,
>=20
> On Tue, Nov 10, 2026 at 12:06=E2=80=AFPM Lukasz Majewski <lukma@nabladev.=
com>
> wrote:
> >
> > This commit adds support for CBASE board, which incorporates the
> > TQMa8MQML module.
> >
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> >  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 577
> > ++++++++++++++++++ =20
>=20
> You also need to document the board in
> Documentation/devicetree/bindings/arm/fsl.yaml
>=20

I've sent a separate patch for it (the same as in PHG).

> Make sure you run 'make dtbs_check' and that your patch does not
> introduce any warnings.

Yes, this shows no error (at least for the board, which I do add).

However, there are some issues found by AI review regarding the DTS
description.

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

