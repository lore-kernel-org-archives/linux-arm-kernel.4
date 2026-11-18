Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65A6606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=txNxY2Uv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pUvw/9j5;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kec8Hpha
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y5uS4wiSy3bifvFb2xGvxqzue+H9klMv+96lcGTLuv8=; b=txNxY2UvvcXshB
	2F9suLHka2jfkPZxe9/lSWOn/Zp8Qo/CqzLOvDWCdDEh6+QwCrR/+z7OjBgB2z/eJ5YHwMcaGcW4J
	+8b9FDcWclJHSqELLV5LTLLIrDmDYGFloR5RX4PYbtBRq9xV30o4SgT1DRiKbUQLLssyLfivxaIvT
	XT4s25cvyRVAyp2WvCe7q7sfZ1RAs9YNsenESABGaCukj7f8Y4fBe7iE85DJZGzpsVaodr53HUmQq
	QdtWPioSi4GGqsnuuHJt4WeDbbJkTJ/SeQiZceURMRzTusdV0W5wzDjueefC6gtQRHw1h1Vewf2dI
	6iv3Zic/WVOrasDTkKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiva-00000009d8H-0w8w;
	Wed, 18 Nov 2026 16:54:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuX-00000009cWc-2eZl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y5uS4wiSy3bifvFb2xGvxqzue+H9klMv+96lcGTLuv8=; b=pUvw/9j5lp67lRyXyunttNagpF
	Z6yv0YmO38VINW9ow1KkNa5Dy472WiJ5loOq5vcJm17hOV4mDEIzdpjhfPk+AkmmsXz/VJEFbSG3z
	IbUPS6RO4Yh/1QK/+Qf319dI86LseExq3vvM5QGSjv2tIMvLM745LuaEnBF/B1REloc7wNHIWaH0w
	SbvBm97V4xezO/5bEaspkmQ1PbsJxvJNIDGHc5dNTqS9vf0eiKcPMi4d/Zf+p4eSeIVio0/dGKyWR
	W8DWxlpgJvu4WODRUw935OLPR2Zjz4d5fTwKrEo6A7hVG89swYKgTjh/DLk6avstkXsBmGUjGP7pa
	wwA645gw==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuU-0000000GIqS-1RSP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:53:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1069866f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795020804; x=1795625604; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5uS4wiSy3bifvFb2xGvxqzue+H9klMv+96lcGTLuv8=;
        b=kec8Hpha/8uMnlJ2XVyfgTzdUUXTUjMK3ilZgmlo8DzkLb8JMfPH4C/6V5Koo1lwdS
         zFvE8Rs92yAJy0sN6fvPx4nFSB44Te2Z2YfZl47yUDbbnqMkaJdUPzOL4fJGjpfnR7Zf
         +WGpCSyZyS1YwMAioVmD8kU4z5cE2IHA2i0TmRoAS/LROQbEQxPIBAgYjDJzDNIPVkl+
         52q8ULZtsnNZvfxhHSFHkhkEmcXTtWMNz7BKZjf5vZW+tO1zrBlFSslk5Te9+ZGn2/cw
         pvJWCd9n2q4iBJoEtoRUOcxX2Tp5ALrsRf5fTZQv1+7/tbwfCwu0BJ6GU8iXQqJ3t0jo
         3L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020804; x=1795625604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5uS4wiSy3bifvFb2xGvxqzue+H9klMv+96lcGTLuv8=;
        b=QDFlxhv8wiUybUY5sFmDkA5Ez3bfPve6594VCUHlafQ80BGZY0D9l5Pz1uGkXscrM4
         LDiRjog5e2rQl+nmWwEJaUDWP6iw+SlgLPNIe3Yljne2HNr4AndQHGtqJ7Jwvwpr4C3q
         40smfKPKC/XpaW07FvxKC3WrIFDUTQsbavR+IzseZCAUTLS5Bnvdi15KmKA9yZVl0YXE
         cQ3ekIYqJthTnis8UihewqHBcueIlWBURVxW3+NWactwdYDSjXfTek/UbkddC47MghgV
         XbLmtCW9c35NuaJdOQPV/YUX/rchoigrpEkVphlapMQfJYJkGS08j9DNbBwyHzubAq6f
         k6Ww==
X-Forwarded-Encrypted: i=1; AL+hErFH93jbaJf17g4rxB7xZx4/ubj1aSMGXRnsfNLoHNFVOGFGWvNE7OrqdGW6g95KI2cGO0PkKzI411DqB2UogTSA@lists.infradead.org
X-Gm-Message-State: APuU4Z8RfYoS0xov4Jce4vyny2XccbAGHgaCt0p/QfOtAgSxIGTjpP5P
	6Wio9yeKe1LRs5G6E01iGnKYWpYgvfj5lNX1C41o3lP4xhuQsyiTNdbZct7BhDVWmD8=
X-Gm-Gg: AZFdTZfnmwAgy2dg1B4Y2D1Smo3pQQAJMEoEOW42a4Yqd0c86aRCgTcqmW5BTLkWO5K
	SOnbmo9Uc++6OXOUYfBtT3tTKynIyhzGtBAOiaBPsxeSFec15ddFevvtkqpl5XnowGHkAbyMODJ
	9C/3Xdubl9GrVhkCLlsr32qO/xnyqK++/FAr3uroZQjzihsyMNZ2LagNkMK5PMn0oFecWkWUSb9
	FeUZzBOgU/PIHCx9qAZXY4UawrxfYpeynsqi3lmVwp5aDdCAof9r2mFWPtJrQL+Y6ZloMrLjbUl
	Fuc0G8Eqbe7JSR5vf1EelgevLwHJEZHem6azuHEHP7h+ALcGf7nMGu3nNq8fUiNHJM0a5tdFpxJ
	EsuD/si/Si5O+CT7aQv92f5nNmmZDYjPA79lMB5FhU0Mhhl1IRCy7pmdGz86tITAmnXcQcXj+LK
	HLW1J80NloOVzYQMn7d41l54GK4fFZQ5mwkzl3P2HHAJYlnx8G+aitZirMP9GqxwpXu/DbVlMKg
	So0G3ack/Go4ptUUlGbfGxjVlZTQqVYcJBSfkJw+GrIgmqxIw/R+Z5igv/NY7Bni3HBstC/ZO+z
	hGrVsE9cuT6E21s2sRUAOF4bXP1jPP3T2Q==
X-Received: by 2002:a05:6000:46ce:b0:4a4:856b:3503 with SMTP id ffacd0b85a97d-4a639d16f78mr4817368f8f.34.1795020804143;
        Wed, 18 Nov 2026 08:53:24 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm5886133f8f.17.2026.11.18.08.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:53:23 -0800 (PST)
Message-ID: <0e81b599-a2fd-40d6-85dd-841bb012f18e@linaro.org>
Date: Wed, 18 Nov 2026 16:53:22 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] coresight: etm-perf: Serialize AUX topology
 access
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-3-dedf961aca0e@linaro.org>
 <20261112180920.GM9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261112180920.GM9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_165326_336437_82E2A8A7 
X-CRM114-Status: GOOD (  22.70  )
X-Spam-Score: -0.2 (/)
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



On 12/11/2026 18:09, Leo Yan wrote:
> On Fri, Oct 16, 2026 at 11:46:13AM +0100, James Clark wrote:
>> Perf AUX setup walks the CoreSight connections to select a sink, build
>> paths and acquire references to the devices and their helpers. Unlike
>> sysfs tracing, it does not hold coresight_mutex. Driver registration and
>> removal can therefore change or free connections while setup walks them.
>> Adding a CTI helper can also reallocate an existing device's output
>> connection array even when the device is already referenced by a path.
> 
> I agree that bus traversal and devices acquisition need protection.
> 
>> Hold coresight_mutex from sink selection through buffer allocation.
>> The allocation must also be protected because ETR buffers can look up a
>> connected CATU. Release the mutex before calling etm_free_aux() on error.
> 
> However, my concern is about the locking semantics. We should clearly
> identify the races that coresight_mutex is intended to protect and
> limit its usage accordingly. My understanding is that coresight_mutex
> primarily protects CoreSight bus operations.
> 
> Holding it across the entire perf AUX setup might silence AI review
> warnings, but it may abuse the lock and hide synchronization issues in
> the CoreSight core APIs. OTOH, I'd say SysFS mode should not acquire
> such a big lock as well.

Suzuki already merged this because I had to move it into the small 
sashiko fixes patch set as a dependency. I agree it might not be the 
correct fix, but it's a small change and it's likely the correct fix 
would look very similar to this. We can always undo it or re-work it in 
the future, it's pretty harmless.

> 
> BTW, I think this change is a distraction from the per-thread fixes.

Yes and no. This set adds additional traversals to the tree to determine 
if a sink is shared or not, so it increases the chance of hitting the 
issue which is why I thought it made sense to fix it.

> My understanding is that this series aims to fix multithreading with
> a shared sink, so we can address device lifetime issues separately.

