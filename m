Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60FF606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZoeBCIk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HU8pLldn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P8UprVrBja3R4h1uWzG9r08RzgeklsPuoYyBuP+//wU=; b=wZoeBCIk79I4Q5CerOkB9DHBq7
	LG0vSGMQe4zn1qZdJVKD0HJsOs6ucUNrIXhr/4B9RxSofSi7orz71JdHKeXINKqgq9x9IDFPnGp/m
	Q+GpkCeJT3kzinDKqUp93MbrA49keSnHgRLTuqge4R7yKQ5hF4s1f4dUt3rI3iaTrTvekiw4Q0tkk
	Uu2loJ9E82gg9vaavXj96DWL3P+8m+f9JParSrfZb/LrSgTMCW9e1P809D4Zo9HZIxyMy/xtmBtjE
	cKRSaZan0ZQy6wBvvXDCnLeUCRpAv0coYj/RHPdQ82A6the5fEElT8gHZSbGz32JQePz72MdqenFL
	OarJ8DUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNz9-00000006lv3-1zsN;
	Tue, 17 Nov 2026 18:32:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNz6-00000006lsU-1C0A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:32:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4785F1A32;
	Tue, 17 Nov 2026 10:32:41 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D83323F882;
	Tue, 17 Nov 2026 10:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794940364; bh=6oo8c5L97pfAO/dOYO7Kj7kjVxe3vJKESCZuaHPkf78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HU8pLldng+vmwTCABZDo3g4DBWX35Vb3C9qHwnJ9O8RZIq/0VW7eW/K8giGq4cHzM
	 INVVZs8HmkJUMCScjsDcrcU76Hq/qbWOryraKYA6XcXNWl/ZD20fk7YOpDSmg5gnkN
	 XqA8/PcFzo1472ZH9INEGJD03IoyPEXRp3CSsTos=
Date: Tue, 17 Nov 2026 18:32:41 +0000
From: Leo Yan <leo.yan@arm.com>
To: Igor Velkov <iav@iav.lv>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Message-ID: <20261117183241.GV9176@e132581.arm.com>
References: <20261113-coresight-pmpcsr-question-1@iav.lv>
 <20261113144623.GQ9176@e132581.arm.com>
 <20261114-coresight-pmpcsr-reply-leo-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114-coresight-pmpcsr-reply-leo-1@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_103248_381780_E13C865F 
X-CRM114-Status: GOOD (  14.94  )
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

On Sat, Nov 14, 2026 at 02:08:16AM +0200, Igor Velkov wrote:

> The cpu-debug panic notifier reads every possible CPU after COREPURQ;
> on RK3399 on the crash path without pseudo-NMI it hit an SError on the
> first CPU that was off.

Seems the SoC does not honor COREPURQ. The current driver relies on an
accessible debug interface; these platform limitations are already
documented in [1].

> So I would send:
> 1. cpu-debug notifier: online CPUs other than the panic CPU, read only
>    with PU=1, R=0 and DLK=0, no COREPURQ;

Sampling only CPUs still online after the stop request may help, but the
online mask does not guarantee register accessibility. A late stop
acknowledgement can race with that check, and an offline CPU may still be
running (or stuck) in firmware - the driver is also helpful for CPU stuck
not in kernel.

We also need to consider FEAT_DoPD: EDPRCR and EDPRSR move from debug
power domain into the Core power domain, and COREPURQ is absent. We then
need another mechanism before accessing PCSR register.

I would check a bit if any suggestions for safely access registers.
Otherwise, we may need to explore kernel states as you suggested (not
only cpu online but also idle states).

> 2. PMPCSR when EDDEVID.PCSample is 0 and PMDEVID.PCSample is not.

This is fine for me.

> Panic notifiers run after the stop only with crash_kexec_post_notifiers;
> with a crash kernel loaded and without it, they do not run at all. Is
> that acceptable, or would you rather see a hook in the crash stop path?

I agree that the notifier need improvement.

Could we explore a hook in the CPU hard lockup detector? Seems this
module is more relevant to hard lockup rather than panic.

Thanks,
Leo

[1] Documentation/trace/coresight/coresight-cpu-debug.rst

