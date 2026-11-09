Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E11606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 03:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S/eVXgsJ;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KDC2SmH3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7+1+PZFd2GII1zKvv2aHrH8V0Dvf1LcNr2LNa2B/+bw=; b=S/eVXgsJUM2pbo
	hApywnRWQjzbYF5mAF3OhUJDsunaAOHMSRSkOy7vrgL4iWxE3wEar2Z4YY9SzFdYd7QQSu9NgpeLm
	y/iPLQ/qLjuJU3GJ1bhsyejSvu8uGueC/MI1c8ZnJXQLzBTWpCAnD/QOxp2OPIgid5mbYZj1lBmXz
	Q4oHhIDunwAx0OEL7Oj+5JClgd34DLwFbmBEStDjs6aqMZbb35k/iYyGrDm6TIpZT+a4jNFZgrPmE
	YNjGoiEpcpyuxd7O6IysMi2C4vk9i2j47imuCD6QXai/7rxFTLmoSFBQF/xQb40pgLTIgExBWK8kW
	tnfPEGKabrL0Ca3k0F+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGLt-0000000HFux-1g37;
	Mon, 09 Nov 2026 03:47:25 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGLq-0000000HFua-0DwP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 03:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794196038; bh=7+1+PZFd2GII1zKvv2aHrH8V0Dvf1LcNr2LNa2B/+bw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KDC2SmH3UdUqTAj/naxHFvfTao7XlpSet7tQIZzg+YBlYiMajF461CMioKaj/0pCy
	 I5mx2c1PQD8Rzhbl3Pkk4CTd89aviDffBfYETGfgiPu1svwCEhYLD2QrpQDLYpia7j
	 FRkDC1GNAEMhw90KrGYcivjnNGgrmoKeF7Ks6ZDI=
Received: from [100.125.153.207] ([139.159.170.67])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id BCF20465; Mon, 09 Nov 2026 11:47:15 +0800
X-QQ-mid: xmsmtpt1794196035t0rwr8jma
Message-ID: <tencent_90CC2DA414E74CDF71D24A6ADAC784336206@qq.com>
X-QQ-XMAILINFO: NOGirAuTnwHF/KpxD9OFSpM3LriLQs2mH/B0slkH4kz1eDZ9sqIUCKMvAsfqo+
	 pLJXc/Fu+EW2AJk7AkmtqhruK1se1lIbdRaT9NiNIpMKzN+cQ4ytdg69LVtsoGJ2zywNMaEDW/Ck
	 g1Om437R3M2X+3/ZDZJTgo8hcARoNJ+oxvMs/xf82IOYx2zxrpKwwHlEQddO31wzmwFuEbwWobm4
	 ia3HB38VCW+ZMdYN08EgcSQ54ZhJmr79++EaLqp7WSScIH0fe5R5FWP85TGasObfpZwmpEAC8YwT
	 x6heU80jK0DqyBTCq/KyPeiBnZBPjJqAC0ugnj9hVpLklUP2RaaolOm8NuXdt11ULirrvvi8ExPV
	 x9x2zlGvUBkD1AsPf62urvPQk8TguPOMS02f4nP+ASVv89HWI8GqtGh/zBU5hraTLHlc2vMxKgAg
	 vAtcQzjsI15W1aLEDGqx+Ok2w83TVMZIjEQGc0jaRPVHDyUkBMZGw7QTtVZb09J89cgCNLkUQInl
	 SenKGqMFscDKWuC8YDf/RQBhHH26yyoNWMgszcbL3iJwDfPg6fUxJPTPKVfJHDQoFG9orrnBXFVE
	 oR+1tBDHrJ6UYNCG0NmynRLjXeAIK5wb+qfvR9/ijVIeo/6osIX4k9Ly9AAmhudAHWPV8Q0SiEuk
	 9upCL5bS5SfHZkqwQAPuaeLfFTNlyKxpJ8ju5X19NdlGHJrR8tnz4/G/9f1Ek/VCnw88MMtyw2tF
	 u8FdiMK0529VKzzCLSvURYXbBtmBb/ql5KIez0IvEHhXvPBMLMbJbjLLRvJO0x8GPNyRjd7ZTG1f
	 pmoIWM4sLzo6p/VSnERfdD0m4tAHON2iExo6kytw8qFu1Lv6zxdGyCFNRRTKJC/9uXGYmWe0d2cD
	 oatJwXWawuaItDqYTmYNkNv4FYzviFps0f20ZnkchHxYYdm42M3J25tsVJxxtAnYNTCxIrSFa866
	 OPiobQH68ZigCsfkdH5ZYkz/2YT/Y2svAbsmlQIOjvdop5JpxGZhiKged4rOS85a7d1rOdDFfsdr
	 tU86MNLAuv06+uUHNXPHpDIP51+4mSMGJvhr34s6X8JjNGPWSsNuCLZgrf9/o=
X-QQ-XMRINFO: M/715EihBoGS53Pa7FxY/h8cOY8DgkUKgQ==
X-OQ-MSGID: <676c4f1b-1daa-48d9-b444-11db0fda69fd@qq.com>
Date: Mon, 9 Nov 2026 11:47:15 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: kexec_file: Stop using the Image text_offset
To: Catalin Marinas <catalin.marinas@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, mark.rutland@arm.com, pratyush@kernel.org,
 leitao@debian.org, mpilaniy@redhat.com, yeoreum.yun@arm.com,
 graf@amazon.com, pasha.tatashin@soleen.com, akpm@linux-foundation.org,
 baoquan.he@linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@kernel.org
References: <20261105125442.2282987-1-ruanjinjie@huawei.com>
 <au4JOjnQlx2aSpiE@arm.com>
Content-Language: en-US
From: Jinjie Ruan <2118537295@qq.com>
In-Reply-To: <au4JOjnQlx2aSpiE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_194722_419218_44BBEE42 
X-CRM114-Status: GOOD (  26.56  )
X-Spam-Score: 0.5 (/)
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
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Catalin,

在 2026/11/7 01:07, Catalin Marinas 写道:
> On Thu, Nov 05, 2026 at 08:54:42PM +0800, Jinjie Ruan wrote:
>> image_load() adds text_offset to kernel_segment->mem and subtracts it
>> from kernel_segment->memsz.  For CMA backed segments this breaks the
>> load path: the payload is copied to page_address(cma), which is the CMA
>> base, while image->start is set to the adjusted address, so kexec jumps
>> into the middle of the kernel.  kimage_map_segment() has the same
>> mismatch when a segment has been moved.
>>
>> The adjusted memsz also breaks the release path: the CMA pages are
>> freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
>> allocated, leaking the tail of the allocation.
>>
>> Since commit 751c263bb74f ("arm64: remove TEXT_OFFSET randomization")
> 
> This commit only removed the randomisation. The one you want mentioned
> here is cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0 in preparation for
> removing it entirely"). Although this removing never happened (see more
> below).

You  are right!  we should correct the commit.

> 
>> TEXT_OFFSET is always zero.  This has been upstream since v5.8, so no
>> LTS kernel carries a non-zero text_offset.  Drop the adjustment and
>> reject images with a non-zero value instead of booting them from a
>> wrong address.  With the adjustment gone, segments stay at their CMA
>> base and the release size matches the allocation.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
>> Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
>> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
>> Suggested-by: Mike Rapoport <rppt@kernel.org>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v2:
>> - Split out from the patch set.
>> - Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
>> ---
>>   arch/arm64/kernel/kexec_image.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>> index 78b1f956d8d7..7d6baea3d28f 100644
>> --- a/arch/arm64/kernel/kexec_image.c
>> +++ b/arch/arm64/kernel/kexec_image.c
>> @@ -80,12 +80,17 @@ static void *image_load(struct kimage *image,
>>   	kbuf.bufsz = kernel_len;
>>   	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>   	kbuf.memsz = le64_to_cpu(h->image_size);
>> +	/*
>> +	 * Pre-v5.8 images carry a non-zero text_offset, which is no longer
>> +	 * honored; reject them instead of loading them at a wrong address.
>> +	 */
>>   	text_offset = le64_to_cpu(h->text_offset);
>> +	if (text_offset) {
>> +		pr_err("Unsupported Image text_offset 0x%lx\n", text_offset);
>> +		return ERR_PTR(-ENOEXEC);
>> +	}
> 
> If it's only CMA getting it wrong, can we not just set
> image->no_cma = true here and continue as normal?
> 

Yes, it also works.

I tested this cma problem on QEMU arm64 with cma=64M and an Image header
whose text_offset is 0x80000.
- Without fix , it jump 512K past the CMA copy and never boot;
- With the fix, it loads from normal memory and the second kernel boots.

> While text_offset is 0 now, I don't think we concluded it should be
> deprecated. There was a recent push back on the attempt to document the
> always 0 behaviour:

Thank you! I will fix it with your suggestion.

Best regards,
Jinjie

> 
> https://lore.kernel.org/all/20260604140839.1930847-1-linux@rasmusvillemoes.dk/
> 



