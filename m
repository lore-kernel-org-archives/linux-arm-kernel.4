Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3C3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cfiemB7e;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q63onYis
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/P1Weu2PiwuX7ixUHU+bDOjpA+nCOolYU9ZGOscj7cY=; b=cfiemB7eEqabAwJ02qPRncmXNc
	+3fgqjIdREgOQRurtC4sysEQlAqAsh04mzr3rk3HmloaxF+LQaLtwBNJzv5PGgcLzw+ivpcXVmtc6
	Gu7LHm1XrL2bF4ztpIhLUi/eRhl+ExIJDheDzO7rw7cwFpsyry1MobMaxaIB30j6kO79lh9y42zcU
	y18mNrC4KIArDoE9nkWyNKw0APvYRvTnsZtR054eGAa7auKGHwpaoggxkfuwmpV0hx/wulW1uaS10
	r23vpfwQWWM2udLCYqgUOuYWLWYL8taCpW/B80RE8FnuMjhCf8MwAZvL1p8spVPPFuUcAJ5bUXeKB
	h/u4Wgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsBU-00000006rCJ-20ZP;
	Tue, 24 Nov 2026 15:11:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsBM-00000006rBE-137b;
	Tue, 24 Nov 2026 15:11:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3C73626F3;
	Tue, 24 Nov 2026 15:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B841F000D4;
	Tue, 24 Nov 2026 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533102;
	bh=/P1Weu2PiwuX7ixUHU+bDOjpA+nCOolYU9ZGOscj7cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q63onYis4GcqymyPW+s4d1Gic0Vl1Bg289N1RTm74Bb3nNaAHPDyX+EgSfz5vf2RV
	 EXBJxXAIt2krBCFDIAcmUBi6JOzozTs/RWsPl3oMWxHHahbtLRCv8tYS135yql945a
	 xnGdDhyhv9HMQDIFBRTfyDEpynz+nvw/6bROlibLawuLj8YhUNP8+ZxW9HXNh64yPz
	 AigljJUyO2fnQ0/6RhdXEJsDO5K5wAobXC571Sm8CcPYZtIcRVuZbwgL3SyHhgSPem
	 lHiEDoeYLux28PzNfSGaJrzb3t2S7gA/GCxp+5bAmz6QTp6Wz07RgI9+DKxnShVlXw
	 8kjBEXB7hjb4w==
Date: Tue, 24 Nov 2026 16:11:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	Gary.Yang@cixtech.com, fugang.duan@cixtech.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261124-affable-durable-hare-6566fb@quoll>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
 <20261117022858.2210212-2-hongliang.yang@cixtech.com>
 <20261121-friendly-slim-jackal-fecccb@quoll>
 <20261122033600.25806-1-hongliang.yang@cixtech.com>
 <20261122034004.27137-1-hongliang.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261122034004.27137-1-hongliang.yang@cixtech.com>
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

On Sun, Nov 22, 2026 at 11:40:04AM +0800, Hongliang Yang wrote:
> To make the last point explicit: there is one instance of the PHY IP. The
> two lanes share the same APB clock, the same reference clock and the same
> reset pair; they have no separate clock or reset control of their own, so
> they cannot be enabled, reset or powered independently. The per-lane
> register windows only describe the two PMAs inside that instance.

One block and one control set (clocks/resets) does not necessarily
exclude two phys. You insist on programming the lanes together, which I
am not sure is actually required, but I don't mind - it's your device.
The ABI will stay, though, even if you decide to change it in the
future.

Best regards,
Krzysztof


