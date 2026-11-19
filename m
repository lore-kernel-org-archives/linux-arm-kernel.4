Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YBK6r6Aj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVuzqfT9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dqFY46zm6egYH9t5KmwLXvg+tBy4Vv7ro9hejLUEyLo=; b=YBK6r6AjJqlJ6Uif/EPMm1lGvP
	+4VsOsVMwqAyGapZAVqHzGqCyT1JcENA6tr//2xjfcBKe0ln6qObChsQ9OcxPoPf5izx6dPf6Rxre
	F3rQlZvXbBkMwfzHvkqUSUgqp4tm+53VOR+H+j2i8VH1vtg1HcP6nn8459JfF8xzYdKE0/VIiAsNP
	QzKcwyc+ycif2crLRIt8aeN35ck922wNHNBqPdjxk6nm1HE8CMlXlujblgblwTS9QXdlc6LEQPRav
	/p4u4OmGMXsvClJvAU9J/avuDMf8ylNiLxtqtdaZJgrxJ7tYEESA78+AaveD0/eg7nQYBFdju/cRJ
	K5d7DMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUA0Z-0000000DVlM-1QlI;
	Thu, 19 Nov 2026 21:49:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUA0X-0000000DVkz-10Qa;
	Thu, 19 Nov 2026 21:49:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A92676250C;
	Thu, 19 Nov 2026 21:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258DF1F000C0;
	Thu, 19 Nov 2026 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795124968;
	bh=dqFY46zm6egYH9t5KmwLXvg+tBy4Vv7ro9hejLUEyLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eVuzqfT97Y+6ATNIbIJnCGp00575h0keradQM49V9oQSUNMXYSelpv+8HDARiIGBa
	 uuYzucDmkX2px2ys9ahSXOJsJZhiuGhhTmPcGW3B7/WvxdbrsorMEgUcCrf5GirfIp
	 Agbeze0ycmbxT85EPf1I5hJcYvQWssH+y/NhyhrKkYvwumVPQvruhChuz67n26x/ZM
	 10dVMTo+KziOzofPm9Qy/X6T6kYy9O0/bluP1RAlLtBcOw5IHzzYMxrsYczUSKaTMz
	 whUQKNIUF4ObtcYldG6YX+AGq4xuHZ2VztnEF0sHv3ZDHMo/WjZZ7LjhRVoJ9pH9iP
	 dDw+pLJ7ZDXeA==
Date: Thu, 19 Nov 2026 15:49:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: arm: rockchip: Add FriendlyElec
 NanoPC-T6 Plus
Message-ID: <179512496548.785631.3672990790869029250.robh@kernel.org>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
 <20261104110640.1132917-2-diederik@cknow-tech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104110640.1132917-2-diederik@cknow-tech.com>
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


On Wed, 04 Nov 2026 12:05:04 +0100, Diederik de Haas wrote:
> The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
> Add it to the NanoPC-T6 list.
> 
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


