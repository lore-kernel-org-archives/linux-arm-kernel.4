Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4648C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XxpRsgOa;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MDYQ3pcg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CZnwncXttnoeDTUcItONMH1HUxzaUc0HeWzS8YajeZo=; b=XxpRsgOa5xcLxf
	80M/kxYa6a6YRD9pH+IjmctPljlDb9/sxMhyl15pHY/QmlkpYsIEWJ5eZzRwc6q9JI4V9RRHkTzht
	dy8AAKrtTUwaBwfrHrVCHBw4Tsoz20b6Ul1AYsoE3/+XrlIEM296NiiRhs2bP5L0TiU6WCHfz6J33
	2d34vImYQS/gclqZthU64WtqaRUMXiWSrp83q0d3BLYOzvzfRsOKEh4NugEJPMOlJ/82KCDvk0qsR
	0VsgLlFplfMGxvTT4TzLFYymHLPlRb93BoxxbHlDpYSQpd9bGeiUw75qc/nzJFMNtMZxPf/EAxdNC
	ImKTulxJAol1LN/UuILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSssR-00000001kd7-3SOu;
	Mon, 16 Nov 2026 09:19:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSssP-00000001kcY-1l2H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:19:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 437321476;
	Mon, 16 Nov 2026 01:19:43 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCAB23F763;
	Mon, 16 Nov 2026 01:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794820786; bh=x48MGglr2CAwjlYCBk5Uk7nESxpqLnVRRwqaJD9EKQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MDYQ3pcgq/fyazZWav1V8GCbaXniG47/MsXdi+L8kJg/9MnJZQMg0rd30s8dNGend
	 f74CGwzElmESwFiQFd/98nrfKDbHv7OvYnk8N0T7X/E7Epm8s30n6ECITioJzXdOOK
	 UkxLipbRfhTxaer6gx/Mmr1orXbV/YSFH8ZAp4WY=
Message-ID: <3bb22604-1850-44d7-9388-3bcb06813eff@arm.com>
Date: Mon, 16 Nov 2026 09:19:41 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Jie Gan <jie.gan@oss.qualcomm.com>, Leo Yan <leo.yan@arm.com>,
 Rob Herring <robh@kernel.org>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
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
 <20261111204322.GH9176@e132581.arm.com>
 <e0e07848-361d-4977-a585-a0810452e150@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <e0e07848-361d-4977-a585-a0810452e150@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011949_523990_0A381736 
X-CRM114-Status: GOOD (  18.53  )
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

On 16/11/2026 02:03, Jie Gan wrote:
> 
> 
> On 11/12/2026 4:43 AM, Leo Yan wrote:
>> On Tue, Nov 10, 2026 at 09:46:43AM -0600, Rob Herring wrote:
>>> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
>>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only 
>>>> allowed the
>>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>>> forces the device onto the AMBA bus, where the driver must read the
>>>> peripheral ID from the device registers during probe. On several QCOM
>>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>>> never probes and its trace path is unavailable.
>>>
>>> But it works fine on some platforms? We have a property to override the
>>> peripheral-ID which would solve your issue. That would be much simpler
>>> and avoid the ABI break on any of the working platforms.
>>
>> Looking back at the earlier discussion [1], Jie in v2 already proposed
>> "arm,primecell-periphid". Questions about AMBA IDs and ATID handling got
>> mixed together. The series later moved towards platform-device probing,
>> then became current shape.
>>
>> Hope we make the right decision on arm,primecell-periphid this time.
>>
>> Anyway, I'd like to apologise to Jie for all the back and forth.
>>
> 
> Never mind.
> 
> Hi Suzuki, Rob,
> 
> The "arm,primecell-periphid" override is the simplest fix for the issue. 
> Which fix are your preferring for the issue? If we want fix it with DT 
> property, we can revert the patch series and I will post a new one to 
> fix it.
> 
> As Leo mentioned, the AMBA probe is not affecting by the series.

Alright, I will remove it from the coresight next, please send the DT
fix.

Cheers
Suzuki



