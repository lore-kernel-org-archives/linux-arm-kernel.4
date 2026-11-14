Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB012606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 02:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1dAy9nh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuxlHytr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4uPdj1q0dwlQ2TwjgT8KIFsg9HWLPMm9FUpycKV1caM=; b=Y1dAy9nhuCLC91
	5ym0EJ8qFDLaC67fW5aJ+t6m7Ct88XCHHh7V5DQRSNLAfvkbtdjJO8QuxWw/ZbyTNlV8VTJR5eu5s
	Wed1w7h+E+uufmpCAzj6u9wxkBjaXrJXAHe8JfpS/nNv6e+ZYN5mNxN/i2v5LEGpDBvG8fR99I39n
	9AFjaGRaod4aNmgHEGoCEiCM7B1YcCk6chB9vNZG66o015GvqWzF823R4tl1FHSsow3+iS5G+QArE
	Kzms77iZCRgLTk46n+jMeiMWz2OLxKfg/dHDWNCMSHJtz3TQokeUQa5b+huii209F571ZhOsgR2ZI
	2wRloHGiBxj1Io7kzHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS3wU-0000000F8fQ-0sbg;
	Sat, 14 Nov 2026 02:56:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS3wS-0000000F8fH-40bI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 02:56:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7543544011;
	Sat, 14 Nov 2026 02:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920E81F000C4;
	Sat, 14 Nov 2026 02:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794624996;
	bh=4uPdj1q0dwlQ2TwjgT8KIFsg9HWLPMm9FUpycKV1caM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RuxlHytrVTO8rejQIoyxxp2iW+8P4iUbuZvJlwx11GstPGut8L/wh7dV/1s1zScZb
	 wgjzQZg8sVDy6odiG4rs63uK9DDwkwcDZ84GR5yYTZ7xNb4zshlqZJKt5Gop8IEZrp
	 5CX+eAh+FIRXANH/TfRzcLtthIz7enGG9S1MKZwIOaRAoCqfyAzLWTnFiiONQx/jC5
	 ZblGzYT/hj1E5eQLYG3Rzvd1i+yg5C0/05+JuRK72au1A7aQK4uyPxcwzVDTmi8B2J
	 5Ds/Aa0qrnZPkn0kQ8NWfvS/UQ2bRYAIBHB/mEA4VQuFjPPQ/uX7u/zgzC5T51MAf8
	 XCDk4LSKu/QWg==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, irogers@google.com, ctshao@google.com, 
 Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
 rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
 john.garry@linux.dev, will@kernel.org, james.clark@linaro.org, 
 mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com, 
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
 adrian.hunter@intel.com
In-Reply-To: <20261104160716.2910873-1-bwicaksono@nvidia.com>
References: <20261104160716.2910873-1-bwicaksono@nvidia.com>
Subject: Re: [PATCH v3 0/7] perf: Add NVIDIA Tegra410 uncore PMU events and
 metrics
Message-Id: <179462499501.532197.7672292578194020003.b4-ty@b4>
Date: Fri, 13 Nov 2026 18:56:35 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 16:07:09 +0000, Besar Wicaksono wrote:
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs, and fix perf's aggregation of the Tegra410 PCIe PMU instances.
> 
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards
Namhyung



