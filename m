Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC353606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eEeRbyZG;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T7CaaTj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hTQ12c5Ppjf+2QWFB73ZGvBVoo29MYEDLXFSwz+VyGc=; b=eEeRbyZG8OaMf/
	/ImHrWuIvSt4w6FI2ruiFP2mEdaG6xvNY7EGrnae8WC9DVB/HSe7gSdAVrMCv8m44bH/b/N2z7tiX
	6++KlghEqWw3b+pD9J3K9Dxy+XEyokqDWcU37KrJ/Kng3dBVTin3EnAZMHU0OIIF+1HlNfFnvbuq1
	77nUtqdG23f25tl+WLzpaYqYjXJjDy1MSy42Txn+8rVv3js1wqooTyBIQUXjX7vBNNSeJPmJyWeJf
	U7m+yci7oIxEOsxZob0brDbDxukEj1fph+yKM84AnNCmiIKBDwjD7485XyTaA+TCzUx1n8ZGROOOJ
	HJQuR1CS2kuhzVveGwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyCO-0000000GueK-0nFG;
	Fri, 27 Nov 2026 15:49:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyCI-0000000Gudl-2py7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:49:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 26E504E417C7;
	Fri, 27 Nov 2026 15:49:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9C7E6049C;
	Fri, 27 Nov 2026 15:49:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5C1A11E90CAB;
	Fri, 27 Nov 2026 16:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795794548; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hTQ12c5Ppjf+2QWFB73ZGvBVoo29MYEDLXFSwz+VyGc=;
	b=T7CaaTj0PC3ISk6zRNcygBGtdxfZTwziV3QgflktUZantBBr1A3j6dRTzSg9fQ2Gx1fPLj
	xm6l0IC6HCsiz+lDhf2vO7qE4IXkd6MVTM5LpGiSvI3lRit9Ko74JkKd2xVy2IhA31x9Sk
	MDiZn3Ft5ZiXWfkgUV/H+ajY91yiojfmuoBE1sZLrBKDWGfgEdneWam/Zg3TVRbhXR2Xwt
	Qg6R1NOfQFJ0Z1vceVpASK28RuzqrR/wEG3GCt0ka2WmM4YS1R8hHIQzb5cFyfh1CD+6Hv
	DleubNQHeBL71alQzvZV1Vo9rQ+SzCeJ5WUJgi+kV+APZpozB9fexU7UvAMynw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/7] ARM: dts: helios4: fixes and cleanups
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
Date: Fri, 27 Nov 2026 16:49:06 +0100
Message-ID: <874id21dhp.fsf@BLaptop.bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_074916_447300_15020BFB 
X-CRM114-Status: GOOD (  11.21  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rosen Penev <rosenp@gmail.com> writes:

> Fixes and cleanups for the Helios4 (Armada 388) device tree, checked
> against the board schematics.
>
> Patches 1-3 fix bugs from the original DTS: the board revision hogs
> have the wrong polarity, the PCA9655 expander uses an edge trigger that
> can lose interrupts, and the EHCI controller that gets enabled has no
> port on the carrier board.
>
> Patches 4-7 describe hardware more accurately: the fan tachometer
> inputs, the microSD slot's missing write-protect line, and LED color
> and function. Patch 6 fixes a dtc W=3D1 node name warning.
>
> An AI coding assistant (Claude Code, Claude Opus 5.5) was used to write
> these patches and draft the commit messages and this cover letter.
>
> Rosen Penev (7):
>   ARM: dts: helios4: fix board revision GPIO polarity
>   ARM: dts: helios4: use a level interrupt for the GPIO expander
>   ARM: dts: helios4: drop the unconnected EHCI controller
>   ARM: dts: helios4: describe the fan tachometer inputs
>   ARM: dts: helios4: use disable-wp for the microSD slot
>   ARM: dts: helios4: use hyphens in fan pinctrl node names
>   ARM: dts: helios4: describe LED color and function


Exepting patch 6 (ARM: dts: helios4: use hyphens in fan pinctrl node
names) all applied on mvebu/dt

Thanks,

Gregory

>
>  .../boot/dts/marvell/armada-388-helios4.dts   | 53 ++++++++++---------
>  1 file changed, 29 insertions(+), 24 deletions(-)
>
> --=20
> 2.56.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

