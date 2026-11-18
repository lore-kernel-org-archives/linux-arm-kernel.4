Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA4606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f+kWayDG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eF3Ol4hf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1HMxZZM7bzhjsqc5qRi97t8nfWePquDvTBj8O0q7OyQ=; b=f+kWayDGTAHFi1
	dOgG7rg+bOFZQVivBx1oIdMnz+AzY33i7a4DYgGsxodfQAYSriFwhW2SPsafU9jAJc8AI7wy/NIid
	l98qaWKN6O3+X5mguujSbR6FP6FsFPczz/oP7nYOuPH3ATYqtpyzJYXsLE5omfSNA8ItSs+FVtcgw
	64icqk0H2ZEmjSIXccrVpmkBH8LfZdFkb0smPVfa7ZDYWqw2GuCqDyiJNIcshdzEuu+5N510FaDht
	TSTSpBskNY1z0948szK/kg7+UtcBhwzrqy8pBgDJ+H99JYqSHprwbCZ6FWr3D69GMFSKdTZau/67a
	bmFSk20pP3OiMvodEWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcDQ-00000008Q3G-3pwb;
	Wed, 18 Nov 2026 09:44:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcDO-00000008Q1h-1xbn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:44:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32B6D1596;
	Wed, 18 Nov 2026 01:44:24 -0800 (PST)
Received: from [10.57.70.68] (unknown [10.57.70.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56B783F673;
	Wed, 18 Nov 2026 01:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794995067; bh=tjyobLDvMwHsv5laRkEDlsj8Jtea9zcMz60ESGKWtpU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eF3Ol4hfTMslDvZZCDXyHFNZdVKs80uIAQhX3pGHYb/e7FGLr/KTD1tZD2hL6SYMt
	 7+qnDD3wxURjv1oyWoac6m5L/0fHGNefYCVfkmRsz7F+UqTYbbdq4oy2Va43uFTPy+
	 95rjAvbOEiJ0m8r6bkXcG+UoQHYZgiIpXb17M+Wg=
Message-ID: <35977427-b22f-44a7-a49e-9c30aceaf1f0@arm.com>
Date: Wed, 18 Nov 2026 09:44:22 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix the TraceNoC probe issue on QCOM platform
To: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Leo Yan <leo.yan@arm.com>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_014430_593716_9E8431FF 
X-CRM114-Status: GOOD (  23.00  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 07:01, Jie Gan wrote:
> The traceNoC (Trace Network-On-Chip) node on kaanapali, sm8750 and glymur
> is described with the "qcom,coresight-tnoc", "arm,primecell" compatible,
> so the device is created on the AMBA bus. To bind an AMBA device, the bus
> reads the peripheral and component ID registers (PID/CID) at the top of
> the device's register block and matches them against the primecell ID.
> On these platforms the Component ID returned by the hardware is
> 0x00000000 instead of a valid AMBA Component ID, so the AMBA probe fails
> and the traceNoC is left stuck in deferred probe indefinitely, leaving
> its trace path unavailable.
> 
> This series fixes the issue in the simplest way: keep the existing
> "arm,primecell" compatible and add the "arm,primecell-periphid" property
> to the traceNoC nodes. The AMBA bus then uses the peripheral ID given in
> the device tree instead of reading it from the device, which lets the
> traceNoC probe on this hardware. No binding or driver change is needed.
> 
> History of this issue:
> 
> This is an alternative to the series that fixes the same problem by
> moving the traceNoC onto the platform bus instead of AMBA.
> 
> Latest revision of that series:
> https://lore.kernel.org/all/20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com/
> 
> That approach requires a binding change and a driver change in addition
> to the DT changes. This series instead keeps the hardware described as an
> AMBA device and works around the invalid Component ID with the existing
> "arm,primecell-periphid" property, so only the device tree is touched.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (4):
>        dt-bindings: arm: coresight-tnoc: Allow arm,primecell-periphid
>        arm64: dts: qcom: kaanapali: add periphid for traceNoC
>        arm64: dts: qcom: sm8750: add periphid for traceNoC
>        arm64: dts: qcom: glymur: use Aggregator TNOC compatible
> 
>   Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
>   arch/arm64/boot/dts/qcom/glymur.dtsi                           | 8 +++++---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi                        | 2 ++
>   arch/arm64/boot/dts/qcom/sm8750.dtsi                           | 2 ++
>   4 files changed, 13 insertions(+), 4 deletions(-)
> ---
> base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
> change-id: 20261118-fix-tracenoc-probe-bf8025cad2ca
> 
> Best regards,

I assume this would go through the qcom platform tree, as this is mostly
DTS changes.

For the series,

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>



