Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028A60A3813
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B4YOR0A7;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=J61J2RlG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LILqZ9d25qxhyozULVof4EbcCGZnSzSqiXpRZ27wbGI=; b=B4YOR0A71RU/WV
	KSCd8SNLy/epmHbSn84SduF1NCjrLCLEh2exPxQlrqlAMtevOP+nc33FrUskrbRyC9Ky7WIIpnPbD
	+NW9Zm8UvfZaL98azdMlA1hhu2UkoB+mNeaeH8eOBsSOmVxVpo5J/ae8WogPvLpXWSJrDUHeIJAqw
	hJ0uvZz5vwkc0fsHknvNhBhZ1Tb9/ZhnjpJ1kvyLWLhSGxmj6VSNlwM4RqgqtgHkKI84Ik2KJATYV
	1S+SxGnQ85cOVFOvlILt5G6YmvpIsmkFKbeuLqIttsicd0OfrbEh1V7DItaLAP1gCdA3mWOCMHgAk
	2TSE7yl95E9eRffyJszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqIn-0000000Cihv-2sPy;
	Fri, 13 Nov 2026 12:22:45 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqIk-0000000Cigt-2PUR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:22:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B2BF10D083;
	Fri, 13 Nov 2026 13:22:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794572555;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LILqZ9d25qxhyozULVof4EbcCGZnSzSqiXpRZ27wbGI=;
	b=J61J2RlGRjEsEE6mYDlVh+W6EKAnBwQMCIPUPIH5V5wET80lOO2qzOauM2FK9+G9Ag2g68
	ZG7JTelmpH6iJOVn9HTxL0Mgx9L/ZigrBjyVjAOARyMJX3IHawEJ2RJ5XZIFWmhSqDSr7E
	Um+kdq6zBt1rDvK5Dk0ipM1ckQrbNb11VBnxQfVBqtabkue3JvwfWo37SoCP8fHA6/j1I2
	YoDoMVPToxUZcDexRhB2EN4JIgKrBeRW6IX786drIaxGM92xezYHGchkxe/7GiDPx7vdnx
	7ooM/pj4dc9GKdLI8ioQzBXjzpYhLma8ZJCf6IwyvzjCVEbfO4KAYo4DYMACIw==
Date: Fri, 13 Nov 2026 13:22:31 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Daniel Baluta
 <daniel.baluta@nxp.com>, Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261113132231.631638ad@wsk>
In-Reply-To: <c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
References: <20261112163703.3358164-1-lukma@nabladev.com>
	<20261112163703.3358164-2-lukma@nabladev.com>
	<20261113-roaring-relaxed-oryx-5cfa1e@quoll>
	<20261113120947.6c9fb820@wsk>
	<c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_042242_753021_4882DCF5 
X-CRM114-Status: GOOD (  18.20  )
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

Hi Krzysztof,

> On 13/11/2026 12:09, =C5=81ukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote: =20
> >>> Add "national,lm77" as compatible for the National (now TI) LM77
> >>> digital I2C temperature sensor.   =20
> >>
> >> Are you sure this is a trivial device, not like LM75? No
> >> interrupts, no VS supply? Datasheet disagrees. =20
> >=20
> > In my case the T_CRIT_A and INT are not connected on the schematic.
> > Moreover, the V+ is connected to board's 3V3. =20
>=20
> But they are there and binding should be complete.
> What's more,
> existing lm75 binding does not require these so there is no issue
> adding to the existing binding file.

Please be aware that internal operation of lm77 is a different than
lm75 and hence it has its own Linux driver.

It seems like I cannot re-use the lm75.yaml and will need to add new
national,lm77.yaml as lm77 has two interrupt outputs for hysteresis
(lm75 has only one interrupt).

>=20
>=20
> >=20
> > Hence, the conclusion that this sensor works as "simple" I2C based
> > temperature sensor. =20
>=20
> Only because you posted incomplete binding...
>=20

I've posted information which is in sync with what I can test and
validate, but I do understand that I shall follow the policy from file:
https://www.kernel.org/doc/Documentation/devicetree/bindings/writing-bindin=
gs.txt

> Best regards,
> Krzysztof



--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

