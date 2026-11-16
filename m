Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE5606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IcKxURPf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aEv3CH/d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/ZtzIqGKVBjlBBIyqu9fROMer7QN/0/V51r6Lfy880U=; b=IcKxURPfzPfoPpSuiiUtsqpms5
	t+dGwBz7lMDjVGwS/vZltcBvPVwtAE5tz9wNEBJgOft5ewOvmDS3yAtMC/IvFWKnvyjrIdboaFkdK
	lg5Z29SLcTfEkRl11kJxI1gq95Q7q2kJOtLysOeKFOUSBDUphwE1QHBpi3OgV6zXEREFzPg9WMyCM
	HlpFBsWpvNj9jZhXXMvNSXe+KQdQeXCFY+vqmYaPHjDCXLgvjEEa5hywWEv+F4S3r/nu3snCejQrL
	zFYkfX+zapRSsx/klGBqceQ3GwndfGNuWFUM5Wg/14cJD2sK5fIh2Ntj9ng0xLD0pS+Dvz3JivEUS
	4CkAaPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu5g-00000001zBA-1FhZ;
	Mon, 16 Nov 2026 10:37:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu5e-00000001zAe-2yGi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:37:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF3131476;
	Mon, 16 Nov 2026 02:37:28 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8920B3F632;
	Mon, 16 Nov 2026 02:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794825451; bh=fHZnIIQvAnQEZYB1ohrXNN6xTkU9UWERfy/JRkWqdUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEv3CH/dircAIumFk9ZT6vTv8qcWLVhR94/xOQnKX/CpPjJCV0PznJfRdIjZAYN7L
	 +YxzjcZvjTvjXurJzyQsvvit8GW23xjZIXxlxj5mWJpfqA0S46ey9vBdOifk2b4hNL
	 Mwf4F9KJ/H8v0uw2yHTNFd0tiVyPjjlpOGpQuXQA=
Date: Mon, 16 Nov 2026 10:37:29 +0000
From: Leo Yan <leo.yan@arm.com>
To: Johnny Fan <johnny.fan@cixtech.com>
Cc: will@kernel.org, mark.rutland@arm.com, suzuki.poulose@arm.com,
	jeremy.linton@arm.com, maz@kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, jie.fu@cixtech.com,
	bob.zhang@cixtech.com, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v3 2/2] perf: arm_pmu_acpi: Support heterogeneous ACPI
 systems
Message-ID: <20261116103729.GT9176@e132581.arm.com>
References: <20261102084153.3975282-1-johnny.fan@cixtech.com>
 <20261102084153.3975282-3-johnny.fan@cixtech.com>
 <20261113160041.GS9176@e132581.arm.com>
 <avpxRZFX4Iebu0l3@JohnnyFan>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avpxRZFX4Iebu0l3@JohnnyFan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_023734_798424_FAE5D375 
X-CRM114-Status: GOOD (  17.25  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 10:58:13AM +0800, Johnny Fan wrote:
> On Fri, Nov 13, 2026 at 04:00:41PM +0000, Leo Yan wrote:
> 
> [...]
> 
> > Based on above idea, I would fold your patch into my series (but I will
> > drop the first patch for changing TRBE/SPE drivers). I will keep you as
> > the author but please bear me a bit that I may refactor it to fit into
> > the extensions. Hope this is fine for you.
> 
> 
> Hi Leo,
> 
> Thanks for the detailed review, and yes — please go ahead and fold it
> into your series. I'm happy for you to keep me as the author and to
> refactor it as you see fit.

Cool!

> I'll hold off posting a v4 so we don't end up with two versions under
> review. Ping me when there's something you'd like tested on the CIX
> board.

Thanks for offering to test! I'll test on my Orion6 board and send out
the patches this week. You're welcome to test them and any comments.

Even if we're testing on the same SoC, your results would still be
valuable, maybe we're using different firmware versions.

Thanks,
Leo

