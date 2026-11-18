Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C75D60A261E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhgSO8AA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHi4w3mk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3PuxUg1W68XqcVeQwdFsUJ1UdoYaIGk5p/NFYNEmsqI=; b=IhgSO8AA1t9YlPneuUNymmmEHt
	tnkBuCNhD1G6T9ZDo6V8YM2mvHt+6XNE9veWL8dncr0abWudVxI9mcLKi22Q7VMTCrXhyxVmyH7C8
	EOQ5Tjg64pR3nqU3by1CUYMahbAui2JV9y7x3iOE4+Ti/Yqgq1UgkKQGlHNT4cBS03PB46Z6SUYTL
	TEchUvE4jsIdD3SIM5LaX7SFP8ShpW8wNs4hOlIu0v+IWDgDXNCiaNdpSiXH591fkNI6vB7oVXxh0
	JA+vGObtj2jVCPhz7kVgfv2NdJiZyHVIyLu8bocNbPsjrKQzsu7BXXd4PmKhTTl/DKY2IrrD3tjr3
	nP41qW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiez-00000009YDu-1fR2;
	Wed, 18 Nov 2026 16:37:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiey-00000009YDf-0Zjz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:37:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6B1462A2A;
	Wed, 18 Nov 2026 16:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D881F000C8;
	Wed, 18 Nov 2026 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019842;
	bh=3PuxUg1W68XqcVeQwdFsUJ1UdoYaIGk5p/NFYNEmsqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dHi4w3mktKxZKBR1jENFnTDvtk0OFCuIffS1Qy1+yvVPh6ZnusJAqE0i7QzQpsjbj
	 jUjdxWg7RMTI/xHAAi1NmRfjEK8Af7Fc2ckpfrw3JEDirV+XF7E1edY6H5Ng8XSC0r
	 17dmY4BLbpsi74rxY9jaSEelrlgVsqpsf6inteVkE4xOiCy34R8w0jUjNKuMdyla97
	 WGRqC7HUCoO+rcwKBYVJw89fUaOU5yVymq7sSq2NoF9xUOl+UWprlLZEmdnZtA3acZ
	 UIyiL7W6GephTCaa7GcFvlGJqI/tbMNl/ZEg3CjIm1psJ4mkSdY47kJefi52zZyTEP
	 CE4Xy4j1u555Q==
Date: Wed, 18 Nov 2026 10:37:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v4 07/15] dt-bindings: watchdog: st,stm32-iwdg: add
 access-controllers property
Message-ID: <179501983985.2891459.3666177158331281459.robh@kernel.org>
References: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
 <20261116132416.1184447-8-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116132416.1184447-8-antonio.borneo@foss.st.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 16 Nov 2026 14:24:08 +0100, Antonio Borneo wrote:
> Add the optional access-controllers property to reference one
> domain access controllers protecting the watchdog peripheral.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261106163429.618392-1-antonio.borneo%40foss.st.com?part=5
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


