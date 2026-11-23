Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF146606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e2VYXq0K;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Qt75YU3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XvzEmeTIxXyutq1PXClFF3+A3A4QaLFL8E1yjF/uOVM=; b=e2VYXq0KymgjNe67UTZu8Y7pXp
	WkVgBcOJbzgCMJeApKTut1Ch4x0/0Nboh6j2RwQIqH8F0MwA3w7XaO2J/edSiu9ObeZfZnLNxRU/s
	q2mV5MIwZZoCXTL5Q1GQyhDU4+7DIi0ugqstThZrVjiJQnqGiL/2pIlYbPbiDayTzPUWuFjQpzk4H
	rHb51XIeodhnQDS8zxDtOWqMFocwEgKkmosr7JO34NfMYxRzwfbAeMippwVn9YtiXaW9GxjtP/QZx
	auhGybzssbmAGJ0srNdXrZrDKdyGMAgdftMLsFTdkHUHYsbKdxapQh2/4RZRSv1rtRmfSk4Q2k/FZ
	ngTRLDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSbv-00000003FcG-2MjJ;
	Mon, 23 Nov 2026 11:53:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSbu-00000003Fbw-0UhK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:53:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32098143D;
	Mon, 23 Nov 2026 03:53:22 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0AEC3F882;
	Mon, 23 Nov 2026 03:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795434805; bh=RYiIfxkDaSmX84xLMRyq6/NcK2Xs3/5CbbES0suYhVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qt75YU3b9IX1teTA93OzvDq6X7Oe3ZnyDyVLUjwaAHC4X7Nb36+f9OfXtVZiu6E8N
	 QyrHjBzaMwPjmpSIc+kKHmbJ7YcOKGgyW8B0UiNQRSz6JKof8vAkU+dwT7fr04Xi78
	 Q8GmkPvA7o5KPkoovCNy2agd85FsSuoCiSVEi2Vo=
Date: Mon, 23 Nov 2026 11:53:22 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is
 throttled
Message-ID: <20261123115322.GC9176@e132581.arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
 <5b94b79b-8c4c-433d-8c9c-d92b4a8399c5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b94b79b-8c4c-433d-8c9c-d92b4a8399c5@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_035326_199873_3B80B947 
X-CRM114-Status: GOOD (  17.74  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 11:01:04AM +0000, Suzuki K Poulose wrote:

[...]

> > @@ -748,13 +748,16 @@ static void etm_event_stop(struct perf_event *event, int mode)
> >   	 * handle due to lack of buffer space), we don't
> >   	 * have to do anything here.
> >   	 */
> > -	if (handle->event && (mode & PERF_EF_UPDATE)) {
> > +	if (!handle->event)
> > +		goto out;
> > +
> > +	if (mode & PERF_EF_UPDATE) {
> >   		if (WARN_ON_ONCE(handle->event != event))
> > -			return;
> > +			goto out;
> 
> We seem to be disabling the path in this case, which is a new side
> effect ? Do we want this ?

Yes, it is intentional to disable path for this case. By this point,
the source has already been disabled and the event marked stopped,
so I intend to complete teardown of the whole path.

> Also, could we not move this out of the if condition ?

I initially left the check in its existing position to keep the
validation changes together in patch 05, which reworks the AUX-state
checks with perf_get_aux().

I can update condition check like:

  if (!handle->event || WARN_ON_ONCE(handle->event != event))
      goto out;

If this is okay for you, I will update patch and send out.

Thanks,
Leo

