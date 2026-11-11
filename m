Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D7C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+sZ6++9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhegUqfA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SHj7bmBau/ON4wrVotHqsjE11ISH4HLh0/LAv4uQZj8=; b=w+sZ6++9xyIV74HcyNG7Eg7Y8P
	/oTaNguC11kbhL0gdB8vlWjylZdVRDHn+DLSMDVJeeWsMvCITAiwy8Kp6F8XjmZ1eUaUJp9Q4eaq9
	qnEFtK6zENZv48+AF76sJO3vL0d9CCZjQzv8nHu2yT1On2/dzv7Rs5M/IzL+3AnMYo1x9FtZGvnQk
	4K+1Y2I2SZOh5PNKLEh1eedhL30GkZLAK93RAEc9jQ5Qm15+o9J3O5p5B4MBMxQlDrXrcRyycJcPe
	8ybSskkNNUcY/dxzUxHkKF8yvCd2APUOKFKsIQGhbmYMIUIm/+qWqD03J6kJipQLxWZ1gBBWUnYsH
	e7JYJbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7ii-00000006i1a-0IKd;
	Wed, 11 Nov 2026 12:46:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7ih-00000006i1H-0IrW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:46:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF1D8419E6;
	Wed, 11 Nov 2026 12:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4C91F00A07;
	Wed, 11 Nov 2026 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401190;
	bh=SHj7bmBau/ON4wrVotHqsjE11ISH4HLh0/LAv4uQZj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhegUqfA361A1Zssh1t4Q4dCNuAxd41ocwR+bRcyHMwuO2CDY0qsBVGsWna/Z0FKC
	 VAsOdU/Zwi0mA5dc84h1YSESP1DhBu/F2CylTzEuv3G0kJIrBtQEMZVvoKPm4FKvgP
	 sVdmIG/m28QWRqxUBZs7VaMASwiwoVUdzm/zi8LUtmZO+Lnjn98PPJalX/PM7811QJ
	 fuO1yx5ZY/jin+Gjyl16Y3dytlNpJ7oCbDXdnaSql7CP1KYHx1EnQlrFvkrWWpE3Q6
	 us8MbRvJ74BJirIS6vfi4Ag6QFeDWcSaDJNzWVkTHwFrM59oGQVEkjVtpFafy3+Pmh
	 mf/Eoa5KvqPLw==
Date: Wed, 11 Nov 2026 13:46:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 03/15] dt-bindings: nvme: apple: Add
 apple,t8142-nvme-ans2 compatible
Message-ID: <20261111-comical-quaint-turaco-e8c1c2@quoll>
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
 <20261106-apple-dts-m4-m5-nvme-v1-3-22f4827b4ece@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-apple-dts-m4-m5-nvme-v1-3-22f4827b4ece@cyberchaos.dev>
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

On Fri, Nov 06, 2026 at 10:04:12PM +0100, Yureka Lilian wrote:
> "apple,t8142-nvme-ans2" on the Apple M5 SoC is compatible with
> "apple,t8132-nvme-ans2" so add its per-SoC compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Squash all nvmem patches. Don't add compatibles one by one.

Best regards,
Krzysztof


