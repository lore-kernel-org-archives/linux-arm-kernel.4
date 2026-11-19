Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E83606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RdlnY975;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndbrk++G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1iTSNsb6pi3O4RPYJT8NASGVQuCcaiYNusa8aOsZz3c=; b=RdlnY975q0EUaXeJRI5pMbvKzy
	WP2djaCdw0MV5VxTLp3hPnKrtrgyWcVm87c49HojRcEaQ1SHwwwJ2Jy75meYKSp1hmjjOwbI26fmF
	/d0Pmq3OynntDqEvBy/il4t5/a/pJ12BOzFodzGRzMRwt+QsGZnjfQUjRUxR+E1cs/o+WVfpwfAFw
	hWf7LKC2jRUqyc6Bv4EbX9RCXK+DCxTGvdp0Y+dvO0mz/8RTjqEAAvJ7quTz44SFib+duZ4wcEgxd
	O9iSLtYFhwtcanSGzPXzRPv/Hm+GG/qecR7QAj79JbkUp73Q83wDSjHWARRBpchicMD8i0zglT/cC
	diOaPI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU606-0000000Cqgd-1sQe;
	Thu, 19 Nov 2026 17:32:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU605-0000000CqgL-0PVw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:32:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3184460A65;
	Thu, 19 Nov 2026 17:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB2F1F000C4;
	Thu, 19 Nov 2026 17:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109563;
	bh=1iTSNsb6pi3O4RPYJT8NASGVQuCcaiYNusa8aOsZz3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndbrk++GXoulLE7zpYXF8pPKDW0a7Thvr3J0fsaiYJP6QbPzd++wN/SgNi2/dX12M
	 Jr/SbvjtI1TvUEzf5bXTwwfU+YfCWig9Uhmvf1x2xUk8CSNIgUD1H7id7eMYUMrjjX
	 bpIfiztE3wWOp1XR8gqSfYbI8swJ0AJoWKQpa6By1Z2T5b2yuVL4rwj5a9ValrxYkk
	 EgcHkSaxpqVkQxDqlmSXyscd9S98HkzQPOri3szH8+t+25ZUynn02uOfFXeMh0z6SK
	 oydes9x8aDI+3+HC7FJ2lVOtLj+6y3cnxzd00mun7gHU7OnglV67ObfdMYbAPcrwIr
	 hceIfZ8mmxZ+A==
Date: Thu, 19 Nov 2026 17:32:39 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>
Subject: Re: [PATCH 3/3] scmi: driver: Increase timeout for rx response
Message-ID: <20261119-crouching-mongoose-of-luck-fe1d74@sudeepholla>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
 <20261119152944.276763-4-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119152944.276763-4-paul.cercueil@bootlin.com>
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

On Thu, Nov 19, 2026 at 04:29:44PM +0100, Paul Cercueil wrote:
> From: George Cherian <gcherian@marvell.com>
> 
> The timeout is way off on the Marvell CN10K SoC, where the firmware
> processor can take more than 200ms to answer.
> 

NACK, why can't you just use arm,max-rx-timeout-ms in your DT ?

-- 
Regards,
Sudeep

