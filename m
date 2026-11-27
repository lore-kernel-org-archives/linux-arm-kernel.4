Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rB1IemkC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XAubkvTI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ntucoBJTEaHY4nS4xGinqu4auOiGQOC/h2sxnNGH6F0=; b=rB1IemkCRxV4XDUk+WadYvLSxV
	svrdzgx9wT4zNNZ/LoQkdzvsZeECg8J0v/075dp4HlAelaUbQ82q/eXBSHVizTZ4q96ULUCpdDivF
	zX044emWg5ozxwGTOvdEosbd7mr/mnRKNE2o6utb3kz7Sd/GEhaILmNqDTECF7uiusKHHFcjlO0Da
	WDg69ZECPnEHsv2K+oeoqpHJ9xpi9VRt3qPfk3+p85A8CS0vo+p5NVEDKdNBSkc2uP+67yalgs4LB
	eoZgpZbYmeH4dqE955JPss8U8e91LmWULoDtZqCh1aH5FeM//0gvM5wXDzL7sATzVSLsAca6fUdc5
	Q8XPheQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtra-0000000FkdR-2lN9;
	Fri, 27 Nov 2026 11:11:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtrY-0000000Fkcv-0mr3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:11:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 033EC1756;
	Fri, 27 Nov 2026 03:11:28 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FD1F3F632;
	Fri, 27 Nov 2026 03:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795777890; bh=ntucoBJTEaHY4nS4xGinqu4auOiGQOC/h2sxnNGH6F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAubkvTIvWQmtGwwh0Lui5Pw4zp9veJEvuEOcvujRLkNv++5qc6SoWo/GW5AlSQl6
	 PgIau2CJndplgHI3uAEWKBwn7RGP6JWE+1RW9hDpLE9y06g/euKPpYtIfRzAut7vKE
	 pfJILfoOkaWjEC5EtOAXJ6zpZlfQxguXEus0BLvo=
Date: Fri, 27 Nov 2026 11:11:28 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>, vladimir.murzin@arm.com,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shuah Khan <shuah@kernel.org>, Breno Leitao <leitao@debian.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Stephane Eranian <eranian@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for
 bpf_get_branch_snapshot()
Message-ID: <20261127111128.GB861809@e132581.arm.com>
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
 <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
 <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
 <5c7f4a5f-fe5e-4367-9c60-86f1818346e8@linaro.org>
 <20261126180214.GB809232@e132581.arm.com>
 <9a471409-04c2-4f6e-aec9-0b23bb9b69f0@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a471409-04c2-4f6e-aec9-0b23bb9b69f0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_031132_266580_93414247 
X-CRM114-Status: GOOD (  16.04  )
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

On Fri, Nov 27, 2026 at 10:56:27AM +0000, James Clark wrote:

> > Could we restrict bpf_get_branch_snapshot() on arm64 to a free-running
> > BRBE mode? On a given CPU, at least one active event would have to
> > request a branch stack, and every such event would have to be a
> > counting event.

> Yeah I think this is a pretty good idea. It looks like it would avoid having
> to disable NMIs. You only need a local_irq_save() to avoid new events from
> reconfiguring BRBE while taking a snapshot, and you don't have to disable
> the PMU counters either.

I'd like to avoid local_irq_save() if we can protect BRBE snapshot
reentry in another way.

> If any sampling BRBE event gets scheduled then the snapshots just start
> skipping and returning empty.

BPF program can be attached to interrupt handlers (even it can be
attached to PMU interrupt handler). As you suggested, we can use per-CPU
flag to return an empty snapshot for the nested call.

Thanks,
Leo

