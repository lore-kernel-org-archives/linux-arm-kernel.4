Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F0F606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UpvmKdi9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S4pAzdKF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2T/QcvQ2Yphv/huMc6rBh8hKk0f1eB+rNviqWaA88NY=; b=UpvmKdi9oJttSKugEV/h98jk+S
	Qe/iCtW6UdG5lCDuHVxao2todIrLXBaWQW0c+1riiJQDciMLCRGne3V8vR7c/Y7u3MUNA4o9uSbKu
	U/pDjXT+JtjikIFlGkY68U8o/1oJlpSAx9Z5ld6Qc1TGM+zkW2azny8j/Nwagm+NAIf97+W4COExZ
	1xnsRhtgy7dSUYpFlPwM6MCECue2Ls92/kneEChrksHdbIiijWWuxonvVmlzXAo7UxBztYS2mukUi
	7hfix7Zfl6wRdBqWAFtyttrNxW3s0NWAi0tie3YG/PXbUO2rZa0NkiaIdpiVsWanZzszRw0TpSqiq
	v9snlvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXkG-0000000AbDm-1med;
	Thu, 12 Nov 2026 16:33:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXk0-0000000Ab8k-12fn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:33:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DD88408D1;
	Thu, 12 Nov 2026 16:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF52B1F000C4;
	Thu, 12 Nov 2026 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501215;
	bh=2T/QcvQ2Yphv/huMc6rBh8hKk0f1eB+rNviqWaA88NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4pAzdKFnKVDyxqeD82aiS1QwGVgCR01falNqvoUebLF0aMPqNOmABLpTrygnPmCj
	 boD58R7DuJaLCioWbLVsvmlqYdHx5J/yHrfmmh1wnS5qNdYkZyMPXeQOxSmJ8blPZO
	 AC88g4RlfBLDEViaMDnRSQVSP2QpWbIMlGOf9w1IP1QrjbjmsDZx37rEmh90d0nJcr
	 ISRFghBtE2pH4i98RjNo9j/qfgLl3b6cdfj02jxrWdvkuoVfCehUKaO4HajI1spCD5
	 QL0DVOWnqv61ya7IYLU7XLYpdujQcjdkEVGcSUlArGopZorJpf1MmVH4GkLUXvqJth
	 /6IzYxdt10hPw==
Date: Thu, 12 Nov 2026 22:03:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6563
Message-ID: <avXqWxBQBK2lKPMv@parshuram>
References: <20260930214729.809649-1-marex@nabladev.com>
 <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
 <auGdT2kdxwfbB_ol@parshuram>
 <0865fe86-3ea1-4ebd-8ded-642eff159b97@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0865fe86-3ea1-4ebd-8ded-642eff159b97@nabladev.com>
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

On 10-11-26, 14:59, Marek Vasut wrote:
> On 10/28/26 7:59 AM, Vinod Koul wrote:

> > > +CC Vinod, is this patch OK with you ?
> > 
> > Looks good to me, I will pick this after rc1 (monday)
> I would like to do a brief reminder here, so this won't get lost, since rc1
> is now out and I don't see this in dmaengine.git.

I have picked it up in phy tree...

-- 
~Vinod

