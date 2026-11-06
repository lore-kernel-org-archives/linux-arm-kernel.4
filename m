Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F717606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 19:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xWYSchNQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRM195IP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FWoIj6liytooXdy4J5X8/rhyOjRa8fsYIflXbsEmQ60=; b=xWYSchNQfd+lii
	HDEW/8uvaTRY6n/KAI/TUms7DXua23C90SYKK2uUr47/UtyVTyst3QSn5M3rQYpeYEkrkXP+5GD3A
	dAofnnh+NVIH8kSi7BtG6wSkDAgCVhh8LBI4+Rc6Cx9Y+jo+8wq0eiByNCHtdVm7aTgxPmKfPcsTC
	+XMTI0YY5GHW5eqYM+svj/eHDUzTEDa5hDIz/RZ2CFlg9CcsL04Kf9tCOFE9HPmKOaKFuWlxT/jHA
	ExFUQBFGRhScVqvlMyaMtgM1UF9wPv+55ZazV1Cm/hc9iXDh6ob0yFDdVZUR6yVT2qobuuSBFsosU
	kxRvrN/xtHdiMpPnr8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPyn-0000000DYce-0VjU;
	Fri, 06 Nov 2026 19:52:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPyl-0000000DYc5-20UH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 19:52:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B540D43F30;
	Fri,  6 Nov 2026 19:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1261F0089F;
	Fri,  6 Nov 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793994722;
	bh=FWoIj6liytooXdy4J5X8/rhyOjRa8fsYIflXbsEmQ60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gRM195IPeXcFlP41Ze6+edyjNYkY+yjIMs7gFzitL8c+DZYskErazrJIGklyDM1PN
	 V46Cn5f1olE3VaoYNtvXMCsXZD4gDyFEa9+S+FFxoxl52RroALl0nXm5QnpeOFVgyN
	 am/pZdcrPdQssfZOyjgJlauXBzOmRSiWTVrXX/GCOQKjjwFoh9HDvxwPZ1wSF0W+7M
	 bQBASqaeN3ddSOeUEK2PIKX4EP4QuQnDeYqEezuRCGYKfS7IuQGfxjli9LG72m5nQr
	 k0M4zvh1uJRcR8wKJjfUL/MW+0FlwEcMzA/MG6frL5Vpta764zjO3i7PuA6JjmfNLp
	 +xFbE0/gNy0dw==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: dts: apple: dt-check-style strict fixes for Apple M4
Date: Fri,  6 Nov 2026 20:51:46 +0100
Message-ID: <179399468585.85920.11928833306229144804.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 06 Nov 2026 17:56:12 +0100, Yureka Lilian wrote:
> mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
> this makes the M4 device trees broadly compliant with
> `dt-check-style --mode=strict`, leaving the same exceptions:
> 
> - the property-order and line-length issues in the generated pmgr nodes
>   are left as-is
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[1/4] arm64: dts: apple: t8132: Fix indentation-related dt-check-style issues
      https://github.com/AsahiLinux/linux/commit/c1d0c2e46812
[2/4] arm64: dts: apple: t8132: Fix blank-lines-related dt-check-style issues
      https://github.com/AsahiLinux/linux/commit/e63df4a6b4af
[3/4] arm64: dts: apple: t8132: Fix line-length-related dt-check-style issues
      https://github.com/AsahiLinux/linux/commit/0199d5131009
[4/4] arm64: dts: apple: t8132: Fix ordering-related dt-check-style issues
      https://github.com/AsahiLinux/linux/commit/84a1163b0a3e

Best regards,
-- 
Sven Peter <sven@kernel.org>


