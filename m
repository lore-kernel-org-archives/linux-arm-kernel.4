Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917BA606A8A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQ4GHcvU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HaRvVopr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=smsm9ORhlPLDL5Nh8b0iZrku9Rm60/Khp9VarBhUFVE=; b=eQ4GHcvUbpxTqm
	d7iICJESu4+dkhYP3vXTSSdwqqKt3C+BbfYHwz61XkgVP47c13ArAboyPnnwfv8pryGlZy2RTyoN4
	/1k0+0U9bhslbiEjPIyGDBqYVudMeo9Oh6rNfl/QS0EKBSrpZatmhjmQo95BvVzsASCJ/xsWmApdk
	zX183lNap1IlBwys1u7fktC/vZoU0zoFNBPgpGFYUGNf+h3Mko/Hz5vhoy7gtgULKSb6ch3b0PeLm
	WKEaG3NlbWsLBZpSqBJovH8wcTsZSRL/+5LWIVrEW+0tNgINecobcmZI3A1nylb547BclvYAUI+0r
	edmBP/qjkiG0niUmUVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDIP-0000000G2DO-1Wbk;
	Sat, 14 Nov 2026 12:55:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDIO-0000000G2D7-2OF1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:55:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6FD862435;
	Sat, 14 Nov 2026 12:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999561F000C4;
	Sat, 14 Nov 2026 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794660951;
	bh=smsm9ORhlPLDL5Nh8b0iZrku9Rm60/Khp9VarBhUFVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HaRvVoprCDXokhEvfXZunmRZ57OmBK16G+vrZvsktNqZvW7E/xHKpv36TJTsWKYT5
	 tTMPncTJThx6q/vu9xmS01xlENgIj7cvILxowW59ARBvtu/gjo2TewkJsYVMyTorW8
	 qtJztDUvKjpG8nHDxthKgjsvNqtB/fIUpqhMfY1qN2ViK1Q7vW3fJ4bL8XNtK7wYAY
	 4a/jl1QUtSOCKf2HYMCt80ciwPqM9Di8KqOO88qAvNfB4Vc7Pxj7BbQNU0ujjGe6DP
	 Oxp9cLMtLX6vNE2iQbiEkdJgFHw8+j5znujzqq5L83FIvIRJnGzg+/CQKoomalIMqm
	 X9cCjnXmhtlJw==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/9] Initial Apple Silicon M5 device trees and dt-bindings
Date: Sat, 14 Nov 2026 13:55:34 +0100
Message-ID: <179466091298.20315.10220651986509721816.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
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

On Fri, 06 Nov 2026 22:24:49 +0100, Yureka Lilian wrote:
> This series adds initial device trees and dt-bindings for the Apple
> Silicon devices using the M5 (t8142) SoCs.
> 
> This series covers only a minimal amount of hardware, which is useful
> as a basis for future developments. The hardware added here has remained
> largely unchanged from the earlier Apple Silicon generations.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[1/9] dt-bindings: interrupt-controller: apple,aic2: Add t8142 compatible
      https://github.com/AsahiLinux/linux/commit/d2ece48ec448
[2/9] dt-bindings: arm: cpus: Add Apple M5 CPU core compatibles
      https://github.com/AsahiLinux/linux/commit/29d432305187
[3/9] dt-bindings: arm: power: apple,pmgr-pwrstate: Add t8142 compatible
      https://github.com/AsahiLinux/linux/commit/a61030626ec1
[4/9] dt-bindings: arm: apple: apple,pmgr: Add t8142 compatible
      https://github.com/AsahiLinux/linux/commit/ca25b9f84383
[5/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8142 compatible
      https://github.com/AsahiLinux/linux/commit/d60bedaceff2
[6/9] dt-bindings: pinctrl: apple,pinctrl: Add t8142 compatible
      https://github.com/AsahiLinux/linux/commit/d39d10bf2b37
[7/9] dt-bindings: i2c: apple,i2c: Add t8142 compatible
      https://github.com/AsahiLinux/linux/commit/b2755abb177e
[8/9] dt-bindings: arm: apple: Add M5 based devices
      https://github.com/AsahiLinux/linux/commit/33cfb254ebb8
[9/9] arm64: dts: apple: Add minimal t8142 (M5) device trees
      https://github.com/AsahiLinux/linux/commit/b9a12ab2c2d5

Best regards,
-- 
Sven Peter <sven@kernel.org>


