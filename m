Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2E606A8AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mFeEGZuZ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KIa6jf8x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KrAKCc1OnJY4LbejaA118mCBpDZA++ULUTspBpWDwjI=; b=mFeEGZuZ9ShhpCoOxIldKm+v5H
	Zq3FvxWNuF0sYdwO3d9RGESmW1wjOIfaxaxcwtofjV2EvumVsdwoGqMuPVAb1ZH/8YcBXLUWa/tL5
	9naqty4FAKBUHf1dNDYfHMi4Uu2DhYCVWuoqxBs5DrWsb9bGX/h2+nUZVgRFoH8WotRhoAX6nPLZm
	J0ptbuET0VT8GtwukmwT9aXW5gSc8pV+bOL22vXriWKH29/rh0Isitf91mX1Op2eCehQfLaoBG5NZ
	qobV2LLoBIUilxC33WUWokP3miYifllPGmeLL9aMQue8bFJFOInR0KjhkhESLX4IqJyxF+FOrOa6f
	LwNcgpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRar4-0000000AyMv-44RQ;
	Thu, 12 Nov 2026 19:53:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRar2-0000000AyMV-3i3o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:53:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1608B143D;
	Thu, 12 Nov 2026 11:53:01 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E67833F632;
	Thu, 12 Nov 2026 11:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513184; bh=UVssr2h0mtTlZR3uknoInjfb4xYkRuFDnS+ok0EQ/Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIa6jf8xPIhnYjIt1/ah9uwMyqR51klIIHUVgOF56JSTCncADpFq7xBqP2MixQIcJ
	 lar+vP5zIri1gYTsurYMR/2zyxKxAviqSzUjHuInf/T5u3xfuEFZ4PJbUNfJxKzJlC
	 BXRRfQxb5Z7xmfdWLFC8XyLxLlUthyJ2GWqdnZEw=
Date: Thu, 12 Nov 2026 19:52:56 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: Will Deacon <will@kernel.org>, Vladimir.Murzin@arm.com,
	suzuki.poulose@arm.com, xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: errata: Update AMU workarounds
Message-ID: <avYZGOO_gku8RUKj@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <179451296804.3304937.3878967781756339834.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179451296804.3304937.3878967781756339834.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_115304_974393_692CFA29 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -4.4 (----)
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

On Thu, Nov 12, 2026 at 07:49:28PM +0000, Catalin Marinas wrote:
> On Wed, 11 Nov 2026 13:39:26 +0100, Beata Michalska wrote:
> > This short series updates errata for AMU core & const counters.
> > The last patch in the series tries to optimize a bit the paired
> > readings of both counters, so that the workaround checks do not
> > skew the results. It is also intentionally the last one, as it
> > will not apply on older stable kernels.
> > 
> > 
> > [...]
> 
> Applied to arm64 (for-next/fixes), thanks! I left the 3rd patch to Will
> for the upcoming merging window.
> 
> [1/3] arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
>       https://git.kernel.org/arm64/c/139a9b7d5a07
> [2/3] arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
>       https://git.kernel.org/arm64/c/be7771458582

Ignore this one, I applied v2 but b4 still remembered.

-- 
Catalin

