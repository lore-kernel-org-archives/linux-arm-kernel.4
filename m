Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14C2606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v2GUEksD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5T6wx0b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l2yGCyd0WOkWatITgKbibGfxPc9WbZpzN9WO6vvnkw4=; b=v2GUEksDLQl9YzUlgqaTDkBa7r
	2WJNJMwQ1c1bWRU+4lMJVJPBAOuJt14Km2tiDWf3SQAwV6LGPqdTLL2pMShJ23/0epS1HySQSNjoX
	iLnk0Ih0/aZdesGF2IQikKXQUEs1LakjSo1FRxEDL9uwMOaZgc3v8AW1nlaw7EutSn2W3L9kcPnDJ
	98KSvW3cEVGdZos1PYeZcazVWNs7BECbmIn1tRY9dq0GV+8exnsMlaCB135/GkUWbEJNE29ZSVXVr
	fdiBKy2j8MC8FMKhKImZ3d6N6zYkMgZbsKyPUIdmXHFOjjkcQ/seg1qhcpzUhAXNEaw+Br918T9C5
	XEudYKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7fb-0000000DBJX-36vB;
	Thu, 19 Nov 2026 19:19:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7fa-0000000DBJP-2qEJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:19:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4032B459A1;
	Thu, 19 Nov 2026 19:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27851F000C5;
	Thu, 19 Nov 2026 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115981;
	bh=l2yGCyd0WOkWatITgKbibGfxPc9WbZpzN9WO6vvnkw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5T6wx0b8lOjgrFDMvRhVsk5I5tspkzk9dL51eD5ZDc4WZHBeR5bZCo/jF8+n9wso
	 VKIoXy8Tc6tNgYLtwsUA7H4WKMsDFXqF2Q7reNxzxFjYNVDbFYvcrjWs8ppUk6NKDN
	 Hg54SmxOFB0HzxLZ+MVW86IbFSkkk046YbtvDKs07GS2chBWcFoHHMQn0p+iNC94/s
	 fBXXldxHpRcBJsAlPXtGz70dfRNYdqdw/WKvBOSmHerjMPw4XcUg6c//f/Gfk6H43B
	 0kEMnnJeWkQ+vUtwMSs8retplLJ1n4oL5pPt5ii+zzViOI+bXz4dv/TnMSzUzHORDu
	 nt2ZUCv5wgWPA==
Date: Thu, 19 Nov 2026 13:19:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Brian Masney <bmasney+clk@redhat.com>, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2
 clock
Message-ID: <179511597213.4062021.4090144090706436568.robh@kernel.org>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
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


On Wed, 21 Oct 2026 18:08:55 -0600, James Hilliard wrote:
> UARTs use APB2 as their baud clock. Expose its existing clock ID so device
> trees can describe it separately from the per-port bus gate. Keep the
> existing clock numbering.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


