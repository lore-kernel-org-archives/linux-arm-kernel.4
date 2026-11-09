Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSbQDHZK;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h79isfwl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wgmYZSso3S5s7ntmVXft5Hjp1pkxoHbFdmgMj87YoCY=; b=CSbQDHZKg7uqN2
	mltw5Zk0ieb3E11KYPfdRnSbHlhJzGsU1RdRkITKC0SvqP010wuVk1Nw8D9Rp/LYCykKYOzaz7g4p
	QMm3/69ht8qleznAh57jbsCv8nXpg2tgNPF+kN9hYTfz7CJ+cm4DVrYo7ZjmDoc3Hbp5qsscybCN8
	7DY207/GN6dwO/1B3CCqyr8DVVpSjemSrTGm011ABRGVpVrazqdhfBiWGP4JFfezSeU9l3Nq3hqeE
	CyOFCM92kCOCs48q+YeoA7CTO40X6rQEUQY4YFKifGEKw8KhGvO5QkJfe/o6luVTL3LW66buobkRe
	ul72GplmlL/jyDVeNfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMtr-00000000SAc-0gfi;
	Mon, 09 Nov 2026 10:46:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMto-00000000S9g-2Bfp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:46:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 760C11576;
	Mon,  9 Nov 2026 02:46:46 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9183FA1F;
	Mon,  9 Nov 2026 02:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794221209; bh=zGW4Vk+oTTcAeYvgmOhuujaSbESC2vD11QIhzUqWk7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h79isfwlJj5NA/YUWS8Ik8ho4Z0G1xk/NdkZHTI+7kY++cbuf7734EwR9LCt+Ww0O
	 EJouX7BeyT+m5P4fhTwO4x8UvN4uCSp1Up19Def4Ui50nAl5N0tzsPl2WATHSB74O7
	 BPCwwkSdpPWko5ab4dSUwtIoV7q7/DoVqO+iIaHY=
Message-ID: <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Date: Mon, 9 Nov 2026 10:46:44 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Abel Vesa <abelvesa@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_024652_648730_59D507FE 
X-CRM114-Status: GOOD (  16.44  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 01:25, Jie Gan wrote:
> 
> 
> On 7/10/2026 10:38 AM, Jie Gan wrote:
>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed 
>> the
>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>> forces the device onto the AMBA bus, where the driver must read the
>> peripheral ID from the device registers during probe. On several QCOM
>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>> never probes and its trace path is unavailable.
>>
>> This series drops the "arm,primecell" entry and turns "qcom,coresight- 
>> tnoc"
>> into a standalone platform compatible. Without "arm,primecell" the device
>> is created on the platform bus and probes through the platform driver by
>> compatible string, bypassing the AMBA peripheral-ID read while 
>> remaining a
>> fully functional Aggregator TNOC that allocates a system trace ID (ATID).
>>
>> The series is organized as: binding first, then the driver support for 
>> the
>> platform-bus compatible, followed by the per-platform DT fixes that 
>> switch
>> the affected nodes over to it.
>>
>> - Patch 1 (dt-bindings) drops "arm,primecell" and makes
>> "qcom,coresight-tnoc" a single standalone compatible, and updates the
>> example node accordingly.
>> - Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
>> match table and renames the itnoc-specific names to generic tnoc names,
>> since the platform driver now serves both the Interconnect and Aggregator
>> TNOC. It also restricts the ATID-unsupported handling to
>> "qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform 
>> bus is
>> no longer wrongly covered and correctly allocates a trace ID.
>> - Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
>> traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
>> fixing the probe failure on those platforms.
>> - Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
>> "qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
>> tn_ag_* endpoints show aggregation), so it should expose a system trace
>> ID rather than being treated as an Interconnect TNOC.
>>
> 
> Gentle ping.

Apologies for missing this. Please could you resend it based on v7.4-rc,
as this doesn't apply cleanly on coresight/next

Cheers
Suzuki


