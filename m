Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3160A2631
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3V2jCRQf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mfdm5A7h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=44DfV0bL6HPYkPp0Ecl6fd5OA178t8+1rLF7XPfImuM=; b=3V2jCRQfBWTntB
	lC4GZE0B1qNpS4xR+8e0IvpbjX5DZ5BOms0iWcuAn63U9TZHZxC9G4ARK3t41ZAOqa1vWTuqYb+QI
	j1OSyjc/3nRza3nkX3t7MfsynbB7Kt0OwjXmnUXp+9ZkuhdhBiKl/0ISQ7A/1+XqJPDBUavZWEJbR
	jYfNKWvxTdkqUDD7zxNj4v4iJqttV+zKsdH1jJ/s30Dg8jnM2KX1YlXavZGp/VYOwacqEeIS1kRRT
	OI/FUWG7pZKPLcTRy3rUindwKun+v6qW2QyEthFAJBIuB8Fb5BPIhgmFboLWv6uQH0+lASI+YcpHW
	4dldgXMl1iWptJds9g/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB3G-00000007ATG-4AzC;
	Wed, 11 Nov 2026 16:19:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB3F-00000007ASn-2M2R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:19:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E47963658;
	Wed, 11 Nov 2026 16:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44471F00A06;
	Wed, 11 Nov 2026 16:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794413996;
	bh=44DfV0bL6HPYkPp0Ecl6fd5OA178t8+1rLF7XPfImuM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mfdm5A7hJTz/OLhPk7a/A6xxBAGkInGaTECbYA1+4nh07RbKH900tnmi/4RGbIRze
	 iOqonH/hUJCLKzPRxGnckwjZQi9VpFEIn1+jSeUhDjcV8MClHAlsn0kY9E+KAfGAzb
	 N3mPrnbA3YMG97uzBLieJxwqLGOXD0lOgtbsWBBs+5yuwJiG9Abvc3XKEx22ZFiz7r
	 AIbq7i8/af2+L+3TxRiRhKDDhRhWqmNkTegI13JN4WyQfR3yifYZVfMF3nq1pSkK9J
	 WioB1LY0L1Yeih4BdPe5FErB6zDv5M58dlQZqOxH9otBIt0RHP6ZJcxgPxwuztRr35
	 eYQ/g+U6y+pEA==
Message-ID: <c724e3c3-7acc-4c3e-8410-426c7ca6cf19@kernel.org>
Date: Wed, 11 Nov 2026 17:19:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] dt-bindings: nvme: apple: Add apple,t8142-nvme-ans2
 compatible
To: Yureka <yureka@cyberchaos.dev>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
 <20261106-apple-dts-m4-m5-nvme-v1-3-22f4827b4ece@cyberchaos.dev>
 <20261111-comical-quaint-turaco-e8c1c2@quoll>
 <fb7b4ede-a325-4c5e-a37d-fe3cc7a92f87@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <fb7b4ede-a325-4c5e-a37d-fe3cc7a92f87@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 11/11/26 15:32, Yureka wrote:
> On 11/11/26 13:46, Krzysztof Kozlowski wrote:
>> On Fri, Nov 06, 2026 at 10:04:12PM +0100, Yureka Lilian wrote:
>>> "apple,t8142-nvme-ans2" on the Apple M5 SoC is compatible with
>>> "apple,t8132-nvme-ans2" so add its per-SoC compatible.
>>>
>>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>>> ---
>>>   Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>> Squash all nvmem patches. Don't add compatibles one by one.
>>
>> Best regards,
>> Krzysztof
>
>
> Hello Krzysztof,
>
>
> (replying to all three of your emails here)
>
> thanks for your feedback! I did run `b4 prep --check` and `make 
> dtbs_check` before sending and it passed without warnings on all 15 
> patches of this series. I will now also run `checkpatch.pl --strict` 
> as you suggested.
>
> For v2, I will make one commit per type of dt-binding, so 
> "dt-bindings: nvme: apple: Add t6040,t8140,t8142", and then "mailbox: 
> apple,mailbox: Add t8132,t6040,t8140,t8142", etc., ok or do you have 
> another suggested grouping?
>
> > Please stop inflating this. You are only making it difficult to 
> review your work.
>
> It would be appreciated if you can tell me clearly what is expected, 
> as this statement is not actually telling me what is inflated / wrong.
I think you already understood it: Just one commit for SART, one for 
NVMe, and one for the mailbox bindings that each add all new compatibles 
at once because the hardware (likely) didn't change and there's no need 
to explain what's different from the previous generation.


Thanks,

Sven



