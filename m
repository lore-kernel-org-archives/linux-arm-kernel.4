Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B6606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PFLlZj6t;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBmtl1yx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3AhUdEcgzKdrlwq2NAL1sur0NHocjLb2EjIt+CPfMxs=; b=PFLlZj6trErMGw
	39lw9aPtoiAOcs3cOCmOnfuBzN4W4foYZS8C5JZI2PNaTuXz8xt3Pggl6J7pgrYQHfxVxYRSr7ZZr
	vrnoVr32t7GN7ev0SoZputMoDsonUPjYC0rTpGBy9ioH+c5953igx9Wusk0DcaEQRmdfImROesWcl
	YIQdZPcQ4V5AfpOf8NjED8bIzX6Nh3WqJSJlvS6WxBIm52AmWx+SjawezAGasOjkQ63F3SI65kaze
	58bISQoe4R3M75s1cmIwUL5CFqinl2PP3SS+qUUkJaiQvVhvmnjhSFaOwwPtej+qea/X3r+0Ugftj
	CjFTIxKZ5FkQTQiSc88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2oh-00000008F2R-3baO;
	Wed, 25 Nov 2026 02:33:04 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2oe-00000008F1R-3FBC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:33:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3AhUdEcgzKdrlwq2NAL1sur0NHocjLb2EjIt+CPfMxs=;
	b=UBmtl1yxYFymupFZOAEFI4z1Cf9TaUsd/cPKjSgEnYFDpyWAfedRZZgDfYq4VorYrn6yO00rJ
	qzmXQD9NXqqPTu8WZcSTJitpJzw4+04TE0uK59pqhHxanPOj43kmiUqfIGUBXwLOLxicGkB5HWA
	5qvJH8Jmj1uQoJBdP4KfrD8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jZ3bp36ZJz1T4Ky;
	Wed, 25 Nov 2026 10:32:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B53D740561;
	Wed, 25 Nov 2026 10:32:55 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 10:32:54 +0800
Message-ID: <3a8afc1b-ccfe-46d6-b577-fdcf44ff2795@huawei.com>
Date: Wed, 25 Nov 2026 10:32:54 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI
 path reachable
To: Randy Dunlap <rdunlap@infradead.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <james.morse@arm.com>, <rppt@kernel.org>,
	<arnd@arndb.de>, <kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <bp@alien8.de>,
	<jlayton@kernel.org>, <catalin.marinas@arm.com>, <sean@starlabs.systems>,
	<will@kernel.org>, <jonathan.cameron@oss.qualcomm.com>, <tzungbi@kernel.org>,
	<kas@kernel.org>, <steven.price@arm.com>, <chenhuacai@kernel.org>,
	<tzimmermann@suse.de>, <wenst@chromium.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<vladimir.murzin@arm.com>
References: <20261123033222.1067923-1-ruanjinjie@huawei.com>
 <0cc7d474-adf2-46f8-bd4f-f352696313af@infradead.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0cc7d474-adf2-46f8-bd4f-f352696313af@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_183300_997333_82FB842C 
X-CRM114-Status: GOOD (  10.77  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Randy

在 2026/11/23 11:44, Randy Dunlap 写道:
> 
> 
> On 11/22/26 7:32 PM, Jinjie Ruan wrote:
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 176648941aec..9a3ce8ed18f4 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -6958,6 +6958,14 @@ Kernel parameters
>>  			1 -- enable.
>>  			Default value is 1.
>>  
>> +	sdei_nmi.disabled= [ARM64,EARLY]
>> +			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
>> +			path in place. Requires the kernel to be built with
>> +			CONFIG_ARM_SDEI_NMI.
>> +			Format: { "0" | "1" }
>> +			0 -- enable (default).
>> +			1 -- disable.
>> +
> 
> Alphabetical order, please. Entries are a bit messed up in the s* world...
> Please add this one between
> 	scftorture.weight_all_wait= [KNL]
> and
> 	sdw_mclk_divider=[SDW]

That will be more cleaner.

Thanks,
Jinjie

> 
>>  	serialnumber	[BUGS=X86-32]
> 


