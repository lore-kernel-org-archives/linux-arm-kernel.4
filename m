Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5EB606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hGH0KfFF;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lJPVZ0ab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7Kmq+KrqsJVdamEglD05VlODQnyHuuKHPdii9uryj5M=; b=hGH0KfFFi3ZW98bPX0TG6g0XbS
	z+sicygZgEjbeJN2cwTBou/YdtVc48ttLEhYWG3YWJ50iXfArT3g/DuXVKLYEReWuqwdzteYV4YUm
	E0+l3ZAe2n16URMdy2m7IhDCQ60neA8vOzla80lI2U5SNWXjP8chy5MhI4eL09aRRHxfxno9DJljt
	Wfw5TJGKi6kiPMy4RW8Sy3V/Ywk4n6i4dfdnmrwiN75pIuQGtQAEc7ALol9ovWWuz8syhs05moioy
	ufn4ziJk4D3+lgMjn+jZqmqycFuuXwKje/3n6tIYLi9GGEYcSwYreQAPUFn/z2RaCZDeQWLcrvsnb
	sTanAZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxTF-00000005OKT-0D3I;
	Wed, 11 Nov 2026 01:49:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxTC-00000005OJh-2650
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 01:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794361788;
	bh=7Kmq+KrqsJVdamEglD05VlODQnyHuuKHPdii9uryj5M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lJPVZ0abKDf0DLzHSxMmK/yrfDVBM1PSNgzEXP3miyBlLjMlmo/se/vVUwfvQwlcL
	 VITk+MFatj7sSRTvURtTFEk0ASGPf6xwTmXgeOYp7cuInxpixCQwF97hyrmsR3/zHU
	 /BHk/NCbxj0MX2USlWM0Gwv3YbLAvPYVpZcDD1o1q3jV83Hcl66r4lMadsuTHhvxul
	 wwpQ1UKXQTrr0znFz/caCwZqbBe196VL/6ak6l2Ob5QjREQC+7Ih4fKKQuG35TWPxZ
	 4nopr6vQijOiHR2A9zc2pjMyBw5FBobqhn5zZPYe4cCgLRiiDpAFpekFTdjzmqFZfW
	 leYmOUgTYQH8g==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 92D0F64C3C;
	Wed, 11 Nov 2026 09:49:47 +0800 (AWST)
Message-ID: <a92395610d27fc0f97af3b27b150de61583c2197.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
Date: Wed, 11 Nov 2026 12:19:46 +1030
In-Reply-To: <599f1b31-f175-47df-b074-1915688eb390@linux.intel.com>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
	 <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
	 <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
	 <599f1b31-f175-47df-b074-1915688eb390@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_174950_736555_4FA73DE5 
X-CRM114-Status: GOOD (  25.43  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 17:42 +0100, Dawid Glazik wrote:
> On 11/10/2026 6:53 AM, Andrew Jeffery wrote:
> > On Mon, 2026-11-09 at 18:41 +0100, Dawid Glazik wrote:
> > > AVCRP is an Intel x86 server platform equipped with an ASPEED
> > > AST2600 BMC. The BMC is used for out-of-band management, platform
> > > monitoring, and system control.
> >=20
> > It's probably my fault to some degree for not providing a better
> > explanation of what I was after on v4, and for merging changes from
> > others in the past that were pretty lax on the description, but what I
> > was hoping for was something more like e.g:
> >=20
> > - f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM"), or
> > - bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")
> >=20
> > Are there more details you can provide? If there are, I'm fine if you
> > reply here with them, and if there are no further concerns I can update
> > the commit message while applying the patches.
> >=20
> > This also applies to the JNCRP patch that follows.
> >=20
> > Andrew
>=20
> Hi Andrew,
>=20
> Thanks, that helps. I also found one more issue in v5 (uart-routing=20
> issue), so I'll send a v6 with the fuller descriptions below
> instead of having you edit them. Please hold off applying v5.
>=20
> AVCRP is an Intel x86 server platform. The BMC is an ASPEED=20
> AST2600-based RunBMC module on the platform's DC-SCM. It supports the
> platform's out-of-band management and exposes board management I/O such=
=20
> as the system UARTs, status LEDs and control buttons, while integrating=
=20
> with the host's telemetry and management infrastructure.

Can you talk more about the division of duties around RunBMC vs DC-SCM?
Can you describe how components of each spec are used in the design?

What's the motivation for designing this module vs using another? Are
there any specific target platforms intended for it? If there are, then
some further details about those would be nice. If not, no problem.

>=20
> JNCRP is an Intel x86 server platform managed by an ASPEED AST2600 BMC.
> The BMC is the platform management controller for the host system and
> supports platform power and reset control, while participating in=20
> out-of-band monitoring and reporting for host faults during bring-up and=
=20
> normal operation.

You don't mention RunBMC/DC-SCM here, so I assume the BMC is integrated
into the platform? Can you describe the purpose of the platform itself
(beyond the purpose of the BMC, which tends to be the same for most
platforms)?

Cheers,

Andrew

