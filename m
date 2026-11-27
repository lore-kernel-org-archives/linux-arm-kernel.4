Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jjwd+iv9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n/GcYhyF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T9EauWO6cQ2WfpHoCweGwNuAL/bymTltRgB04eRJXrU=; b=jjwd+iv9PzYcSAw2GS3ryy3Yuh
	4kOck8tRrSG4qHvn+okcHo/kVcIaO4zftWuQm2R1CmVpSwKT1kr9BrZoT55tr9c8MNjGnXZE2h3IS
	Jmyu7isI/thxxGkJFDMjCDRJ5NDMcq0DVkrbaRszjv8cDkK1wAyqfs94IN9ebCC5IlMUTFH4Ok+vd
	e3ne/2qVMM5bYjJMGel+/txhtoCoFEl7tXsMJptK//CK185zjICVW5/yS33tovEYYHtFc2iopm/K7
	qx6hNCnMts30itqtyIxwMqkV8n7xxs1mDTXS0b8WuVvQrLf8Xo/ziRPjbNcb+PF2jsN2dksejy+TG
	Fl3PEMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu48-0000000Fmsq-0W2K;
	Fri, 27 Nov 2026 11:24:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu45-0000000Fmrx-2DVt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:24:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1F85152B;
	Fri, 27 Nov 2026 03:24:25 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 568983F632;
	Fri, 27 Nov 2026 03:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795778668; bh=ElfG0zfwSKVhwzHS3lUakxTIG4KBhbx2STHreNU7ca4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/GcYhyFjXnGZ05+0HmsOhEouFkUBNZJZnREWcBBYEYuJ1UiwwsIFkQa2gz9QrcnK
	 2O96p/rgEtjPJhflYAbG1IAWB5NouXC2E+U1y7TiTuEY5GiY3sxYhB3bjL+KZkx5sL
	 MKcfLY+XRJyus9eAfxFYyw0sgV1FXh3NSITUHfsM=
Date: Fri, 27 Nov 2026 11:24:26 +0000
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
Message-ID: <20261127112426.GC861809@e132581.arm.com>
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
 <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
 <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
 <5c7f4a5f-fe5e-4367-9c60-86f1818346e8@linaro.org>
 <20261126180214.GB809232@e132581.arm.com>
 <9a471409-04c2-4f6e-aec9-0b23bb9b69f0@linaro.org>
 <20261127111128.GB861809@e132581.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127111128.GB861809@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_032429_612402_9778D485 
X-CRM114-Status: GOOD (  13.64  )
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

On Fri, Nov 27, 2026 at 11:11:28AM +0000, Leo Yan wrote:

[...]

> > If any sampling BRBE event gets scheduled then the snapshots just start
> > skipping and returning empty.
> 
> BPF program can be attached to interrupt handlers (even it can be
> attached to PMU interrupt handler). As you suggested, we can use per-CPU
> flag to return an empty snapshot for the nested call.

I should have distinguished the two cases in my previous reply.

BRBE driver could return an empty snapshot if a sampling event is active
on the CPU. In free-running mode, a nested call could do the same while
another snapshot is in progress on that CPU.

