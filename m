Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055C2606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QtlpQXN5;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nwawK37F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YkiuKwTzFaKxocYqHbZJaiH6LJSy5oJp9dJAcEhaIF0=; b=QtlpQXN5UdKL1iHBzlzVBr0hN/
	1e3H53Vb6FecC14Zxm3JUNhuGfyYSuOLSkQDTxE65GlCJIqgoz1Y40YLE6+viER+1K56qn7d58Ukt
	Fquyd2EK2bupy/mFc0hc0jKvZIWOTYMFq+iJETQ4LZy+1zsT+tW105kxw5mV/TIJT3peqzlc1W6km
	VeUZJpcMOvI+Hd+DNbc2R0Ws2MFubzkAKWbdvmzS81tjZ/GYdMOGCf3jxHvSi8haG6wiF5i5NO+KG
	pJTJJ637BnjSr2tApW/GwkuXSBIGq48men8YigpynIGYaRH+enZBTqymPQOnWFLkajrZxpMN8eJrg
	FBXb70+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFAI-00000007fgK-0Gcq;
	Wed, 11 Nov 2026 20:43:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFAE-00000007fe8-2q1k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 20:43:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A64153B;
	Wed, 11 Nov 2026 12:43:22 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D12223F85F;
	Wed, 11 Nov 2026 12:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794429805; bh=mx3VbQ9/b7aZO8Gcx1adUQM+AmPwFj6BLz1d9u/uU8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwawK37Fkk3B1Dd8xpjDH02kguU+B9x/ZRaD5YNvyMo74wCWalB0GpoJEeLPKJE86
	 31HnfzhNse3dMDQrgcPdcaEiu7fOuN33UNqHb/5GPmekgyGPYeGmqNaT+5QEIdipZn
	 FwgeBshyJewJ+AFuAZMFCFOSPHuewTnmyAlPLNyA=
Date: Wed, 11 Nov 2026 20:43:22 +0000
From: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
Message-ID: <20261111204322.GH9176@e132581.arm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110154643.GA4159803-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_124327_100182_B4CA6D3A 
X-CRM114-Status: GOOD (  14.26  )
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

On Tue, Nov 10, 2026 at 09:46:43AM -0600, Rob Herring wrote:
> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
> > The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> > two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> > forces the device onto the AMBA bus, where the driver must read the
> > peripheral ID from the device registers during probe. On several QCOM
> > platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> > never probes and its trace path is unavailable.
> 
> But it works fine on some platforms? We have a property to override the 
> peripheral-ID which would solve your issue. That would be much simpler 
> and avoid the ABI break on any of the working platforms.

Looking back at the earlier discussion [1], Jie in v2 already proposed
"arm,primecell-periphid". Questions about AMBA IDs and ATID handling got
mixed together. The series later moved towards platform-device probing,
then became current shape.

Hope we make the right decision on arm,primecell-periphid this time.

Anyway, I'd like to apologise to Jie for all the back and forth.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com/

