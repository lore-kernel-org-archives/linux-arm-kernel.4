Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345A9606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZfWtW2M;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kyh8JlvM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1wPnmKKjukBlg6mKJq/abTjzK4jsDQXLhtug2ycfM1o=; b=tZfWtW2Mr+cO4xbXCV0olWMLul
	n9fFRuROlts9hPn3HoCX6XzLASjfSKxYNJn3zSpb6WyoISPtQLLL+9WN2Ei9G3yC/oVvf8iNK9PPV
	AKDhe0seAWP9er65dtuPC3Q8DDrcozMIJ2rhU7kubYYNHtpaqV3QlUA2dYaE2f6HNAU4ix/O7D66t
	h4CLRDv+KjqMT6IW8syBK8vEf/e761poVcdZxHLYi6habigefn7V2IRE62s+FR/80go5R2ghdf+is
	/RD+ErqZkWDaxZZ6XCT3mgRn8bxNsaVlffOP1Ukiq18qcq1x1WlYQOeAqXSKdedXXCVHVrD3ytn9Y
	qr2CuMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyas-0000000339v-0S6l;
	Mon, 16 Nov 2026 15:26:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyaq-00000003393-2HA3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:26:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 039B762E2C;
	Mon, 16 Nov 2026 15:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365441F000C6;
	Mon, 16 Nov 2026 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842763;
	bh=1wPnmKKjukBlg6mKJq/abTjzK4jsDQXLhtug2ycfM1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kyh8JlvMoWPPq3JODc4QeHM0xI4ctGP9cQu6ZkGEWs5RcrkwsVQOP3Qxwx0OIqoIJ
	 tNdcfyGkaYG2Ne/dNPeqJQ5L7+7F6UD315x5ODN1QbeQQ17e+ZE5Y5SwL3QpuHCnM9
	 L0msQv40UOEGu++ZjYTwHWtZgzF9yfaPoFjQnn91d8pq33bylLD+BXO+5BBxQE6YYs
	 TTntyNKkPudBlZO4YEfCozaWx8zLLS5Bl5sZDsodLSamCIBzfoMywtF/ExRrZVZSkb
	 MaMys6nDZh5Ev7M3lJ+F6eud1cYaRAfCrk5NDsTNBOREJ9zku7alh0LUtKFx9d+mgn
	 NieScFAwPqV8g==
Date: Mon, 16 Nov 2026 15:26:00 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sashiko <sashiko-bot@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 2/3] powercap: arm_scmi: Reject zones hierarchy
 containing cycles or holes
Message-ID: <20261116-statuesque-pompous-zebu-11f7ef@sudeepholla>
References: <20261115110546.2344308-1-cristian.marussi@arm.com>
 <20261115110546.2344308-3-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115110546.2344308-3-cristian.marussi@arm.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 11:05:45AM +0000, Cristian Marussi wrote:
> While walking the hierarchy of powercap zones received from the SCMI server
> bailout with an error if any cycle or hole is detected in the received set
> of zones which has to represent a tree or a forest.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-6466cd8d-c2b1-43da-8141-bf8bf49a17b1
> Closes: https://sashiko.dev/#/bug/linux-4895c0ac-74f4-4860-a006-9f5ef7b0a012
> Fixes: 3e767d6850f8 ("powercap: arm_scmi: Remove recursion while parsing zones")
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

