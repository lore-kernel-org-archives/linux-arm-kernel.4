Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0204C606A887
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aRcD+53K;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C0DwQSOz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IFNXUO9Jr7TJnTM4pI8+RXJ3qfoW4xa5qsBB8IRLyHY=; b=aRcD+53KIaH2bY
	JUSn0GLHfGQ930kkXsxi6nvVpD5Pc9cyeasWcRzx2jDTbAjA28PfvDfidONBZnWfInrXzgEVrrD/+
	Cz9yBpBmShE70KFRTeF3UcErgqSdM+TpSm8zHRI5jEta3xYcgk5Cwd4i9Ww4EB7An8ItPYT57yma5
	5XL28Bn5RYifPKz01iX0w9zx8TesmiEx2R6syep+TMN6S/j0+ILVbaXBrs2LA1+VKGBofi7TGfxFD
	J6xQ+ouqR9dPmwVnjONs9jWHa3Az4NBkOAVu6DxDAaPIHF92vKKxpkc2w8EZIb1F5LTn4hYGZxDNM
	DKRVMaFvz1q8UR9NApcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7ut-00000006kMj-42ZQ;
	Wed, 11 Nov 2026 12:59:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7uq-00000006kKM-2RpK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:59:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97E801576;
	Wed, 11 Nov 2026 04:59:00 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9DE83F632;
	Wed, 11 Nov 2026 04:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794401943; bh=Cdy/qokJ1H5l2i4X0IPSgmP/Ge5RQRh04NlGw7FyG/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C0DwQSOzO2O5bcR3VXJlOpuuJ9TPGqBenmbf9NmpLIwifpTSmMIcrDyG/aS3Od6UW
	 IzrdOYaRBSikSpe8Z2mfLYIo5U7T/YAlenp3b3uPY1XJX0TrjklvzbGzlUVHjHpv7U
	 2qWTdIvBOwzT18Unl4VGC1N3sZHgfGpA5pC2leiY=
Message-ID: <14c0956c-904e-4a6a-98a0-882514d77b08@arm.com>
Date: Wed, 11 Nov 2026 12:58:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Rob Herring <robh@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261110154643.GA4159803-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_045904_748818_06A99656 
X-CRM114-Status: GOOD (  14.59  )
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

On 10/11/2026 15:46, Rob Herring wrote:
> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>> forces the device onto the AMBA bus, where the driver must read the
>> peripheral ID from the device registers during probe. On several QCOM
>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>> never probes and its trace path is unavailable.
> 
> But it works fine on some platforms? We have a property to override the
> peripheral-ID which would solve your issue. That would be much simpler
> and avoid the ABI break on any of the working platforms.

That is true ! Sorry, I didn't think of the quirk.

> 
> But this is already applied and it's not any platform I use, so I don't
> really care.

I am happy to revert these changes and let the DTS be fixed.

Cheers
Suzuki


> 
> Rob


