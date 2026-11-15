Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90437606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LHM/Zp6x;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mJ5C3PhF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6fWr66mLdGMUcPCfj2lY5yCay2OcZCA9qUhBwidyWNs=; b=LHM/Zp6xMFxG3xqMyscWQmc/TI
	Bnwr3JEUu8r+btY6pgWV5shM8jFct9UrkHP4ghPgeGNeIfe5opGRz74r5fHCSJYMGgCTcoPzSuaAY
	oeAoG9xe1gTlDYwOZvtLlcL+nRxzK2qfq94xresykg7oVlJSg/Me/yY3uGM2hf/Zag7XEdS1yAjdy
	uHiFz80TcE/muDLnsHfj7mCI1cHy62eovBP5hMxDoxSIAYQL7YFdvBR3e9YygZcK6BEnhe/YrfI01
	1mfum/nwWju4epgnZr52INZV70+Y5yilNCr4cFmM6e6jMtbKaGdmDh+GkhUG04Wf35j4lM/ZGPpLJ
	DCJ6bNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjSY-00000000hom-1xvZ;
	Sun, 15 Nov 2026 23:16:30 +0000
Received: from [203.29.241.158] (helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjSU-00000000ho8-1pZS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 23:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794784577;
	bh=6fWr66mLdGMUcPCfj2lY5yCay2OcZCA9qUhBwidyWNs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mJ5C3PhF3Ubvh+ERFg1RVv+/p8e/beY7R3lbHUreYXp2Ks5lkZG5P2Yqau+Znd1Tc
	 GSloz2NUdiHQmdyFMwVG/C5auPC38/cujdEB+dH9CPMATkceOmGPrMUx8mTxAepKCr
	 aQaHSdgkr+CnoX+jJ6+0JQZbSqGQxjndWCTlZbNT75/H8e93b3xeyk3jrgxBzJaJrJ
	 yRrqRfoMNBh8aljOnF2WLCSZnbap3NrGAzMYCEAM1rwvl+wblKQLPZxAmRhbzgVx1Z
	 YkyvYTb7T4UnCA2yAb3J307fhqKhhAo4KFQtQSQuwljM0rnIRRKIzOumV24fEmxHX5
	 uDu+AuK1fCjiA==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 713FC6005F;
	Mon, 16 Nov 2026 07:16:15 +0800 (AWST)
Message-ID: <91dd4caa78cff5961b5617958f4f7985ff55724c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com,
 devicetree@vger.kernel.org, 	linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Date: Mon, 16 Nov 2026 09:46:14 +1030
In-Reply-To: <179455982636.2173009.10261089569510079520@nvidia.com>
References: <91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
	  <179438627442.2016371.12057101111349178921@nvidia.com>
	  <42bb0b817905637239c16b94a562254cd0e6a644.camel@codeconstruct.com.au>
	 <179455982636.2173009.10261089569510079520@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_151626_698589_9D1DE492 
X-CRM114-Status: GOOD (  10.07  )
X-Spam-Score: -1.3 (-)
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

On Fri, 2026-11-13 at 16:57 +0800, Jacky Huang wrote:
> Hi Andrew,
>=20
> Thanks for clarifying. My previous description did not explain the
> purpose of the platform. I would like to include the following
> description in the v3 commit message:
>=20
> NVIDIA MGX Vera C2 is a dual-socket, air-cooled 2U server reference
> platform based on NVIDIA Vera CPUs. It provides a reference design
> for partners to build and customize Vera-based servers using the
> MGX modular architecture.
>=20
> I will also include the following public links covering the MGX
> architecture and Vera CPU:
>=20
> https://www.nvidia.com/en-us/data-center/products/mgx/
> https://www.nvidia.com/en-us/data-center/vera-cpu/
>=20
> Hope this can help others better understand the role NVIDIA envisions
> for this platform.

Yes, thanks for the extra details.

Andrew

