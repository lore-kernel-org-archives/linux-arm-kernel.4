Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688BA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sshGYfoE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kEnZJDat
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EIBFveu7yYmEbvuiFTdZCk87YQ1EZPQ1DqdLI+hGjog=; b=sshGYfoEwIjPs+xrnPSkumlfq+
	XiEPbNfWPUMLCeJEpO5yTR341tyyhPgWSXn7cDFVfQUk37HGURtxSEEkuQlP4XN8ejVadvU2rPFh/
	ZZeCVaxeoz2qRAFnMV+zaFR+Kjqwo6bBU9J5Q1V7fkL9haCL/FpO/5Sr4t7T11krb7fgX8E372KCq
	TUw5AkhRYJRAt/pts7hSvl8VeX6EeR1EXMfnK2WBBBJr+hpixPZQmDd0p2RMYhLvpsJOJFaR4Hp+g
	Iu02TzfzxiuYtl58+WedyRLMc8k+FZhvqr11DlFfSwa5eV5V6kdBx2cww7LX09czKJTIzE+CXDpMO
	Co7dGLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdnY-0000000E7bW-1hdZ;
	Thu, 26 Nov 2026 18:02:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdnV-0000000E7aF-1IGJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:02:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BE7E1BA8;
	Thu, 26 Nov 2026 10:02:13 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E78513F632;
	Thu, 26 Nov 2026 10:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795716136; bh=ek6pWiEzSoxsFDDVTU1wdcAfubRIURJGSjuHrb5FqjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEnZJDatTGHmsf3CzvHuDgAQ56PvD0PVRCks3UzHlNqJLRKPG9QI4ikwsTOvjY//O
	 yr0hUZn90UwjrAXiehDySwVhfIJ/hZ1omwRPqZ1vbSgtVWzuHv2lbBvnf6QOG9LcM8
	 kP0UZVtEqNMWMRBL5mMS+/Xf075VH9+Y4x0QyI3Y=
Date: Thu, 26 Nov 2026 18:02:14 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: vladimir.murzin@arm.com, Puranjay Mohan <puranjay12@gmail.com>,
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
Message-ID: <20261126180214.GB809232@e132581.arm.com>
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
 <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
 <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
 <5c7f4a5f-fe5e-4367-9c60-86f1818346e8@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c7f4a5f-fe5e-4367-9c60-86f1818346e8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_100217_429321_28136EE3 
X-CRM114-Status: GOOD (  23.44  )
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

On Thu, Nov 26, 2026 at 12:39:52PM +0000, James Clark wrote:

[...]

> > > > Mark, Will, you guys seems to be designated as maintainers for
> > > > drivers/perf/arm_brbe.c, can you please take a look and give your
> > > > feedback as well? This is important and useful feature for newer arm64
> > > > CPUs, it would be great to get access to this functionality that we
> > > > had on x86-64 side for a long while now. Please help get this upstream
> > > > or, if it's not in the right shape, guide Puranjay towards a better
> > > > implementation. Thank you!

...

> + Vladimir
> 
> Hi Mark, Will, Vladimir,
> 
> Any thoughts on this approach where NMIs need to be disabled? Alternatively
> we could do something like track where the PMU interrupts and BPF snapshots
> overlap and then discard the BRBE buffer and make sure they don't trample on
> each other etc, but it looks like it would be significantly more
> complicated.

Could we restrict bpf_get_branch_snapshot() on arm64 to a free-running
BRBE mode? On a given CPU, at least one active event would have to
request a branch stack, and every such event would have to be a
counting event.

This seems to fit in this series. The selftest opens a CPU-cycles event
with PERF_SAMPLE_BRANCH_STACK and sample_period = 0, then takes the
snapshot from an fexit program.

Counting events can still generate overflow interrupts for bookkeeping.
It requires to refactor the PMU driver to leave BRBCR_ELx.FZP clear so
an overflow doesn't freeze BRBE. The interrupt handler could service the
counters without touching BRBE and losing the branch records.

Thanks,
Leo

