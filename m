Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3D9606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OaRD3mNH;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BjBRb7f/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=; b=OaRD3mNHQLjlRZ
	GosUNU3EUVOAmx/N+ILzjVadBWoW3Lr6ITN6yHKnS12r5/Q4TPC1uZ3oEie+yp4vq2IutU2+cxrmQ
	BvNTMt24OlUPXo4NZcd6rCGt0FKvDL/CmSER84zeYxVazJNYGiz6Ra/3u48CC6J4PjUS/Lx8XJ0W/
	vijGg1I0qvc1r0svc0MYWtvV4LHtUZ6s3FC7D05PqIomnw2AecAV2XnS4X26ZMQ5ZvnF+QJN6TIgR
	9WIhRzibCf67WDZD6E5ANtiJaknBVK98FaLFvIegz8AJNHNc7UX4AAjnIp11ty2KJmP/iwLZjV5Uy
	yOqHKFrO0a43jxRQifLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Of-0000000FFAG-3tMR;
	Sat, 14 Nov 2026 03:25:45 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Od-0000000FF9p-2ErT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:25:44 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so867446a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626743; x=1795231543;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
        b=NSE5DoiHzbHssONelCvsnSMmkFYpYAJTmG/tlHTzrflLnAG9SJfeaNJ3eYrCov/dDK
         vT+T1NZDoWLG0bWgf5qbNpkt8twqP52H70OK1vCs6XaV/VQA3P1a9Iu+i91IhsMOpsDe
         U9KoBTmTwRy8MxJzELeD0BlBaPEq8fyJrA7mHvE1X9xv+EM6Z/o+US9Mo87/q40ZjEy8
         yd24YPiBZTLmyq4MWfXTsfRlOweEER9pKO35854P1EBtdi+tJoM1g3Z5oRTi1LU6dPZm
         Q54vlGvqdlFaXd5XZefliEBNJn0kCkA0vXU0ZmnxWdKuCa3RY4hbbNtCrDnfkdMGCU4q
         /V9A==
X-Forwarded-Encrypted: i=1; AL+hErE/eXxn2k/DkGGORfwB7CMgoPawj8COU8wxMbQhQX6h5UxRJ3k1tHWApBgGvxVyfa5Rwm1aXWYkw0brCKjFFwW4@lists.infradead.org
X-Gm-Message-State: APuU4Z9uuQo9K/K1KZ90WGxvd/dQvGC0D6M6Y4G5gyyDWOkkyqBeanR9
	55OM4O4eseJPnQbNDmx3sHa8fYUfyIDTOYv5QvGjugvhGWfmTaas+Wsrpu9H7s2OoCttszM1sfr
	A9gc0vx8UuNgBxJaeRAUKNseL+oIE0KGPwkaPqsMHsgcOT7nOrDFCIVqoS08VteCsbCrajuv4E3
	nD3ieExnAyeqvLvaLKiPZxbo/PvXQ4DqW3xPe3YaxFqitJqvF5xWvpFmGnOf86zgOnATR4M9h+N
	JNc5IfSFyclZdA4IMhNHyE9/I/SL8omXqM=
X-Gm-Gg: AYBFou3MR0DCNxF18LdPyjvzlq+FjbLIo7qWblE0zFpHaSKvseIL3PCq/5GsP+E6sx7
	UfDXzLsbSJu+1CZmpXjkRU6QRmpdTwIUOyHS+/jCZ8uZMBTwtZPvMV7EvhDS9BotOu5Ip5DTvGN
	Hyc9QmSQiL4qEVmSAekNGn6WF4WI8YMwtyDqwyQy3uBEZJPl+9lAQVdIG5RSwE/zrpwERk5xLv+
	2Oj1Pb0ia2JLY7HERR5w5PNpzrlqvzxU+vvzBvsTSyytrOHs8Azuvq4ikEVsQj+J+T6Vw4JKYky
	gc8XGqW8orlQzQeNohWQpfQMC1RQdEZ4rr9uDwxPXVAqaSsvu86rvtSYmB2TLdMt5RlBuZxjhbr
	4y0xkJzfdkQoF8P3QCxyMNHSzTubrBtBd5G4wI8+LFkoRSqkhZB9uSFdVhSbYj4cL
X-Received: by 2002:a17:90b:3b82:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b1b0a46733mr4537113a91.29.1794626742648;
        Fri, 13 Nov 2026 19:25:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e80bsm6666752a91.5.2026.11.13.19.25.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so1895931eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626740; x=1795231540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
        b=BjBRb7f/SaaWxYrYbBpEwjDecUf8KphrroioGVOSwEQHxnbOv2f2yklA0TeY2ZMQpf
         uYC3zEQql9b+YFui6hOhUskk9t4XEairsCdbEcF58z/gJqbmZIHKUi+VvTaX0LTC3nS/
         h/+sqTReBwtbBfMRkQYFqOGs3pdMfd538gbh0=
X-Forwarded-Encrypted: i=1; AL+hErHPTuEFx1it7n4/J/ogD916OVwQrkq82Is7sN8rQsgvBAT1X5RqhxrzN1GL4sFObIhbmWiZALmdLnwql31ocE/D@lists.infradead.org
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr4605138c88.13.1794626738978;
        Fri, 13 Nov 2026 19:25:38 -0800 (PST)
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr4605093c88.13.1794626738111;
        Fri, 13 Nov 2026 19:25:38 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm12632658eec.14.2026.11.13.19.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:37 -0800 (PST)
Message-ID: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
Date: Fri, 13 Nov 2026 19:25:35 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
To: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
 Gaston Gonzalez <gascoar@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu>
 <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192543_569287_3AB04FC3 
X-CRM114-Status: GOOD (  17.22  )
X-Spam-Score: -2.1 (--)
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



On 11/13/2026 10:09 AM, 'Martin Wetterwald' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> On Wed, Nov 4, 2026 at 3:20 PM Martin Wetterwald <martin@wetterwald.eu> wrote:
>>
>> On Thu, Oct 22, 2026 at 3:31 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
>>>> Hi Greg,
>>>> this is a regression introduced by aa125180c673 (via your tree) in
>>>> 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
>>>> 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
>>>> staging-linus would be great. Thanks!
>>>
>>> This is not a staging driver anymore, please route it through the proper
>>> tree after -rc1 is out.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Hi Florian,
>> Now that -rc1 is out, could you take the patch?
>>
>> I've checked 7.4-rc1 and I confirm the issue is still present.
>>
>> Thanks!
>> Martin
> 
> Hi Greg, Florian,
> 
> The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c)
> is currently listed with Florian as maintainer by get_maintainer.pl.
> But Florian tells me he doesn't maintain VCHIQ.
> 
> How to proceed now? This file doesn't seem to have any maintainer as far as I
> understand.
> Any pointer to someone able to take this patch would be appreciated.

Sorry for the lag Martin, I will be taking those patches from now on.
-- 
Florian


