Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20DD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oGg7skRs;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=sdAuBVV1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XkYzj1wDxfAIpCaHTXRvZeY0rPBL7U7tgJ6A5K+XKXc=; b=oGg7skRsNYghH2
	brqZVKEwAhbJyxpgZXGANbYIbRZdG8twgrqOmrqfryJ0TDZ4IHogk/JXOZ+6NGaI+5GGJw1qN7z8F
	AHKJfa5cdQhYHniO6kkmywEslzI98X0Iu3Fs3EV0NG+DLovG/V2lo1BUMqeK2/GY1DU+EcPCx82Sy
	APjXEIo5bwvXtN6mYzd3NywOaB9Lw4IXwPguVR7Bnz6uHdnLnOBUATnDAV4U9UqJI0YYvSw8TPLQ0
	Xns9HcHFDBRyizY0kwnbR7DgLbQ/yT9+X2Pgytd6ZAaIYVeYUL2oJ5buZcFuI9fCyhn3n++wx3bON
	ZoxWsjadUJP33lvpUUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRE4N-00000007Wdn-3uJx;
	Wed, 11 Nov 2026 19:33:19 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRE4L-00000007WdP-1ja2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:33:18 +0000
Received: from [10.4.158.9] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5AE6F20B7166;
	Wed, 11 Nov 2026 11:33:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5AE6F20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1794425592;
	bh=XkYzj1wDxfAIpCaHTXRvZeY0rPBL7U7tgJ6A5K+XKXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sdAuBVV1iYh6ALVSvPbbuS3kbrw9KywjuIwbdoNJ4kCMluqCCr9IIpLf4ZHHsd+fk
	 RZva/j1N6fubwMR+Za3nW+nlFP8Q2wV28gYJu7ByeOqCWqU0vZlxG6Y3VEfv+yvEkQ
	 7xQ31zo5ASqixU32rt2PhC2x/T6EuAn9cAHue3bM=
Message-ID: <4d5ff278-bd47-4304-967c-92313dbd4fd7@linux.microsoft.com>
Date: Wed, 11 Nov 2026 11:33:07 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] arm64: hyperv: Implement
 hv_is_isolation_supported() for CCA Realms
To: Michael Kelley <mhklinux@outlook.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
 "thuth@redhat.com" <thuth@redhat.com>, "will@kernel.org" <will@kernel.org>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
 <20261031001412.4150488-7-kameroncarr@linux.microsoft.com>
 <MN2PR02MB6863D42CE499C3D423EDBC10D4712@MN2PR02MB6863.namprd02.prod.outlook.com>
Content-Language: en-US
From: Kameron Carr <kameroncarr@linux.microsoft.com>
In-Reply-To: <MN2PR02MB6863D42CE499C3D423EDBC10D4712@MN2PR02MB6863.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_113317_493091_6D8DAD5C 
X-CRM114-Status: GOOD (  18.75  )
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

On 11/11/2026 10:01 AM, Michael Kelley wrote:
> From: Kameron Carr <kameroncarr@linux.microsoft.com> Sent: Friday, October 30, 2026 5:14 PM
>>
>> Provide an arm64 implementation of hv_is_isolation_supported() that
>> overrides the __weak default in drivers/hv/hv_common.c.
>>
>> The implementation deliberately does not depend on
>> hv_is_hyperv_initialized() because hv_common_init() consults
>> hv_is_isolation_supported() before hyperv_initialized is set.
> 
> Quibble: What's the genesis of this statement about
> hv_is_hyperv_initialized()? On the x86 side, hv_is_isolation_supported()
> doesn't depend on hv_is_hyperv_initialized(), so I don't think you
> are making a distinction vs. what x86 does. The statement seems
> like it might be a leftover from an early version of this patch set.

From what I recall, I wrote this line after going down a long rabbit
hole attempting to have functional parity with x86
hv_is_isolation_supported(). I agree that is doesn't make sense without
context.

I couldn't find equivalent methods for checking if the Realm is running
on Hyper-V. I initially considered using hv_is_hyperv_initialized(), but
that ran into ordering issue described above. I eventually concluded
that just returning is_realm_world() is sufficient, since
hv_is_isolation_supported() is never used to determine whether the VM is
running on Hyper-V.

The comment would be more clear if it simply pointed out that
hv_is_isolation_supported() functionally differs on ARM64 vs. x86
because it does not check whether it is running on Hyper-V.

I believe Wei already applied this series to hyperv-next, but perhaps he
can remove this line from the commit message.

-- 
Regards,
Kameron

> Michael
> 
>>
>> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
>> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
>> ---
>>  arch/arm64/hyperv/mshyperv.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
>> index da6c3aa0..8a2c446 100644
>> --- a/arch/arm64/hyperv/mshyperv.c
>> +++ b/arch/arm64/hyperv/mshyperv.c
>> @@ -187,3 +187,8 @@ bool hv_isolation_type_cca(void)
>>  {
>>  	return is_realm_world();
>>  }
>> +
>> +bool hv_is_isolation_supported(void)
>> +{
>> +	return is_realm_world();
>> +}
>> --
>> 2.45.4
>>

