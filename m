Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D59606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 21:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ojHJSDs/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7y5w/m3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4+vJzaNaeGRIahAAcqcSHLCv6EEY6IvTeEZnCp6y4sA=; b=ojHJSDs/4+UcisNrgxxz8RkuA4
	qyP5dqwiWW3rgNOkQC860RYKYHzt5YmzJ98YtFUjTy/X735vVgViYxRaPzewqiNLTn1uLgzdPnRH6
	j2FGBXT/HAAc79mpjHTwpz7v9xRU5as3RqvdJsPn1zTOiQCDNIsb7ak26dJH0y0adJuWr+Zbundaj
	stDAVo/5aecVxW9r88WIZ9cOod578+B89oY+KqYNiHpXdte53Mae37Oq98bXNF5LCzrvaU+IN0sd3
	eZ/PiVG8zknxb48F5LKW/79zl97Dj23mfgvZehL8J5Hzeu0G2olkWRPwQD3pj7Ee5NQ0S8O3B7AxY
	yCtYCWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3q8-000000008dC-35Hb;
	Fri, 27 Nov 2026 21:50:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3pz-000000008ck-35be
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 21:50:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EC8741FBA;
	Fri, 27 Nov 2026 21:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3147B1F000C1;
	Fri, 27 Nov 2026 21:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795816235;
	bh=4+vJzaNaeGRIahAAcqcSHLCv6EEY6IvTeEZnCp6y4sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m7y5w/m3OjJrj+5R4ikLU7JDrMEaSbKrnjTSf1QWAmR98ovVN2zl6t8KJ8jgLjOnm
	 lQxjlR9kpwVnEbP5P16pc5WNVRaxx3ufkQLGjZkCphaj6ZW36OHQqmHxWgrCVvukg8
	 O2+UBBGkOqVraRpTQLqUcSmBCMuEapy3kjLyRUSxVtCvlaaPOzCcoHj8++dAnLLsf6
	 aFH0lpCkdhoyLnvZDAu3I7v8MzDxd7tNhjYdo3lDd+OY52Kjvy8zNbPD6VBJAXt0ly
	 yvfcRSidsej6T+v+zviabcsKUu6F/Er4LTv3m4jRFgHV0MLADAinFwPHi6tZnli7rZ
	 +1+32wAO3SRug==
Date: Fri, 27 Nov 2026 13:50:32 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org, John Garry <john.garry@linux.dev>,
	Leo Yan <leo.yan@linux.dev>
Subject: Re: [PATCH v4 00/19] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Message-ID: <awn7KH6aDpurtZQH@google.com>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
 <fa4e19d5-2e66-4468-9860-19cd9f3ea8db@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fa4e19d5-2e66-4468-9860-19cd9f3ea8db@linaro.org>
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

Hi James,

On Tue, Nov 24, 2026 at 05:35:37PM +0000, James Clark wrote:
> 
> 
> On 05/11/2026 11:44, James Clark wrote:
> > This series depends on:
> > https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/
> > 
> > Fix a few issues with per-thread mode:
> >    - On nVHE, everything looks like guest trace instead of host
> >    - Tracing multiple threads didn't really work
> > 
> > After adding a tests for those, it turns out there were some snapshot
> > bugs not picked up by the other snapshot tests. That showed that the
> > different snapshot searches for Intel BTS and Arm SPE were inconsistent
> > and I think all tracers can benefit from using the same pointer fixup
> > logic, so that gets refactored into the common auxtrace.c. Then SPE can
> > just share the Intel BTS search as it was obviously copied from it
> > originally. IntelPT keeps the more advanced duplicate data search, but
> > in the future that could probably be made the common one and all tracers
> > would benefit from using it (except maybe BTS if it always has a very
> > small buffer, but I doubt the overhead of the duplicate search would be
> > an issue). For now this is more of a refactor rather than behavioral
> > change so don't do that yet.
> > 
> > Signed-off-by: James Clark <james.clark@linaro.org>
> > ---
> > Changes in v4:
> > - Change test snapshot size to 128K for 64K machines
> > - Put patchset depencency in cover letter text
> > - Link to v3: https://patch.msgid.link/20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org
> > 
> > Changes in v3:
> > - Keep the find_snapshot() callback instead of adding
> >    snapshot_has_wrapped() and monotonic_snapshot_head boolean (Adrian)
> > - Add auxtrace_record__default_find_snapshot() for the simple search for
> >    BTS and SPE (Adrian)
> > - Add auxtrace_record__snapshot_fixup() for any snapshot search
> >    implementation to use to update the pointers (Adrian)
> 
> Hi Adrian,
> 
> Did you get a chance to check these changes? Sorry it took a while to send
> the V3 after your comments.

I've tried to apply it with Adrian's ack but it's didn't work.  Can you
please rebase?

Thanks,
Namhyung


