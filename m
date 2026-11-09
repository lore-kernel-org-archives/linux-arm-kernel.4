Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C115460A2623
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A0aOB62V;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NHyLiowQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=; b=A0aOB62VJUbyzD
	oDTXPl04GsvdRb4XjtymjsgAVQXG5fUQQbn8slw83kUdVrNK67TlYR50FdHyWrvVCucYkj7b4SrG9
	Q7T8z9LapsgkB0KHmEiqqzMsNKRxuCVws1I2xqRWfihRWQP7yy01TXzs4jYv7SZRU7IsM4T5hDDuq
	f67WSA11iOaS72OJqiWiZJJrzFnx9yT932W0SZqaZ1rGbdUT4Qe7+CbsIfnvb/Xqg4mKII9Mb1cFC
	2lCcN2ybsiyXmndv8NedExEVsMqFdd8wYcbhDBP1UZbULGgYO/njfzN/poV2MDF++2rA9pesTW9Xu
	HodOx68Iwhzb/3I/eezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVRo-00000001aex-0rkI;
	Mon, 09 Nov 2026 19:54:32 +0000
Received: from mail-vs1-xe64.google.com ([2607:f8b0:4864:20::e64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVRj-00000001adO-1ltq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 19:54:30 +0000
Received: by mail-vs1-xe64.google.com with SMTP id ada2fe7eead31-7cc53938a8fso834748137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 11:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254065; x=1794858865;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=;
        b=UbIReHI0sobkBPL2IQrw3eC3P6QxtzeLtPoqG2QXOwjTreoHcy2sqNNWrIrSyyf1eM
         /fpO1Qc03grZGCruWLDKF3vj1uJU9XoCg74jtgdWq0NgEVmkWkirGWv9/h1xJW/6SfSO
         /QqCUyAnSuKPL603t+MzcCS9/4NzOrfarfrdvdBvQwCOJ1Aox8NBuh3D2qD642s1wXVK
         L2fq/9JD51c+6EUhaHwuCiKlB82Pggb6pngsuCSZNf6YtbOvwwJdIL8X7TRkil1RKTQx
         X+YjScitDY8r88avEp01+HJSrW5xI2PpXql1jXkiGwMsB1sK+Zzs55q+ICL0FTqYF+X9
         5oZQ==
X-Forwarded-Encrypted: i=1; AL+hErECMfZ/RaXQ4JDkMWSxxII9OOG9Gj+b3CHrfzIUwK2ZKO4YMcM2xryV8C5ijLnQFrjrv2J3rB4NWhXQKM+2qzK5@lists.infradead.org
X-Gm-Message-State: APuU4Z86lPQQxxy8uaRXWb2AI4iThmeFeGdIdVCPJGJhhFR/+iXCid75
	EzKJcVVEF2fDMI1YPWOlvYHmSPFSuT5Yb8TXYPn5l7FuocNCGfPqbiKLocEcB6Rr6BtCVNuc48v
	XhH1uWGZZ87YIzEWDtkeBRY6oau0dm5+QUZ7+ebaFTgnjLsPn4a1aOUE6SDcMNlFDLj/vlyo5pS
	BkesB876CwfL8leIqk2+NaN1MSl+K7+aNf1iP1K/Q1+NrB7kw5rSM9d98inQjNvGVijr8PAoYvS
	AgpL8dwGcPRkg8RyrIY3Q9ho9DCVDtf+fY=
X-Gm-Gg: AYBFou3RcBssdTbyYR0JibAkI/0QFhh+wUWq+sao+IB0rwQjYfbXl4vhCuSfMLcOESa
	A1PhP8shACqKi/uaabS7TRDmIaLJ1rlXeYNxAkDFAlmcvBh3YefOe6iCMM5cD5XLX1WdlbnbVlG
	t3AtN0IQx5UOhAbnEZ5HkzJvxiN9q1OXVUUOEq6BMJsg2U8fezCSCxFkffCvU90rEsiXl7dpxPu
	+wsuS4QTI0LmrfyXPu1/v22pg7t/LckZxEe4iKV+0W9CVR2BZ+z/FfwVs8845sXH4B9GL38Sd9a
	bfiNGpjzex9wjenR5Lm/WN7cauBmoHObfNH2kCtQPNm6WCO2C35BgmLET4flFrAKTkadXAV5YLG
	/+qwCc49NHUWCt31mxmvRCxq8QjbKMwdAlDe9kHW0JKy2g67IhUCarPfz2Z8josdIzwyJdJUnVB
	MqWIO/zEAFvvgnOxv/6WQwxO8aPE6/26DtKvJkYtKs
X-Received: by 2002:a05:6102:f11:b0:7ba:9a61:23eb with SMTP id ada2fe7eead31-7d301c1afc1mr131420137.37.1794254065485;
        Mon, 09 Nov 2026 11:54:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c203a71eesm29903241.10.2026.11.09.11.54.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:54:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338ff2cf14so25723621cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 11:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794254065; x=1794858865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQVB3943pYHcY0t4AyG05/dvIpxyl2oT97ja0CIlRK8=;
        b=NHyLiowQVFm/Uld7JpA8MbLEcFpf3sxeIhIqUHkvW/B8RBmaRhmc+TWTmYicgK0CZb
         4awNxO25HmCkIxLuqu/xlWHKzMGOs4ooNDgukJ+WYsK3hUZ/otCKDS3oF9Ffz0BAR8R+
         BJPmfUeITfqIUUZTA/ecBwM2J4fUy0fFxRT8M=
X-Forwarded-Encrypted: i=1; AL+hErFLTAo0AuYQfEbrhOinNafbceKwrYl2Pbc4jEq133X5Dirf72lWi6m6zNwHdo51HMFSj7ccApSo7ogqAun+JF+M@lists.infradead.org
X-Received: by 2002:a05:622a:13d3:b0:535:a5fb:67f6 with SMTP id d75a77b69052e-5552b54d50emr5422721cf.66.1794254064889;
        Mon, 09 Nov 2026 11:54:24 -0800 (PST)
X-Received: by 2002:a05:622a:13d3:b0:535:a5fb:67f6 with SMTP id d75a77b69052e-5552b54d50emr5422271cf.66.1794254064457;
        Mon, 09 Nov 2026 11:54:24 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d8397sm3718296d6.18.2026.11.09.11.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:54:23 -0800 (PST)
Message-ID: <41d87d75-9fb7-4537-bfcf-c00831da5401@broadcom.com>
Date: Mon, 9 Nov 2026 11:54:19 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v4 0/6] Fix SATA support for NSP SoCs
To: Niklas Cassel <cassel@kernel.org>, linux-kernel@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <179405555432.938034.8271032337892944854.b4-ty@kernel.org>
Content-Language: en-US, fr-FR
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
In-Reply-To: <179405555432.938034.8271032337892944854.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_115427_510664_9AC2F440 
X-CRM114-Status: GOOD (  13.45  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 04:45, Niklas Cassel wrote:
> On Thu, 29 Oct 2026 14:25:07 -0700, Florian Fainelli wrote:
>> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
>> which was broken due to a number of things:
>>
>> - the SATA PHY assumed separate PCB windows when a shared one is used
>>    for this generation of SoCs
>> - the clock/reset (IDM) was not being configured by the driver which
>>    meant that depending upon what the boot loader did, or did not, we
>>    could have had the AHCI controller still in reset by then
>> - on some reference boards, the AHCI controller is not DMA coherent,
>>    assuming so leads to all sorts of timeouts, data corruption, etc.
>>
>> [...]
> 
> Applied to libata/linux.git (for-7.5), thanks!
> 
> [2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
>        https://git.kernel.org/libata/linux/c/262e3bbc
> [3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
>        https://git.kernel.org/libata/linux/c/14d30246

Thank you Niklas, Kishon, can you take patch #1 through your PHY tree 
and I will take patches 4-6 through the broadcom ARM SoC trees. Thanks!
-- 
Florian

