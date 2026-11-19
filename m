Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03121606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U04qusxA;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=ALNi8PxV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XQBhhzHd49eMecbJ9Ihf5iuvQwUvWADjs9cSukpLuKg=; b=U04qusxAb9venP
	Pv0vriw6MprlrFPGb61pDxugY/zr8DLd/QFW/ReTDFiIM6OCJDaOm6P4kSroZ3hYV53Nz2qV1hatG
	zx9GV8qr32EfNfYslG0mGuYIeYTWKapiIP7IzHCsQSr5z2akElJed8POert6fA/RJoLdzRh/7ZNYs
	/k+oQApOwqYFX71t9BTCbx5AZIGn8XGzRqPvEYfhwtYZwuA4BkdD02kNVDFIfMPBTl4xf/PCefS7G
	5mNmUjjZGdpjadOhnwdgrTBD691wlRy2QDPk/c6z5RPcf2Cg/SqTQ5btXfxFL4OFJIo0+oH4pwzVK
	/TxEMCrfRpzfJawwr2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyEj-0000000BMpj-1zob;
	Thu, 19 Nov 2026 09:15:21 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyEf-0000000BMlg-0k2c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:15:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8B1410AF96;
	Thu, 19 Nov 2026 10:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795079705;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XQBhhzHd49eMecbJ9Ihf5iuvQwUvWADjs9cSukpLuKg=;
	b=ALNi8PxVGHzaIPABW2PNN0O9FhC7zhTCvQcqUEV0cdvuGmFjbU88QtUDCn3hbezbtaErH7
	yxi6FVSMW/+vUsUeQEID0QcdIYcEGmkw0iOsycZKNOhBePJLaGSrrDpTO+8EPcApzf8Xc6
	8HbGp1gcr45bva2CeBZx4WO5EWElso1ymyHGWVKc/OpgvHl0Qia4ciuiQb1+a5f4xyfzDq
	c/tlV1TWZ0O3xGy8VN3r5zaL88J0ymwHbzobsEBxa8uOLvbXRFB5sae09hBJjzl+CtTSCX
	slQ9nTjkP/nugILxuxaf98T7g+kRLsmOyDdUUiMF0zLheMUez7TURUilHDBzWA==
Date: Thu, 19 Nov 2026 10:15:00 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, Jonathan
 Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: freescale: Add device tree
 definition for Cloos CBASE with i.MX8MM
Message-ID: <20261119101500.77f72411@wsk>
In-Reply-To: <CAOMZO5AiGRHNijfDcCXhsrQDwcWDwHNsxVEoHuEaGdVaR6JBWw@mail.gmail.com>
References: <20261116111802.2442456-1-lukma@nabladev.com>
	<20261116111802.2442456-3-lukma@nabladev.com>
	<CAOMZO5AiGRHNijfDcCXhsrQDwcWDwHNsxVEoHuEaGdVaR6JBWw@mail.gmail.com>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_011517_487328_1B43E8C0 
X-CRM114-Status: GOOD (  12.50  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fabio,

> Hi Lukasz,
>=20
> On Mon, Nov 16, 2026 at 8:18=E2=80=AFAM Lukasz Majewski <lukma@nabladev.c=
om>
> wrote:
> >
> > This commit adds support for CBASE board, which incorporates the
> > TQMa8MQML module. =20
>=20
> You missed addressing Frank's earlier suggestion.
>=20

Yes, I've overlook it. Thanks.

> Please use the imperative mood: "Add support for CBASE..."

+1

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

