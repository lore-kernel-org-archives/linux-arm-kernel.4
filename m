Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096F9606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LoWdf4rX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eHdmZKVl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oo7RjrzXgo/CEjpliqz3gqGyxd1KPs7Uh1SXdbTUxR0=; b=LoWdf4rXuN1IB5dq1PHKBB/yf+
	WjstcFAB7+XpCYdPkAW0D5HlKOeIWimCNIc/Dci+dN1q/lyTM4dZSTcLMuAhCmGYKWokK09Nfrjz0
	QkowLa/HwnqebxoENr6TGoaYHERYjXtPNyk4pSQ/b8G+23TSpsSqsuLEE08+WOZNZeZC1jO9uvTdF
	Pr43xSp7D+PU3oAnDYvH5G00B7QHqRvb8z11mitR/CEO9OGKop0cjSEmgDSscFr7hSv5hZPxGdGMB
	FShXs089yze3rZbii0OcZxxrflh6DNts/Qb4lGKcLLlaSh+8x1F/44x4oP1FMNcHJVEVinrg4VuJz
	TBMuUHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp0J-0000000CRSB-05aE;
	Fri, 13 Nov 2026 10:59:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp0G-0000000CRRe-1ply
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:59:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E9DE1C0A;
	Fri, 13 Nov 2026 02:59:28 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C858E3F673;
	Fri, 13 Nov 2026 02:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794567571; bh=XUZhmq3u2xNG1YGicKKUsCPDU/uHI8M/joODV72JgGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHdmZKVlUeRxbO1js0VxizZUUCi7kGK+xvO/6P5sh6DJZKnORb99eLSQS/SQghozh
	 ktmmK0lqA7D3BO5kICPE1q4y7Jf8241rP8coqLJZp9JJ52aQ6jw7jbkOOwJMXtJgi4
	 tJDI3pvxprJULRN9Te+ZFfeWCxGLIRRfLB1jHb1s=
Date: Fri, 13 Nov 2026 10:59:28 +0000
From: Leo Yan <leo.yan@arm.com>
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/14] perf cs-etm: Synthesize exception entries
 separately from branches
Message-ID: <20261113105928.GN9176@e132581.arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
 <20261030-perf_cs_etm_fix_non_taken-v3-10-7629b52ab047@arm.com>
 <CAP-5=fUMwOb6Gj+5DOu9-yNmthDz5ghAqrzmZ4ACX0g+9WB59w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUMwOb6Gj+5DOu9-yNmthDz5ghAqrzmZ4ACX0g+9WB59w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025932_522238_931876B2 
X-CRM114-Status: GOOD (  13.40  )
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

Hi Ian,

On Thu, Nov 12, 2026 at 11:07:55PM -0800, Ian Rogers wrote:

[...]

> Hi Leo,
> 
> After commit 9648f9fc3525 ("perf cs-etm: Synthesize exception entries
> separately from branches") in perf-tools-next, perf's build-test
> (`make -C tools/perf O=/tmp/build CORESIGHT=1`, i.e. `make_with_coresight_O`)
> with GCC 15.2.0 (`gcc (Debian 15.2.0-14) 15.2.0`, `-O3`) fails with:
> 
>   In function ‘cs_etm__t32_instr_size’,
>       inlined from ‘cs_etm__instr_size’ at util/cs-etm.c:1390:10,
>       inlined from ‘cs_etm__copy_insn’ at util/cs-etm.c:1572:21:
>   util/cs-etm.c:1381:28: error: ‘instrBytes’ may be used uninitialized
>  [-Werror=maybe-uninitialized]
>    1381 |         return ((instrBytes[1] & 0xF8) >= 0xE8) ? 4 : 2;
>             |                  ~~~~~~~~~~^~~
>   util/cs-etm.c: In function ‘cs_etm__copy_insn’:
>   util/cs-etm.c:1372:12: note: ‘instrBytes’ declared here
>    1372 |         u8 instrBytes[2];
>             |            ^~~~~~~~~~
> 
> The uninitialized `instrBytes` in cs_etm__t32_instr_size() is actually
> pre-existing from commit a7ee4d625ede ("perf cs-etm: Support for ARM
> A32/T32 instruction sets in CoreSight trace"): cs_etm__frontend_mem_access()
> (via __cs_etm__mem_access()) can return 0 without writing to instrBytes
> when thread__find_map(), map__dso(), or dso__data_read_offset() fails.
> The changes around cs_etm__copy_insn() in this patch just shifted GCC's
> -O3 inlining enough for it to inline __cs_etm__mem_access() and spot the
> uninitialized read of instrBytes[1].
> 
> Zero-initializing `u8 instrBytes[2] = {};` (similar to instr16/instr32 in
> cs_etm__is_svc_instr()) or checking that cs_etm__frontend_mem_access() read
> ARRAY_SIZE(instrBytes) bytes before inspecting instrBytes[1] should fix it.

See the series to fix the issue:
https://lore.kernel.org/linux-perf-users/20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com/T/#mcbc1b4ce7284c9575b273d504354ac733bcf39aa

Thanks for sharing the log and analysis.

