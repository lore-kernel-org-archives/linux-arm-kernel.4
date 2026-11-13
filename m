Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3478E606A889
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T2VVLyfN;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=UvuVUa7c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qM+JJUMO/DvUphb/pAgQlCfxP7Oeza0K3hU8lNMJhDU=; b=T2VVLyfNgoxt+k
	7+/fuqR3yDKGD5tgeaOS2E0NRoay59ySIfDfPfY7t5z526/DTyL6LVQqR7aiIa47Qm1Z/KCbFKFZK
	KjY0UODVO16Fo3cgpFJ5pi/RKfXPK2yZgikldyVgZ10t7LaemTJrd8Txnc/R40a2t415GnS6A1Mbo
	85oFStbPHQSuGyyXODu/SPe3qqkmmzK5/9n/lHPRrtxFCPt5SnPf7gsHfMSIvgiwxzH7HIzRrmnmy
	KE59jvc/+NZeRVvnQ3fnrmEqEiM+Z3Z4dGxtRVBsJAVVxpxf1MNF8llbim6uZaCieafDaCzV6TXU0
	lSVzHyqNrN5HZ0DnaAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqwk-0000000Cp5L-3QlA;
	Fri, 13 Nov 2026 13:04:03 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqwh-0000000Cp4J-3yHX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:04:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34D5810CF8A;
	Fri, 13 Nov 2026 14:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794575033;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qM+JJUMO/DvUphb/pAgQlCfxP7Oeza0K3hU8lNMJhDU=;
	b=UvuVUa7cmd3z5dqWVM+R3nfaphFNNfAHsr+yBVbsjouZ9UT6f18G+NOJTrT1OxSGC6fNsd
	tWjClbnzcAJmjBolotlVRrW340sfSZzYfKIMSQ+ZOog0jm6cDAi3fkASbSG3eAGQsJN7fy
	2Ilmw1M4y8/aQlE/VcLZU6oSvyJEnZereoovRu/MJTqTCWOB8Sm56zVe3DYsIUSyQN0uP2
	4hoh4k8u0rcV+6rD8h2an7g9PqsMYTbY5ooLN5at+ACOnoiKl8kVcqx5jZ8jU9vERFaNOS
	uYGl56ZtweWqSUxCFQ69v1iigjunoXl8QqbwcxyUI7L9pP78GuDOPm3fiOCvww==
Date: Fri, 13 Nov 2026 14:03:50 +0100
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
Message-ID: <20261113140350.5c192ca4@wsk>
In-Reply-To: <45881f93-3f30-49e4-98cb-677814b85664@kernel.org>
References: <20261112163703.3358164-1-lukma@nabladev.com>
	<20261112163703.3358164-2-lukma@nabladev.com>
	<20261113-roaring-relaxed-oryx-5cfa1e@quoll>
	<20261113120947.6c9fb820@wsk>
	<c6095d41-09a4-4928-a55e-f4af7a5509da@kernel.org>
	<20261113132231.631638ad@wsk>
	<45881f93-3f30-49e4-98cb-677814b85664@kernel.org>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_050400_196019_01F2282D 
X-CRM114-Status: GOOD (  20.36  )
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

> On 13/11/2026 13:22, =C5=81ukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On 13/11/2026 12:09, =C5=81ukasz Majewski wrote: =20
> >>> Hi Krzysztof,
> >>>    =20
> >>>> On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote:
> >>>>   =20
> >>>>> Add "national,lm77" as compatible for the National (now TI) LM77
> >>>>> digital I2C temperature sensor.     =20
> >>>>
> >>>> Are you sure this is a trivial device, not like LM75? No
> >>>> interrupts, no VS supply? Datasheet disagrees.   =20
> >>>
> >>> In my case the T_CRIT_A and INT are not connected on the
> >>> schematic. Moreover, the V+ is connected to board's 3V3.   =20
> >>
> >> But they are there and binding should be complete.
> >> What's more,
> >> existing lm75 binding does not require these so there is no issue
> >> adding to the existing binding file. =20
> >=20
> > Please be aware that internal operation of lm77 is a different than
> > lm75 and hence it has its own Linux driver.
> >=20
> > It seems like I cannot re-use the lm75.yaml and will need to add new
> > national,lm77.yaml as lm77 has two interrupt outputs for hysteresis
> > (lm75 has only one interrupt). =20
> Can be a new binding file, "national,lm77.yaml". Indeed it looks like
> it has two lines, unlike 75 variant.
>=20

+1

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

