Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 00:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ul+iTaDf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyWRZB+O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zvrOcLQ/9j6k4VzNeeZ4ubTA6xIn7QoQ0vI4b1H2fsY=; b=ul+iTaDf+K6d5eiHnD1I5n1/oN
	PEICJJDZasXga0zX41G1n7laJs7dS6WgssrOF0GJ9RhCHBpX4OKWDEvbbYaBJR1VJ+77JOxU5BtwO
	E8ZgBCaqy1I5Kyel2a0xOLV5+C/dYiNwMdDsOqs+ugfVv2W/u2SuLrHWAAVeHbkcoM0uG0cPUIvhY
	UsbssMvWd2L1hwxhUtyXB+obUwU/ZM+nrK0IAWDPA5QyOxJ9rjNb3p9HRGJasJKLrkjXy7dBiCrBw
	2k+G368ewKDGOMK5tK+d8oY8s9pNBo8FtaNNWl78mSZc6ZicnOyTk2Kh+4kbJ7GZVcbtFFY2RQ8S3
	7m8q62Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTX2-00000007M0G-28rp;
	Wed, 18 Nov 2026 00:28:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTX1-00000007Lzp-1MCh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 00:28:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D037433C3;
	Wed, 18 Nov 2026 00:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485621F000C5;
	Wed, 18 Nov 2026 00:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961690;
	bh=zvrOcLQ/9j6k4VzNeeZ4ubTA6xIn7QoQ0vI4b1H2fsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CyWRZB+OjB6pp3PhlLCT/Z72vh+NaEvArJZGW2I2DVcYct7OiNcGxFxreT5ip9DnG
	 ym13lqgDUy5shrdUtyD8G13JURZUb3jn/x0sRQxO2ZwvslSaUeqhwdU0H38K+66Or2
	 RzSY20nyImy2ADM0IxfJGup9GdFjFk4+Vc5Lkie+pj/Y6TH8OeBJpQSYXkFyYAIjrI
	 1L8odKslmyHqrfbGbzo6rRl94avCRuX4lM51PN6IX2CLqFSBm6Cjr5N7pLqchSb+x7
	 MRyaYHceKVbRpNtf28lhhHabS0eaBMWscNZRV/ZvxCpEjpHLHFgyJMbcT8CP4MfP7g
	 nWYJP0Vrpd8SA==
Date: Tue, 17 Nov 2026 16:28:09 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Reeves <michael.reeves077@gmail.com>
Cc: Myria Sarvay <myrialsarvay@gmail.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: Add KVM support for newer Apple Silicon
 CPUs
Message-ID: <avzxGUgKHnSEnstK@kernel.org>
References: <20261021-apple-m3-m4-kvm-v2-0-04905152cc2a@gmail.com>
 <179495264127.1456871.1866504028661732526.b4-ty@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179495264127.1456871.1866504028661732526.b4-ty@kernel.org>
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 01:57:24PM -0800, Oliver Upton wrote:
> On Wed, 21 Oct 2026 10:53:19 +1100, Michael Reeves wrote:
> > This series enables KVM support on Apple Silicon M3 (base, Pro and Max),
> > base M4, A18 Pro and M5 Pro CPUs.
> > 
> > The first patch adds the CPU part numbers and MIDR definitions.
> > 
> > The second patch adds these CPUs to the existing Apple Silicon PMU and
> > broken SEIS workarounds. It also enables TDIR detection so KVM can trap
> > guest DIR accesses without trapping all common registers.
> > 
> > [...]
> 
> Applied to next, thanks!
> 
> [1/2] arm64: Add CPU part numbers for newer Apple Silicon CPUs
>       https://git.kernel.org/kvmarm/kvmarm/c/61615311ce39
> [2/2] arm64: Apply existing Apple Silicon CPU workarounds to newer CPUs
>       https://git.kernel.org/kvmarm/kvmarm/c/3a7b70524c54

Whoops, this was accidental since I had your changes applied locally for
testing on an M4.

Marc's next fixes pull for 7.4 will be the canonical patches.

Thanks,
Oliver

