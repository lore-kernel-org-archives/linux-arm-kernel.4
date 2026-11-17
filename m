Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5B9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1IbNtBwl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnL4jEBq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SX9Zi7NY4J8KuGZWjjWNN3iulz2Qoe+4jXdOY+ezcbE=; b=1IbNtBwlDd1WaN
	xTUWLKyKWUxOcwpJPFFxRqpRtBQsuvaQTFAZaQ9Xnp6ZYyLt1HLYfKBFvVwQ7aqvtuhBEjlLBC+C2
	X1OUGaZafVloBZQ6p3ajN57fOZSlr/ZcvafxJSzac8PYmGPdBo5DNJNglCsr33df8j82axeAGUKPa
	PERFH4JYRhSYRChFSEVipYs/KATidVxuGiZZBcj7V3JHn5MgFTOwpe39N3WPPo/nY0CFNqug0bjCO
	dlrIoltZWeuExqFZHbyJhNhsm47weARwiCjZUfTKiSG4Mv2AAtdLFuVfVpJjldyXguYo9OCWiyErU
	VPpaJWvDtxIO1yeAN7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN2h-00000006aU2-0EZW;
	Tue, 17 Nov 2026 17:32:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN2S-00000006aPn-14pF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:32:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EBAEB400B8;
	Tue, 17 Nov 2026 17:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6271F000C6;
	Tue, 17 Nov 2026 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936730;
	bh=SX9Zi7NY4J8KuGZWjjWNN3iulz2Qoe+4jXdOY+ezcbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FnL4jEBqMmo1Tm13i3F3Tctwn2yptPxG+RHBaq/ZLxtY4tJFHdHDPnQYpH4buLVd7
	 MyjaKO8/+SRdkrgAko/D2lUJSLbQdhSalUwfAdDLE5wdna3vvAAZurz2Uu3X76hwkr
	 vKckrsv5X0dMCf10Yp/6LwI8gtzE3b5IT9rQOsHaJMezBMiBrH4Ih1N23ESQ/8DBtg
	 IGoLXLHikvJW7p5k1x6bLt02W2Q0iuI91LlbnMLcDTt8hA202E6nLyM6noRw4SGCIp
	 KhitF5A52/weplifIqUOURu+mGBTASoy3BzV8rGfaNVmPpk9021wAXYURzJ5G9wYe4
	 GTgh1+mnRpnbw==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH] arm64: dts: apple: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 18:31:45 +0100
Message-ID: <179493661268.33444.17877290451078457632.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On Tue, 17 Nov 2026 14:06:17 +0100, Krzysztof Kozlowski wrote:
> The atcphy and touchbar aliases were never approved by Devicetree
> maintainers, because they were never documented as actual ABI.  Drop
> them, because no new custom aliases are allowed for years now.
> 
> This might break users of this undocumented ABI, so these should be
> updated to use only documented and approved ABI.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[1/1] arm64: dts: apple: Remove undocumented, unapproved aliases
      https://github.com/AsahiLinux/linux/commit/477f3d0f46b0

Best regards,
-- 
Sven Peter <sven@kernel.org>


