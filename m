Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C7606AB4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zt5toQeR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8rfhSdu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zeb6oiymxFDObRDcInmYbRceyPxEMFNrP3XnY1mdxgw=; b=zt5toQeR0hRW/K41MOpLwoZd6b
	49s35yFTAtvpZlRm+zR4C1TMQKFCUnEdGTPiLxMEp+2yjvotb51AZ7nS3qto8k22al9mMHvyDXzI2
	+zeCv5M99IgWSHa3M10LSgdaTORtAOUfEOf6wLsM5VuGDCC5Fei8ghN6XnISCpSivdi4truGj48AI
	Y0EesjtGQi4Pt5LmyRvH/bm7SjqWec5RTM6HYSbGBCCk4EEWMmhRKT0r8WgKXhkbTvLTOrw+Bpg54
	PFL8Zq26wOHUoLMzMLk9t4+RaCFk+jRa1L78O4N2lmsaJZyMduRcl9vRhNn3AFQw2IHtj1hgEmx6n
	MdJ5QgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQo3d-00000004RIO-2Hy1;
	Tue, 10 Nov 2026 15:46:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQo3b-00000004RI9-2dWm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:46:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D13416145C;
	Tue, 10 Nov 2026 15:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531A71F008A1;
	Tue, 10 Nov 2026 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794325606;
	bh=zeb6oiymxFDObRDcInmYbRceyPxEMFNrP3XnY1mdxgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m8rfhSdu+qgwEFNcVdZ4mx8q4gM2VEPIdELukpJS9tJxo0nIViQ2JPw0kNyDO+2Z1
	 ZN8uucI9P9UfXIfDZOY+7sZkrLmIDNu974cbzyFKz82lK9SKRvczFajlIhN56HvaYg
	 q+fcYMgAj/eV9hlv+Q9Km9gxnXlixiMfBf6BGmJX1C4UXV38Wh9vz0gZeC9zNZVBku
	 HvcAIGTa3cmRv9VzEQKXfO6BNVslhBHmwiE3DYHT9rlGUW3/1sjn1UZedgDCdUYsye
	 Kek2TKqvr/9bDJ42HIydrPDRUb5sUBHdH+y4XCmiMuTnP+p3AVxCGZJPeiWSsr7fZS
	 Nf9U8Mnp7oesw==
Date: Tue, 10 Nov 2026 09:46:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
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
Message-ID: <20261110154643.GA4159803-robh@kernel.org>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
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

On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> forces the device onto the AMBA bus, where the driver must read the
> peripheral ID from the device registers during probe. On several QCOM
> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> never probes and its trace path is unavailable.

But it works fine on some platforms? We have a property to override the 
peripheral-ID which would solve your issue. That would be much simpler 
and avoid the ABI break on any of the working platforms.

But this is already applied and it's not any platform I use, so I don't 
really care.

Rob

